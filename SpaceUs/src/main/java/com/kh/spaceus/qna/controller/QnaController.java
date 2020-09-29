package com.kh.spaceus.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spaceus.qna.model.service.QnaService;
import com.kh.spaceus.qna.model.vo.Qna;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/qna")
public class QnaController {
		
	  @Autowired
      private QnaService qnaService;
	
	  @GetMapping("/insertQna.do") 
	  public String insertQna(@RequestParam("spaceNo") String spaceNo, 
			  										@ModelAttribute("qna") Qna qna, 
			  										RedirectAttributes redirectAttr) { 
	     log.debug("질문 등록 요청");
  
	     log.debug("qna= {}", qna);
		 int result = qnaService.insertQna(qna); 
		
		 String msg = result > 0 ? "등록 성공!" : "등록실패";
		 redirectAttr.addFlashAttribute("msg", msg);
			 
	  
	  return "redirect:/space/SpaceDetail.do?spaceNo="+spaceNo; 
	  
	  }
}
