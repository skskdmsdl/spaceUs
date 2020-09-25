package com.kh.spaceus.community.recruit.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.SessionActionMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.kh.spaceus.community.recruit.model.service.RecruitService;
import com.kh.spaceus.community.recruit.model.vo.Recruit;
import com.kh.spaceus.member.controller.MemberController;
import com.kh.spaceus.member.model.service.MemberService;
import com.kh.spaceus.member.model.vo.Member;
import com.kh.spaceus.space.model.service.SpaceService;

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
						  		value = "cPage") int cPage) {
		//1.사용자 입력값 
		final int limit = 10; //사용용도는 numPerPage와 똑같음
		int offset = (cPage - 1) * limit;
		
		//2. 업무로직
		List<Recruit> list = recruitService.selectRecruitList(limit, offset);
		log.debug("list = {}", list);
		
		//전체컨텐츠수 구하기
		 int totalContents = recruitService.selectRecruitTotalContents(); 
		
		
		//3. view단 처리
		mav.addObject("totalContents", totalContents);
		mav.addObject("list", list);
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
			  					Model model) {
		
		Recruit recruit = recruitService.selectOneRecruit(no);
		log.debug("recruit = {}", recruit);
		model.addAttribute("recruit", recruit);
		
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
		System.out.println(recruit);
		
		int result = recruitService.insertRecruit(recruit);
		String msg = result > 0 ? "등록 성공!" : "등록실패";
		redirectAttributes.addFlashAttribute("msg", msg);
	
		return "redirect:/community/recruit/recruitDetail.do";
	 }
	 
	 @RequestMapping("/recruitModify.do")
	 public String recruitModify(@RequestParam("no") String no, Model model) {
			Recruit recruit = recruitService.selectOneRecruit(no);
			model.addAttribute("recruit", recruit);
			return "community/recruit/updateRecruit";
	 }
	 
	 //구인/구직 수정
	/* @RequestMapping(value = "/updateRecruit.do",
	      			 method = RequestMethod.POST)
	 public ModelAndView updateRecruit(Recruit recruit,
									  HttpServletRequest request){
			//파라미터로 전달받지 않고 직접 객체 생성 또한 가능
	    	//viewName 생성자에 전달 가능
	    	ModelAndView mav = new ModelAndView("redirect:/community/recruit/updateRecruit.do");
			log.debug("recruit = {}", recruit);
			
			//1.비지니스로직 실행
			int result = recruitService.updateRecruit(recruit);
			
			//2.처리결과에 따라 view단 분기처리
			String msg = "";
			if(result>0){ 
				msg="게시물 수정성공!";
				Recruit updatedMember = recruitService.selectOneRecruit(Recruit.);
				mav.addObject("loginMember", updatedMember);
			}
			else 
				msg="게시물 수정실패!";
			
			//리다이렉트시 값전달하기
			//RedirectAttributes와 동일하다.
			FlashMap flashMap = RequestContextUtils.getOutputFlashMap(request);
			flashMap.put("msg", msg);
			
			return mav;
		}
	 */
}
