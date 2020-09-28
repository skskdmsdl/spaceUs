package com.kh.spaceus.social;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.spaceus.member.model.service.MemberService;
import com.kh.spaceus.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SocialLoginController {
	
	 /* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
    
    @Autowired
	private MemberService memberService;
 
    //로그인 첫 화면 요청 메소드
    @RequestMapping(value = "/member/memberLoginForm.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String login(Model model, HttpSession session) {
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        log.info("네이버 : {}", naverAuthUrl);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);
 
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
    	
    	//1. 로그인 사용자 정보를 읽어온다.
    	apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
    	/** apiResult json 구조
    	{"resultcode":"00",
    	"message":"success",
    	"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
    	**/
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
    	
    	if(member != null)
    		return "/member/memberLoginForm";
    	
    	
    	
        return "/member/naverMemberEnrollForm";
    }

}
