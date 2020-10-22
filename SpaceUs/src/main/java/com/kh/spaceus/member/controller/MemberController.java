package com.kh.spaceus.member.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.RandomStringUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spaceus.common.Utils;
import com.kh.spaceus.community.group.model.vo.GroupBoard;
import com.kh.spaceus.member.model.service.MemberService;
import com.kh.spaceus.member.model.vo.Coupon;
import com.kh.spaceus.member.model.vo.Member;
import com.kh.spaceus.reservation.model.service.ReservationService;
import com.kh.spaceus.reservation.model.vo.Reservation;
import com.kh.spaceus.space.model.service.SpaceService;
import com.kh.spaceus.space.model.vo.Review;
import com.kh.spaceus.space.model.vo.ReviewAttachment;
import com.kh.spaceus.space.model.vo.Space;
import com.kh.spaceus.space.model.vo.Wish;

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
	private SpaceService spaceService;
	
	@Autowired
	private ReservationService reservationService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@Autowired
	private JavaMailSender mailSender;

	//헤더
	@RequestMapping(value="/header.do", produces="application/json;charset=utf8" )
	@ResponseBody
	public ModelAndView header (ModelAndView mav, Principal principal) {
		Member member = memberService.selectOneMember(principal.getName());
		String nickName = member.getNickName();
		System.out.println(nickName);
		mav.addObject("nickName", nickName);
		mav.setViewName("jsonView");		
		return mav;
	}
	
	// 프로필
	@RequestMapping("/memberProfile.do")
	public String memberProfile (Model model, Principal principal) {
		Member member = memberService.selectOneMember(principal.getName());
		model.addAttribute("member", member);
		return "member/memberProfile";
	}
	
	//탈퇴
	@RequestMapping("/deleteMember.do")
	public String deleteMember (@RequestParam("memberEmail") String memberEmail,
								RedirectAttributes redirectAttr, SessionStatus sessionStatus, Model model) {
		int result = memberService.deleteMember(memberEmail);
		
		String msg = "";
		
		if(result>0) {
			
			msg = "성공적으로 회원정보를 삭제했습니다.";
			
			SecurityContextHolder.clearContext();
		}
		else 
			msg = "회원정보 삭제를 실패했습니다.";
			
		
		model.addAttribute("msg", msg);
		return "redirect:/";

		}
	
	// 이용내역
	@RequestMapping("/usageHistory.do")
	public ModelAndView usageHistory(Principal principal, ModelAndView mav, Model model, HttpServletRequest request,
			 @RequestParam(defaultValue = "1", value="cPage") int cPage) {

		//페이징처리
		final int limit = 5;
		int offset = (cPage -1) * limit;
	
		List<Reservation> revList = reservationService.reservationPaging(limit,offset,principal.getName());
		List<Space> spaceList = new ArrayList<Space>();
		
		for(int i=0; i<revList.size(); i++) {
			Space space = spaceService.selectOneSpace(revList.get(i).getSpaceNo());
			spaceList.add(space);
		}
		
		int totalCnt = reservationService.selectTotalCnt(principal.getName());
		String url = request.getRequestURI() + "?";
		String pageBar = Utils.getPageBarHtml(cPage, limit, totalCnt, url);
		
		model.addAttribute("status", "all");
		mav.addObject("revList",revList);
		mav.addObject("spaceList",spaceList);
		
		mav.addObject("totalCnt", totalCnt);	
		mav.addObject("pageBar", pageBar);
		
		mav.setViewName("member/usageHistory");
		return mav;
	}
	
	@RequestMapping("/usageIng.do")
	public ModelAndView usageIng(Principal principal, ModelAndView mav, Model model, @RequestParam(defaultValue = "1", value="cPage") int cPage,
			 HttpServletRequest request) {
		
		//페이징처리
		final int limit = 5;
		int offset = (cPage -1) * limit;

		List<Reservation> revList = reservationService.ingReservation(limit,offset,principal.getName());
		List<Space> spaceList = new ArrayList<Space>();
		
		for(int i=0; i<revList.size(); i++) {
			Space space = spaceService.selectOneSpace(revList.get(i).getSpaceNo());
			spaceList.add(space);
		}
		
		int totalCnt = reservationService.selectingReservationTotalCnt(principal.getName());
		String url = request.getRequestURI() + "?";
		String pageBar = Utils.getPageBarHtml(cPage, limit, totalCnt, url);
		
		model.addAttribute("status", "ing");
		mav.addObject("revList",revList);
		mav.addObject("spaceList",spaceList);
		
		mav.addObject("totalCnt", totalCnt);	
		mav.addObject("pageBar", pageBar);
		
		mav.setViewName("member/usageHistory");
		return mav;

	}


	@RequestMapping("/usageFinish.do")
	public ModelAndView usageFinish(Principal principal, ModelAndView mav, Model model) {

		List<Reservation> revList = reservationService.finishReservation(principal.getName());
		List<Space> spaceList = new ArrayList<Space>();
		
		for(int i=0; i<revList.size(); i++) {
			Space space = spaceService.selectOneSpace(revList.get(i).getSpaceNo());
			spaceList.add(space);
		}
		
		model.addAttribute("status", "finish");
		mav.addObject("revList",revList);
		mav.addObject("spaceList",spaceList);
		mav.setViewName("member/usageHistory");
		return mav;

	}

	// 위시리스트
	@RequestMapping("/wishList.do")
	public String wishList(Principal principal, Model model, HttpServletRequest request,
			@RequestParam(defaultValue = "1", value = "cPage") int cPage) {
		
		final int limit = 12; 
		int offset = (cPage - 1) * limit;
		
		List<Wish> list = memberService.selectWishList(principal.getName());
		
		int totalContents = memberService.selectWishTotal(principal.getName()); 
		String url = request.getRequestURI() + "?";
		String pageBar = Utils.getPageBarHtml(cPage, limit, totalContents, url);
		
		model.addAttribute("wlist", list);
		model.addAttribute("pageBar", pageBar);
		return "member/wishList";
	}
	
	//위시리스트 삭제
		@RequestMapping("/deleteWish.do")
		public String deleteWish(Wish wish, HttpServletResponse response, RedirectAttributes redirectAttr) {

			int result1 = spaceService.deleteWish(wish);
			spaceService.minusLikeCnt(wish);
			String msg = (result1>0) ? "위시 삭제 성공!" : "위시 삭제 실패";

			redirectAttr.addFlashAttribute("msg", msg);

			return "redirect:/member/wishList.do";
		}

	// 쿠폰함
	@RequestMapping("/couponList.do")
	public String couponList(Principal principal, Model model) {
		List<Coupon> coupon = memberService.selectCouponList(principal.getName());
		
		model.addAttribute("coupon", coupon);
		return "member/couponList";
	}

	// 리뷰목록
	@RequestMapping("/reviewList.do")
	public String reviewList (Model model, Principal principal) {
		Member member = memberService.selectOneMember(principal.getName());
		//예약테이블 조회 -> 해당 아이디의 모든 예약번호 조회 + 공간정보 가져오기
		/*List<Reservation> revList = reservationService.selectListReservation(principal.getName());*/
		List<Space> spaceList = spaceService.selectReviewList(principal.getName());
		
		for(Space s : spaceList) {
			System.out.println(s.getReviewComment());
			System.out.println(s.getSpaceNo());
			System.out.println(s.getRevNo());
		}
		
		model.addAttribute("spaceList", spaceList);
		model.addAttribute("member", member);
		model.addAttribute("status", "all");
		return "member/reviewList";
	}
	
	@RequestMapping("/reviewPossible.do")
	public String reviewPossible (Model model, Principal principal) {
		Member member = memberService.selectOneMember(principal.getName());
		List<Space> spaceList = spaceService.selectReviewPossible(principal.getName());
		
		System.out.println("@2"+spaceList); 
		
		model.addAttribute("spaceList", spaceList);
		model.addAttribute("member", member);
		model.addAttribute("status", "possible");
		return "member/reviewList";
	}
	
	@RequestMapping("/reviewComplete.do")
	public String reviewComplete (Model model, Principal principal) {
		Member member = memberService.selectOneMember(principal.getName());
		List<Space> spaceList = spaceService.selectReviewComplete(principal.getName());
		
		System.out.println("@2"+spaceList); 
		
		model.addAttribute("spaceList", spaceList);
		model.addAttribute("member", member);
		model.addAttribute("status", "complete");
		return "member/reviewList";
	}

	// 출석이벤트
	@RequestMapping("/stampEvent.do")
	public String stampEvent(Principal principal, Model model) {
		//오늘클릭여부 조회
		Member member = memberService.selectOneMember(principal.getName()); 
		
		model.addAttribute("member", member);
		return "member/stampEvent";
	}
	
	//출석이벤트
	@GetMapping("/insertStamp.do")
	@ResponseBody
	public ModelAndView insertStamp(ModelAndView mav,
									@RequestParam("memberEmail") String email) {
		int result = memberService.updateStamp(email);

		mav.setViewName("jsonView");

		return mav;
	}
	
	

//	**이쪽은 지우지 말기!!// 로그인 폼
//	@RequestMapping("/memberLoginForm.do")
//	public String memberLoginForm() {
//
//		System.out.println("memberLoginForm.do...");
//		return "member/memberLoginForm";
//	}
//
//	// 로그인
//
//	@RequestMapping(value = "/memberLogin.do", method = RequestMethod.POST)
//	public String memberLogin(@RequestParam String memberEmail, @RequestParam String password, Model model,
//			RedirectAttributes redirectAttr, HttpSession session, HttpServletRequest request) {
//
//		Member member = memberService.selectOneMember(memberEmail);
//		System.out.println("member@controller = " + member);
//
//		String referer = request.getHeader("referer");
//
//		// 로그인 성공
//		if (member != null && bcryptPasswordEncoder.matches(password, member.getPassword())) {
//			model.addAttribute("loginMember", member);
//			System.out.println("member" + member);
//
//			// 로그인 실패
//		} else {
//			redirectAttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
//		}
//		return "redirect:" + referer;
//	}

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
		String title = "[SpaceUs] 계정의 임시 비밀번호";
		
		String content = "<div style=\"display: block; margin: 30px;\"><img src=\"https://i.imgur.com/NBgCFoR.png\" width=\"66\" height=\"66\" /></div>\r\n" + 
				"<table style=\"width:600px;\">\r\n" + 
				"<thead></thead>\r\n" + 
				"<tbody>\r\n" + 
				"<tr style=\"height: 18px;\">\r\n" + 
				"<td style=\"height: 18px;\">&nbsp;</td>\r\n" + 
				"</tr>\r\n" + 
				"<tr style=\"height: 18px;\">\r\n" + 
				"<td style=\"height: 18px;\">&nbsp;</td>\r\n" + 
				"</tr>\r\n" + 
				"<tr style=\"height: 18px;\">\r\n" + 
				"<td style=\"height: 18px;\">&nbsp;</td>\r\n" + 
				"</tr>\r\n" + 
				"<tr style=\"height: 18px;\" align=\"center\">\r\n" + 
				"<td style=\"height: 18px;\"><span style=\"font-family: Montserrat-Bold;\"><strong>회원님께서 임시로 사용하실 수 있는 비밀번호를 재발급하여 안내드립니다.</strong></span></td>\r\n" + 
				"</tr>\r\n" + 
				"<tr style=\"height: 15px;\">\r\n" + 
				"<td style=\"height: 15px;\">&nbsp;</td>\r\n" + 
				"</tr>\r\n" + 
				"<tr style=\"background-color: #00c89e; height: 52.9px;\" align=\"center\">\r\n" + 
				"<td style=\"height: 52.9px;\"><strong><span style=\"color: #ffffff; font-family: Montserrat-Bold;\">새로운 비밀번호: "+newPassword+
				"</span></strong></td>\r\n" + 
				"</tr>\r\n" + 
				"<tr style=\"height: 18px;\">\r\n" + 
				"<td style=\"height: 18px;\">&nbsp;</td>\r\n" + 
				"</tr>\r\n" + 
				"<tr style=\"height: 18px;\" align=\"center\">\r\n" + 
				"<td style=\"height: 18px;\"><strong>회원님이 맞는 경우:</strong> 임시 비밀번호로 로그인한 뒤 비밀번호를 변경해주세요!</td>\r\n" + 
				"</tr>\r\n" + 
				"<tr style=\"height: 18px;\">\r\n" + 
				"<td style=\"height: 18px;\">&nbsp;</td>\r\n" + 
				"</tr>\r\n" + 
				"<tr style=\"height: 55px;\" align=\"center\">\r\n" + 
				"<td style=\"height: 55px;\"><strong>회원님이 아닌 경우:</strong> 누군가 회원님의 로그인 정보를 알아내어 계정에 액세스했습니다. 계정 보호를 위해 비밀번호를 재설정하세요. 또한 KakaoTalk, Google, Naver 등 연결된 소셜 미디어 계정에 의심스러운 활동이 없는지 확인하세요.</td>\r\n" + 
				"</tr>\r\n" + 
				"<tr style=\"height: 18px;\">\r\n" + 
				"<td style=\"height: 18px;\">&nbsp;</td>\r\n" + 
				"</tr>\r\n" + 
				"<tr style=\"height: 26px;\" align=\"center\">\r\n" + 
				"<td style=\"height: 26px;\"><span style=\"color: #00c89e; font-size: 20px;\">SpaceUs</span></td>\r\n" + 
				"</tr>\r\n" + 
				"<tr style=\"height: 18px;\">\r\n" + 
				"<td style=\"text-align: center; height: 18px;\"><span style=\"color: #333333;\">서울시 강남구 테헤란로 10길 9</span></td>\r\n" + 
				"</tr>\r\n" + 
				"<tr style=\"height: 18px;\">\r\n" + 
				"<td style=\"text-align: center; height: 18px;\">tel. 1235 2355 98</td>\r\n" + 
				"</tr>\r\n" + 
				"</tbody>\r\n" + 
				"</table>\r\n" + 
				"<p>&nbsp;</p>";		

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
				message.setHeader("content-type", "text/html; charset=utf-8");
				message.setContent(content, "text/html;charset=euc-kr");
				
				messageHelper.setFrom(setfrom);
				messageHelper.setTo(tomail);
				messageHelper.setSubject(title);
			

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
		System.out.println(nickName);
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
		
		String api_key = "NCSCE6UYF5ENLSNF";
		String api_secret = "WBPW8N0BWEWOGVYGYMNKNGQEB6QFPZZH";
		String phoneChk = RandomStringUtils.randomNumeric(4);
		
		Message coolsms = new Message(api_key, api_secret);

		Member member = memberService.selectOnePhone(phone);
		
		log.info("phoneChk = {}", phoneChk);
		log.info("member = {}", member);

		HashMap<String, String> params = new HashMap<>();

		if (member == null) {
			params.put("to", phone);
			params.put("from", "01048179843"); // 무조건 자기번호 (인증)
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
	
	@PostMapping("/insertReview.do")
	public String insertReview(Review review,
							  @RequestParam("spaceNo") String spaceNo,
							  @RequestParam("revNo") String revNo,
							  @RequestParam(value="upFile",required=false) MultipartFile[] upFiles,
							  HttpServletRequest request,
							  RedirectAttributes redirectAttr) {
		
		//1. 파일을 서버컴퓨터에 저장
		List<ReviewAttachment> attachList  = new ArrayList<>();
		String saveDirectory = request.getServletContext()
									  .getRealPath("/resources/upload/review");
		
		for(MultipartFile f : upFiles) {
			
			if(!f.isEmpty() && f.getSize() != 0) {
				//1. 파일명 생성
				String renamedFileName = Utils.getRenamedFileName(f.getOriginalFilename());
				
				//2. 메모리의 파일 -> 서버경로상의 파일 
				File newFile = new File(saveDirectory, renamedFileName); //임의의 자바파일객체를 만들고 이동시킴
				try {
					f.transferTo(newFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				//3. attachment객체 생성(db 저장을 위한 준비)
				ReviewAttachment attach = new ReviewAttachment();
				attach.setOName(f.getOriginalFilename());
				attach.setRName(renamedFileName);
				attachList.add(attach);
			}
		}
		
		review.setSpaceNo(spaceNo);
		review.setRevNo(revNo);
		
		review.setReviewAtt(attachList);
		log.debug("reveiw = {}", review);
		System.out.println(review);
		
		//2. 게시글, 첨부파일정보를 DB에 저장
		try {
			int result = spaceService.insertReview(review);
			
			//별점 평균 업데이트
			List<Review> reviewList = spaceService.selectStarAvg(spaceNo);
			/* Review r = new Review(); */
			float starAvg = 0;
			for(Review r  : reviewList) {
				starAvg += r.getStarRating();
			}
			starAvg = starAvg/reviewList.size();
			System.out.println("@@3"+starAvg);
			
			Space space = new Space();
			space.setStarAvg(starAvg);
			space.setSpaceNo(spaceNo);
			
			spaceService.updateStarAvg(space);
			
			redirectAttr.addFlashAttribute("msg", "리뷰 등록 성공!");
		} catch(Exception e) {
			log.error("게시물 등록 오류", e);
			redirectAttr.addFlashAttribute("msg", "리뷰 등록 실패!");
			
			//예외발생을 spring container에게 전달 : 지정한  예외페이지로 응답처리
			throw e;
		}
		
		return "redirect:/member/reviewList.do";
	}
	
	@PostMapping("/updateReview.do")
	public String updateReview(Review review,
								@RequestParam("spaceNo") String spaceNo,
								@RequestParam("revNo") String revNo,
			/* @RequestParam(value="upFile",required=false) MultipartFile[] upFiles, */
								HttpServletRequest request,
								RedirectAttributes redirectAttr) {
		
		
		review.setSpaceNo(spaceNo);
		review.setRevNo(revNo);
		
		/* review.setReviewAtt(attachList); */
		log.debug("reveiw = {}", review);
		
		//2. 게시글, 첨부파일정보를 DB에 저장
		try {
			int result = spaceService.updateReview(review);
			
			//별점 평균 업데이트
			List<Review> reviewList = spaceService.selectStarAvg(spaceNo);
			/* Review r = new Review(); */
			float starAvg = 0;
			for(Review r  : reviewList) {
				starAvg += r.getStarRating();
			}
			starAvg = starAvg/reviewList.size();
			System.out.println("@@3"+starAvg);
			
			Space space = new Space();
			space.setStarAvg(starAvg);
			space.setSpaceNo(spaceNo);
			
			spaceService.updateStarAvg(space);
			
			redirectAttr.addFlashAttribute("msg", "리뷰 수정 성공!");
		} catch(Exception e) {
			log.error("게시물 등록 오류", e);
			redirectAttr.addFlashAttribute("msg", "리뷰 수정 실패!");
			
			//예외발생을 spring container에게 전달 : 지정한  예외페이지로 응답처리
			throw e;
		}
		
		return "redirect:/member/reviewList.do";
	}
	
	//멤버 수정
	@GetMapping("/updateMember.do")
	@ResponseBody
	public Map<String, Object> updateMember(ModelAndView mav,
											Member member) {
		
		int result = memberService.updateMember(member);
		String memberEmail = member.getMemberEmail();
		member = memberService.selectOneMember(memberEmail);
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		authentication.getName();
		authentication.getPrincipal();
		
		Map<String, Object> map = new HashMap<>();
		map.put("nick", member.getNickName());

		return map;
	}
	
	
	//비밀번호 변경
	@GetMapping("/updatePwd.do")
	@ResponseBody
	public ModelAndView updatePwd(ModelAndView mav,
										 Principal principal, Member member) {
		
		String encryptPassword = bcryptPasswordEncoder.encode(member.getPassword());
		member.setPassword(encryptPassword);
		member.setMemberEmail(principal.getName());
		
		int result = memberService.updatePwd(member);
		
		mav.setViewName("jsonView");
		
		return mav;
	}

}
