package com.kh.spaceus.member.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.RandomStringUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spaceus.member.model.service.MemberService;
import com.kh.spaceus.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {
	
	private Logger log = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//프로필
	@RequestMapping("/memberProfile.do")
	public String memberProfile () {
		
		return "member/memberProfile";
	}
	
	//이용내역
	@RequestMapping("/usageHistory.do")
	public String usageHistory () {
		
		return "member/usageHistory";
	}
	
	//위시리스트
	@RequestMapping("/wishList.do")
	public String wishList () {
		
		return "member/wishList";
	}
	
	//쿠폰함
	@RequestMapping("/couponList.do")
	public String couponList () {
		
		return "member/couponList";
	}
	
	//리뷰목록
	@RequestMapping("/reviewList.do")
	public String reviewList () {
		
		return "member/reviewList";
	}
	
	//출석이벤트
	@RequestMapping("/stampEvent.do")
	public String stampEvent () {
		
		return "member/stampEvent";
	}
	
	//로그인 폼
	@RequestMapping("memberLoginForm.do")
	public String memberLoginForm() {
		
		return "member/memberLoginForm";
	}
	
	//로그인
	@RequestMapping("/memberLogin.do")
	public String memberLogin () {
		
		return "redirect:/";
	}
	
	//비밀번호찾기 창
	@RequestMapping("/passwordFinder.do")
	public String passwordFinder() {
		return "member/passwordFinder";
	}
	
	//로그아웃
	@RequestMapping("/memberLogout.do")
	public String memberLogout() {
		return "redirect:/";
	}
	
	//회원가입
	@RequestMapping("/memberEnrollForm.do")
	public String memberEnroll() {
		
		return "member/memberEnrollForm";
	}
	
	//이메일중복검사
	@GetMapping("/checkEmailDuplicate.do")
	  
	@ResponseBody public Map<String, Object> checkEmailDuplicate
			(@RequestParam("memberEmail") String memberEmail) {
	
	Member member = memberService.selectOneMember(memberEmail);
	boolean isUsable = member == null;
	
	Map<String, Object> map = new HashMap<>();
	map.put("isUsable", isUsable);
	map.put("memberEmail", memberEmail);
	
	return map;
	
	}
	
	//닉네임중복검사
	@GetMapping("/checkNickNameDuplicate.do")
	@ResponseBody
	public Map<String, Object> checkNickNameDuplicate
				(@RequestParam("nickName") String nickName) {
		
	Member member = memberService.selectOneNickName(nickName);
	boolean isUsable = member == null;
	
	Map<String, Object> map = new HashMap<>();
	map.put("isUsable", isUsable);
	map.put("nickName", nickName);
	
	return map;
		
	}
	 
	//휴대폰인증전송
	@RequestMapping("/sendSms.do")
	@ResponseBody
	public HashMap<String, String> sendSms(HttpServletRequest request, @RequestParam("phone") String phone) throws Exception {
		
		String api_key = "NCS6NKC9PWO2KDJA";
	    String api_secret = "4NQ8EPL3E7ASKRNC54XECT5NTXMB0EPB";
	    String phoneChk = RandomStringUtils.randomNumeric(4);
	    
	    Message coolsms = new Message(api_key, api_secret);

	    HashMap<String, String> params = new HashMap<>();
	    params.put("to", phone);
	    params.put("from", "01045049209"); //무조건 자기번호 (인증)
	    params.put("type", "SMS");
	    params.put("text", phoneChk);
	    params.put("app_version", "spaceUs"); // application name and version

	    try {
    	//send() 는 메시지를 보내는 함수 
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      log.debug(obj.toString());
	    } catch (CoolsmsException e) {
	      log.error("error", e);
	  }
		return params;
	}

	@RequestMapping(value = "/memberEnroll.do",
			method = RequestMethod.POST)
	public String memberEnroll(Member member, RedirectAttributes redirectAttr) {
		
		log.debug("member@controller = {}", member);
		
		String rawPassword = member.getPassword();
		String encryptPassword = bcryptPasswordEncoder.encode(rawPassword);
		member.setPassword(encryptPassword);
		
		log.debug("rawPassword@controller = {}", rawPassword);
		log.debug("encryptPassword@controller = {}", encryptPassword);
		
		int result = memberService.insertMember(member);
		
		log.debug("result@controller =", result);
		
		String msg = (result > 0) ? "회원가입 성공!" : "회원가입 실패!";
		redirectAttr.addFlashAttribute("msg", msg);
		
		return "member/memberLoginForm";
	}
	
	/*
	 * @InitBinder public void initBinder(WebDataBinder binder) { SimpleDateFormat
	 * sdf = new SimpleDateFormat("yyyy-MM-dd");
	 * binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true)); }
	 */
}
