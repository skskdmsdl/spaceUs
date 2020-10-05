package com.kh.spaceus.community.recruit.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.kh.spaceus.common.Utils;
import com.kh.spaceus.community.recruit.model.service.RecruitService;
import com.kh.spaceus.community.recruit.model.vo.Recruit;
import com.kh.spaceus.community.recruit.model.vo.RecruitComment;
import com.kh.spaceus.community.recruit.model.vo.ReportComment;
import com.kh.spaceus.community.recruit.model.vo.ReportRecruit;
import com.kh.spaceus.member.model.service.MemberService;
import com.kh.spaceus.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/community/recruit")
public class RecruitController {
	
	@Autowired
	private RecruitService recruitService;
	
	@Autowired 
	private MemberService memberService;

	// 구인/구직 목록
	@RequestMapping("/recruitList.do")
	public ModelAndView recruitList (ModelAndView mav,
							  @RequestParam(defaultValue = "1",
						  	  value = "cPage") int cPage,
							  HttpServletRequest request) {
		//1.사용자 입력값 
		final int limit = 10; //사용용도는 numPerPage와 똑같음
		int offset = (cPage - 1) * limit;
		
		//2. 업무로직
		List<Recruit> list = recruitService.selectRecruitList(limit, offset);
		log.debug("list = {}", list);
		
		
		//전체컨텐츠수 구하기
		int totalContents = recruitService.selectRecruitTotalContents(); 
		String url = request.getRequestURI() + "?";
		String pageBar = Utils.getPageBarHtml(cPage, limit, totalContents, url);
		
		//3. view단 처리
		mav.addObject("totalContents", totalContents);
		mav.addObject("list", list);
		mav.addObject("pageBar", pageBar);
		mav.setViewName("community/recruit/recruitList");
		return mav;
	}
	
	// 구인/구직 등록폼
	@RequestMapping("/recruitEnrollForm.do")
	public String recruitEnrollFrom () {
		
		return "community/recruit/recruitEnrollForm";
	}
	
	// 구인/구직 상세페이지
	@GetMapping("/recruitDetail.do")
	public String recruitDetail (@RequestParam("no") String no,
			  					 Model model,
			  					 HttpServletRequest request,
			  				 	 HttpServletResponse response
			  					 ) {
		try {
			//쿠키검사 : recruitCookie
			Cookie[] cookies = request.getCookies();
			String recruitCookieVal = "";
			boolean hasRead = false;
			
			if(cookies != null) {
				for(Cookie c : cookies) {
					String name = c.getName();
					String value = c.getValue();
					
					if("recruitCookie".equals(name)) {
						recruitCookieVal = value;
						
						if(value.contains("[" + no + "]"))
							hasRead = true;
					}
				}
			}
			if(!hasRead) {
				//recruitCookie생성
				Cookie recruitCookie = new Cookie("recruitCookie", recruitCookieVal + "["+ no +"]");
				recruitCookie.setPath(request.getContextPath()+"/community/recruit");
				recruitCookie.setMaxAge(24*60*60);
				response.addCookie(recruitCookie);
				int result = recruitService.increaseRecruitReadCnt(no);
				log.info("result = {}",result);			
			}
			
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			authentication.getName();
			RecruitComment comment = new RecruitComment();
			comment.setNo(no);
			comment.setReporter(authentication.getName());
			
			Recruit recruit = recruitService.selectOneRecruit(no);
			List<RecruitComment> commentList = recruitService.selectCommentList(comment);
			int commentTotal = recruitService.selectCommentTotalContents(no);
			
			model.addAttribute("recruit", recruit);
			model.addAttribute("commentList", commentList);
			model.addAttribute("commentTotal", commentTotal);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "community/recruit/recruitDetail";
	}
	
	 //구인/구직 등록
	 @RequestMapping(value = "/insertRecruit.do",
					method = RequestMethod.POST)
	 public String insertRecruit(RedirectAttributes redirectAttributes,
			 					 Principal principal, 
			 					 Recruit recruit
			 					){
		//로그인한 닉네임 가져오기 
		Member member = memberService.selectOneMember(principal.getName());
		recruit.setEmail(principal.getName());
		recruit.setNickName(member.getNickName());
		
		int result = recruitService.insertRecruit(recruit);
		System.out.println(recruit);
		String msg = result > 0 ? "등록 성공!" : "등록실패";
		redirectAttributes.addFlashAttribute("msg", msg);
	
		return "redirect:/community/recruit/recruitList.do";
	 }
	 
	 @RequestMapping("/recruitModify.do")
	 public String recruitModify(@RequestParam("no") String no, Model model) {
			Recruit recruit = recruitService.selectOneRecruit(no);
			System.out.println(no);
			System.out.println(recruit);
			model.addAttribute("recruit", recruit);
			return "community/recruit/updateRecruit";
	 }
	 
	 //구인/구직 수정
	 @RequestMapping(value = "/updateRecruit.do",
	      			 method = RequestMethod.POST)
	 public ModelAndView updateRecruit(Recruit recruit,
									  HttpServletRequest request,
									  ModelAndView mav){
			log.debug("recruit = {}", recruit);
			System.out.println(recruit.getNo());
			
			//1.비지니스로직 실행
			int result = recruitService.updateRecruit(recruit);
			
			//2.처리결과에 따라 view단 분기처리
			String msg = "";
			if(result>0){ 
				msg="게시물 수정성공!";
				Recruit updateRecruit = recruitService.selectOneRecruit(recruit.getNo());
				mav.addObject("recruit", updateRecruit);
			}
			else 
				msg="게시물 수정실패!";
			
			//리다이렉트시 값전달하기
			//RedirectAttributes와 동일하다.
			FlashMap flashMap = RequestContextUtils.getOutputFlashMap(request);
			flashMap.put("msg", msg);
			mav.setViewName("community/recruit/recruitDetail");
			return mav;
		}
	 
	 //삭제
	 @RequestMapping(value = "/deleteRecruit.do",
					 method = RequestMethod.GET)
	 public String deleteRecruit(@RequestParam String no, 
						 		 RedirectAttributes redirectAttr){
		log.debug("게시물 삭제");
		int result = recruitService.deleteRecruit(no);
		String msg = (result > 0) ? "삭제 성공" : "삭제 실패";
		redirectAttr.addFlashAttribute("msg", msg);
		
		return "redirect:/community/recruit/recruitList.do";
	}
	 
	 //신고
	 @GetMapping("/recruitReport.do")
    public ModelAndView recruitReport(ModelAndView mav,
    								  Principal principal,
									  @RequestParam("no") String no,
									  @RequestParam("nickName") String nickName,
									  @RequestParam("reportReason") String reportReason) {
		 
		ReportRecruit report = new ReportRecruit();
		report.setBoardNo(no);
		report.setMemberEmail(principal.getName());
		report.setReportReason(reportReason);
		
		String memberEmail = principal.getName();
		
		ReportRecruit reportResult = recruitService.selectOneReport(no, memberEmail);
    	
		if(reportResult==null){ 
			int resultReport = recruitService.insertReport(report); 
			int result = recruitService.updateReport(no);
			mav.addObject("duplication", 0);
			mav.setViewName("jsonView"); // /WEB-INF/views/jsonView.jsp
		}
		else {
			mav.addObject("duplication", 1);
			mav.setViewName("jsonView"); // /WEB-INF/views/jsonView.jsp
		
		}
    	return mav;
    }
	 
	//댓글 등록
	@GetMapping("/insertComment.do")
    public ModelAndView insertComment(ModelAndView mav,
									  @RequestParam("recruitNo") String recruitNo,
									  @RequestParam("email") String email,
									  @RequestParam("secret") int secret,
									  @RequestParam("content") String content) {
		 
		Member member = memberService.selectOneMember(email);
		
		RecruitComment comment = new RecruitComment();
		comment.setNickName(member.getNickName());
		comment.setRecruitNo(recruitNo);
		comment.setSecret(secret);
		comment.setContent(content);
		comment.setCommentRef(null);
		comment.setLevel(1);
		
		int result = recruitService.insertComment(comment);
    	
		mav.setViewName("jsonView"); // /WEB-INF/views/jsonView.jsp
		
    	return mav;
    }
	
	//대댓글 등록
	@GetMapping("/insertReply.do")
	public ModelAndView insertReply(ModelAndView mav,
									@RequestParam("recruitNo") String recruitNo,
									@RequestParam("email") String email,
									@RequestParam("secret") int secret,
									@RequestParam("content") String content,
									@RequestParam("commentRef") String commentRef) {
		
		Member member = memberService.selectOneMember(email);
		
		RecruitComment comment = new RecruitComment();
		comment.setNickName(member.getNickName());
		comment.setRecruitNo(recruitNo);
		comment.setSecret(secret);
		comment.setContent(content);
		comment.setCommentRef(commentRef);
		comment.setLevel(2);
		
		int result = recruitService.insertComment(comment);
		
		mav.setViewName("jsonView"); // /WEB-INF/views/jsonView.jsp
		
		return mav;
	}
	
	//댓글 수정
	@GetMapping("/updateComment.do")
	public ModelAndView updateComment(ModelAndView mav,
									  @RequestParam("content") String content,
									  @RequestParam("commentNo") String commentNo) {
		
		RecruitComment comment = new RecruitComment();
		comment.setContent(content);
		comment.setNo(commentNo);
		
		int result = recruitService.updateComment(comment);
		
		mav.setViewName("jsonView"); // /WEB-INF/views/jsonView.jsp
		
		return mav;
	}
	
	//댓글 삭제
	@GetMapping("/deleteComment.do")
	public ModelAndView deleteComment(ModelAndView mav,
									  @RequestParam("commentNo") String commentNo) {
		
		int result = recruitService.deleteComment(commentNo);
		mav.setViewName("jsonView"); 
		
		return mav;
	}
	
	//댓글 신고
	@GetMapping("/insertReportComment.do")
	public ModelAndView insertReportComment(ModelAndView mav,
										    @RequestParam("commentNo") String commentNo,
										    Principal principal) {
		
		ReportComment reportComment = new ReportComment();
		reportComment.setBoardCommentNo(commentNo);
		reportComment.setEmail(principal.getName());
		
		int result = recruitService.insertReportComment(reportComment);
		mav.setViewName("jsonView"); 
		
		return mav;
	}
	
	
	
}
