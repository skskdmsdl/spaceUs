package com.kh.spaceus.social;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.MissingAuthorizationException;
import org.springframework.social.connect.Connection;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.User;
import org.springframework.social.facebook.api.UserOperations;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.spaceus.member.model.service.MemberService;
import com.kh.spaceus.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SocialLoginController {
	
	//네이버로그인관련
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
    
    //카카오 로그인관련
    @Autowired
    private KakaoController kakaoController;
    
    //페이스북 로그인 관련
    @Autowired
    private FacebookConnectionFactory connectionFactory;
    @Autowired
    private OAuth2Parameters oAuth2Parameters;
 
    
    @Autowired
	private MemberService memberService;
 
    //로그인 첫 화면 요청 메소드
    @RequestMapping(value = "/member/memberLoginForm.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String login(Model model, HttpSession session) {
        //네이버 인증url 생성
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //카카오 인증url 생성
        String kakaoUrl = kakaoController.getAuthorizationUrl(session);
        
        //페이스북 인증url 생성
        OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
        String facebook_url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters);
        
        //네이버 
        model.addAttribute("naver_url", naverAuthUrl);
        
        //카카오
        model.addAttribute("kakao_url", kakaoUrl);
        
        //페이스북
        model.addAttribute("facebook_url", facebook_url);
 
        /* 생성한 인증 URL을 View로 전달 */
        return "/member/memberLoginForm";
    	
    }
 
    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(RedirectAttributes redirectAttr, Model model,
    						@RequestParam String code, @RequestParam String state, HttpSession session)
            throws IOException, ParseException {
    	
    	OAuth2AccessToken oauthToken;	
    	oauthToken = naverLoginBO.getAccessToken(session, code, state);
    	
    	//1. 로그인 사용자 정보를 읽어옴.
    	apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
    	//2. String형식인 apiResult를 json형태로 바꿈
    	JSONParser parser = new JSONParser();
    	Object obj = parser.parse(apiResult);
    	JSONObject jsonObj = (JSONObject) obj;
    	
    	//3. 데이터 파싱
    	//response 파싱
    	JSONObject response_obj = (JSONObject)jsonObj.get("response");
//    	//response의 email값 파싱
    	String memberEmail = (String)response_obj.get("email");
    	log.info("memberEmail = {}", memberEmail);
    	
    	
    	//4.모델에 저장 
    	model.addAttribute("naverLoginMember", response_obj);
    	session.setAttribute("memberEmail", memberEmail);
    	//log.info("naverLoginMember = {}", response_obj);
    	
    	//이메일이 이미 가입되어있을 경우 로그인으로 가게 함
    	Member member = memberService.selectOneMember(memberEmail);
    	//log.info("member = {}", member);
    	
    	if(member != null) {
    		return "/member/memberLoginForm";
    	}
        return "/member/naverMemberEnrollForm";
    }
    
    @RequestMapping("/member/kakaoLogin.do")
    public String getKakaoSignIn(Model model,@RequestParam("code") String code, HttpSession session) throws Exception {

      log.info("code = {}", code);
		
      JsonNode userInfo = kakaoController.getKakaoUserInfo(code);
	  JsonNode accessToken = userInfo.get("access_token");
      
	  log.info("userInfo = {}", userInfo);

      String email = userInfo.get("kaccount_email").toString();
      String nickname = userInfo.get("properties").get("nickname").toString();

      log.debug("email = {}", email);
      log.debug("nickname = {}", nickname);

      model.addAttribute("k_userInfo", userInfo);
      model.addAttribute("email", email);
      model.addAttribute("nickname", nickname);

      return "/member/kakaoMemberEnrollForm";
    }
    
    
    //페이스북 콜백
    @RequestMapping(value = "/facebookSignInCallback", method = { RequestMethod.GET, RequestMethod.POST })
    public String facebookSignInCallback(Model model, @RequestParam String code) throws Exception {
 
        try {
             String redirectUri = oAuth2Parameters.getRedirectUri();
             log.info("Redirect URI  = {}", java.net.URLEncoder.encode(redirectUri));
             log.info("Code  = {}", code);
 
            OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
            AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, redirectUri, null);
            String accessToken = accessGrant.getAccessToken();
            log.info("AccessToken  = {}", accessToken);
            Long expireTime = accessGrant.getExpireTime();
        
            
            if (expireTime != null && expireTime < System.currentTimeMillis()) {
                accessToken = accessGrant.getRefreshToken();
                log.info("accessToken is expired. refresh token = {}", accessToken);
            };
            
        
            Connection<Facebook> connection = connectionFactory.createConnection(accessGrant);
            Facebook facebook = connection == null ? new FacebookTemplate(accessToken) : connection.getApi();
            UserOperations userOperations = facebook.userOperations();
            
            try
 
            {            
                String [] fields = { "id", "email",  "name"};
                User userProfile = facebook.fetchObject("me", User.class, fields);
                log.info("유저이메일 = {}", userProfile.getEmail());
                log.info("유저 id  = {}", userProfile.getId());
                log.info("유저 name = {}", userProfile.getName());
                
                model.addAttribute("email", userProfile.getEmail());
                model.addAttribute("name", userProfile.getName());
                
            } catch (MissingAuthorizationException e) {
                e.printStackTrace();
            }
 
        
        } catch (Exception e) {
 
            e.printStackTrace();
 
        }
        return "/member/facebookMemberEnrollForm";
 
    }

   
}
