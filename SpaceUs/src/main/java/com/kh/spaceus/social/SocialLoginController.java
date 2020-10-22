package com.kh.spaceus.social;

import java.io.IOException;
import java.util.Collections;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.kh.spaceus.member.model.service.MemberService;
import com.kh.spaceus.member.model.vo.Member;

import antlr.StringUtils;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SocialLoginController {

	// 네이버로그인관련
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	// 카카오 로그인관련
	@Autowired
	private KakaoController kakaoController;

	@Autowired
	private MemberService memberService;

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/member/memberLoginForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		// 네이버 인증url 생성
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		// 카카오 인증url 생성
		String kakaoUrl = kakaoController.getAuthorizationUrl(session);

		// 네이버
		model.addAttribute("naver_url", naverAuthUrl);

		// 카카오
		model.addAttribute("kakao_url", kakaoUrl);

		/* 생성한 인증 URL을 View로 전달 */
		return "/member/memberLoginForm";

	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(RedirectAttributes redirectAttr, Model model, @RequestParam String code,
			@RequestParam String state, HttpSession session) throws IOException, ParseException {

		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);

		// 1. 로그인 사용자 정보를 읽어옴.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터

		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		// 3. 데이터 파싱
		// response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");

//    	//response의 email값 파싱
		String email = (String) response_obj.get("email");
		// log.info("email = {}", email);

		// 4.모델에 저장
		model.addAttribute("email", email);
		model.addAttribute("site", "네이버");
		model.addAttribute("closeFunction", "closeFunction");

		// 이메일이 이미 가입되어있을 경우 로그인으로 가게 함
		Member member = memberService.selectOneMember(email);
		// log.info("member = {}", member);

		if (member != null) {
			return "/member/memberLoginForm";
		} else {
			String returnPath = "/member/socialMemberEnrollForm";
			model.addAttribute("returnPath", "returnPath");
			model.addAttribute("code", code);
			model.addAttribute("state", state);
			// log.info("returnPath = {}", returnPath);

			return returnPath;
		}
	}

	// 카카오 콜백
	@RequestMapping("/member/kakaoLogin.do")
	public String getKakaoSignIn(RedirectAttributes redirectAttr, Model model, @RequestParam("code") String code,
			HttpSession session) throws Exception {

		log.info("code = {}", code);

		JsonNode userInfo = kakaoController.getKakaoUserInfo(code);
		JsonNode accessToken = userInfo.get("access_token");

		log.info("userInfo = {}", userInfo);

		// 여기서부터 오류
		String email = userInfo.get("kakao_account").get("email").asText();
		String nickname = userInfo.get("properties").get("nickname").asText();

		log.info("email = {}", email);
		log.info("nickname = {}", nickname);

		model.addAttribute("email", email);
		model.addAttribute("site", "카카오");
		model.addAttribute("code", code);
		model.addAttribute("closeFunction", "closeFunction");

		// 이메일이 이미 가입되어있을 경우 로그인으로 가게 함
		Member member = memberService.selectOneMember(email);
		// log.info("member = {}", member);

		if (member != null) {
			return "/member/memberLoginForm";
		}

		return "/member/socialMemberEnrollForm";
	}

	/**
	 * Google 토큰인증 클라이언트 ID
	 * 398489879454-c5aqb8i12qv1gku3dgtt31fd8iogm2hd.apps.googleusercontent.com
	 * 클라이언트 보안 비밀 E5imBrQzrkyvHBqapPMFjS45
	 * 
	 * @param model
	 * @param idtoken
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/member/googleLogin.do")
	public String getGoogleSignIn(Model model, @RequestParam("idtoken") String idtoken,
			@RequestParam(required = false) String email, @RequestParam(required = false) String tokenEmail,
			HttpSession session) throws Exception {
		System.out.println("@@@@@@@@"+tokenEmail);
		System.out.println("@@@@@@@@"+email);
		HttpTransport httpTransport = GoogleNetHttpTransport.newTrustedTransport();
		JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(httpTransport, JSON_FACTORY)
				// Specify the CLIENT_ID of the app that accesses the backend:
				.setAudience(Collections
						.singletonList("398489879454-c5aqb8i12qv1gku3dgtt31fd8iogm2hd.apps.googleusercontent.com"))
				// Or, if multiple clients access the backend:
				// .setAudience(Arrays.asList(CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3))
				.build();

		// (Receive idTokenString by HTTPS POST)

		GoogleIdToken idToken = verifier.verify(idtoken);
		String userId = null;
		String name = null;

		if (idToken != null) {
			Payload payload = idToken.getPayload();
			userId = payload.getSubject();
			name = (String) payload.get("name");
			// log.info("name = {}", name);
			// log.info("email = {}", email);
		} else {
			log.info("Invalid ID token.");
		}

		// 이메일이 이미 가입되어있을 경우 로그인으로 가게 함
		Member member = memberService.selectOneMember(email);
		log.info("member = {}", member);

		if (member != null) { // 이미 가입
			model.addAttribute("email", email);
			return "/member/memberLoginForm";
		}
		model.addAttribute("email", email);
		model.addAttribute("site", "구글");
		return "/member/socialMemberEnrollForm";
	}
}
