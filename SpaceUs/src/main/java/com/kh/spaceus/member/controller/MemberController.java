package com.kh.spaceus.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.RandomStringUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spaceus.member.model.service.MemberService;
import com.kh.spaceus.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@Slf4j
@RequestMapping("/member")
@SessionAttributes(value = { "nickName" })
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@Autowired
	private JavaMailSender mailSender;

	// 프로필
	@RequestMapping("/memberProfile.do")
	public String memberProfile(HttpSession session, Model model) {
			/** Model model, HttpServletRequest request) {
		/*
		 * Member member = (Member)request.getSession().getAttribute("loginMember");
		 * model.addAttribute("loginMember", member);
		 */
		
		
		return "member/memberProfile";
	}

	// 이용내역
	@RequestMapping("/usageHistory.do")
	public String usageHistory() {

		return "member/usageHistory";
	}

	// 위시리스트
	@RequestMapping("/wishList.do")
	public String wishList() {

		return "member/wishList";
	}

	// 쿠폰함
	@RequestMapping("/couponList.do")
	public String couponList() {

		return "member/couponList";
	}

	// 리뷰목록
	@RequestMapping("/reviewList.do")
	public String reviewList() {

		return "member/reviewList";
	}

	// 출석이벤트
	@RequestMapping("/stampEvent.do")
	public String stampEvent() {

		return "member/stampEvent";
	}

	// 로그인 폼
//	@RequestMapping("memberLoginForm.do")
//	public String memberLoginForm() {
//
//		System.out.println("memberLoginForm.do...");
//		return "member/memberLoginForm";
//	}

	// 로그인

	@RequestMapping(value = "/memberLogin.do", method = RequestMethod.POST)
	public String memberLogin(@RequestParam String memberEmail, @RequestParam String password, Model model,
			RedirectAttributes redirectAttr, HttpSession session, HttpServletRequest request) {

		Member member = memberService.selectOneMember(memberEmail);
		System.out.println("member@controller = " + member);

		String referer = request.getHeader("referer");

		// 로그인 성공
		if (member != null && bcryptPasswordEncoder.matches(password, member.getPassword())) {
			model.addAttribute("loginMember", member);
			System.out.println("member" + member);

			// 로그인 실패
		} else {
			redirectAttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		return "redirect:" + referer;
	}

	@PostMapping("/memberLoginFailure.do")
	public String memberLoginFailure(RedirectAttributes redirectAttr) {

		redirectAttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");

		return "redirect:/member/memberLoginForm.do";
	}

	// 비밀번호찾기 창
	@RequestMapping("/passwordFinder.do")
	public String passwordFinder() {
		return "member/passwordFinder";
	}

	// 비밀번호찾기 메일보내기
	@RequestMapping(value = "/sendMail.do")
	public String mailSending(HttpServletRequest request, RedirectAttributes redirectAttr,
			@RequestParam("tomail") String tomail) {

		// 랜덤비밀번호
		String newPassword = RandomStringUtils.randomAlphabetic(8);
		// 랜덤비밀번호 암호화처리
		String encryptedNewPassword = bcryptPasswordEncoder.encode(newPassword);

		String setfrom = "noreply.spaceus@gmail.com";
		String title = "SpaceUs : 임시비밀번호";
		String content = "새로운 비밀번호 : " + newPassword + "\n";
		content += "새로운 비밀번호로 로그인 후 비밀번호를 변경해주세요";

		// 이메일확인
		Member member = memberService.selectOneMember(tomail);

		if (member != null) {
			Map<String, Object> param = new HashMap<>();
			param.put("tomail", tomail);
			param.put("encryptedNewPassword", encryptedNewPassword);

			// 비밀번호를 임시비밀번호로 변경
			int result = memberService.updatePassword(param);

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom(setfrom);
				messageHelper.setTo(tomail);
				messageHelper.setSubject(title);
				messageHelper.setText(content);

				mailSender.send(message);
				redirectAttr.addFlashAttribute("msg", "이메일이 전송되었습니다.");
				redirectAttr.addFlashAttribute("script", "self.close();");

			} catch (Exception e) {
				log.error("e = {}", e);
			}
		} else {
			redirectAttr.addFlashAttribute("msg", "등록된 이메일이 없습니다.");
		}
		return "redirect:/member/passwordFinder.do";
	}

	// 로그아웃
	@RequestMapping("/memberLogout.do")
	public String memberLogout() {
		return "redirect:/";
	}

	// 회원가입
	@RequestMapping("/memberEnrollForm.do")
	public String memberEnroll() {

		return "member/memberEnrollForm";
	}

	// 이메일중복검사
	@GetMapping("/checkEmailDuplicate.do")

	@ResponseBody
	public Map<String, Object> checkEmailDuplicate(@RequestParam("memberEmail") String memberEmail) {

		Member member = memberService.selectOneMember(memberEmail);
		boolean isUsable = member == null;

		Map<String, Object> map = new HashMap<>();
		map.put("isUsable", isUsable);
		map.put("memberEmail", memberEmail);

		return map;
	}

	// 닉네임중복검사
	@GetMapping("/checkNickNameDuplicate.do")
	@ResponseBody
	public Map<String, Object> checkNickNameDuplicate(@RequestParam("nickName") String nickName) {

		Member member = memberService.selectOneNickName(nickName);
		boolean isUsable = member == null;

		Map<String, Object> map = new HashMap<>();
		map.put("isUsable", isUsable);
		map.put("nickName", nickName);

		return map;
	}

	// 휴대폰인증전송
	@RequestMapping("/sendSms.do")
	@ResponseBody
	public HashMap<String, String> sendSms(HttpServletRequest request, RedirectAttributes redirectAttr,
			@RequestParam("phone") String phone) throws Exception {

		String api_key = "NCS6NKC9PWO2KDJA";
		String api_secret = "4NQ8EPL3E7ASKRNC54XECT5NTXMB0EPB";
		String phoneChk = RandomStringUtils.randomNumeric(4);

		Message coolsms = new Message(api_key, api_secret);

		Member member = memberService.selectOnePhone(phone);
		log.info("phoneChk = {}", phoneChk);
		log.info("member = {}", member);

		HashMap<String, String> params = new HashMap<>();

		if (member == null) {
			params.put("to", phone);
			params.put("from", "01045049209"); // 무조건 자기번호 (인증)
			params.put("type", "SMS");
			params.put("text", phoneChk);
			params.put("app_version", "spaceUs"); // application name and version

			try {
				JSONObject obj = (JSONObject) coolsms.send(params);
				log.debug(obj.toString());
			} catch (CoolsmsException e) {
				log.error("error", e);
			}
		}

		return params;
	}

	@RequestMapping(value = "/memberEnroll.do", method = RequestMethod.POST)
	public String memberEnroll(Member member, RedirectAttributes redirectAttr) {

		String rawPassword = member.getPassword();
		String encryptPassword = bcryptPasswordEncoder.encode(rawPassword);
		member.setPassword(encryptPassword);

//		log.debug("rawPassword@controller = {}", rawPassword);
//		log.debug("encryptPassword@controller = {}", encryptPassword);

		int result = memberService.insertMember(member);

//		log.debug("result@controller =", result);

		String msg = (result > 0) ? "회원가입 성공!" : "회원가입 실패!";
		redirectAttr.addFlashAttribute("msg", msg);

//		return "member/memberLoginForm";
		return "redirect:/member/memberLoginForm.do";
	}
}
