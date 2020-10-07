package com.kh.spaceus.qna.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spaceus.qna.model.service.QnaService;
import com.kh.spaceus.qna.model.vo.Qna;
import com.kh.spaceus.space.model.vo.Wish;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/qna")
public class QnaController {
		
	  @Autowired
      private QnaService qnaService;
	
	  @RequestMapping(value = "/insertQna.do", method=RequestMethod.POST) 
	  public String insertQna(@RequestParam("spaceNo") String spaceNo, 
			  				@ModelAttribute("qna") Qna qna,
								  RedirectAttributes redirectAttr) { 
	     log.debug("질문 등록 요청");
	     	
	     log.debug("qna= {}", qna);
		 int result = qnaService.insertQna(qna); 
		
		 String msg = result > 0 ? "질문 등록 성공!" : "답변 등록 실패";
		 redirectAttr.addFlashAttribute("msg", msg); 
	  
	  return "redirect:/space/spaceDetail.do?spaceNo="+spaceNo; 
	  
	  }
	  
	  @RequestMapping(value="/updateAnswer.do", method=RequestMethod.POST)
	  public String insertAnswer(Qna qna,
				  RedirectAttributes redirectAttr) {
		 log.debug("답변 등록 요청");
	     	
		 int result = qnaService.updateAnswer(qna); 

		 String msg = result > 0 ? "답변 등록 성공!" : "답변 등록 실패";
		 redirectAttr.addFlashAttribute("msg", msg); 
	    
		 return "redirect:/space/spaceDetail.do?spaceNo=";
	  }
	  
		/*
		 * @RequestMapping(value="/hostCheckArticle.do", method=RequestMethod.GET)
		 * public ModelAndView CheckNewArticle(Principal principal, ModelAndView mav){
		 * log.debug("principal = {}", principal);
		 * 
		 * String hostId = principal.getName();
		 * 
		 * List<Qna> list = hostService.selectQuestionList(hostId);
		 * 
		 * mav.addObject("loginMember", principal); mav.addObject("list", list);
		 * mav.setViewName("host/hostCheckArticle");
		 * 
		 * return mav; }
		 */
}
