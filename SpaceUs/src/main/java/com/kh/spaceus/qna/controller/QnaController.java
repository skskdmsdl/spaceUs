package com.kh.spaceus.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
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

	@RequestMapping(value = "/insertQna.do", method = RequestMethod.POST)
	public String insertQna(@RequestParam("spaceNo") String spaceNo, @ModelAttribute("qna") Qna qna,
			RedirectAttributes redirectAttr) {
		int result = qnaService.insertQna(qna);

		String msg = result > 0 ? "질문 등록 성공!" : "답변 등록 실패";
		redirectAttr.addFlashAttribute("msg", msg);

		return "redirect:/space/spaceQnaDetail.do?spaceNo=" + spaceNo;

	}

	@RequestMapping(value = "/sendAnswer.do", method = RequestMethod.POST)
	public String sendAnswer(Qna qna, @RequestParam("spaceNo") String spaceNo, RedirectAttributes redirectAttr) {
		log.debug("qna 답변 등록 요청");

		int result = qnaService.updateAnswer(qna);

		
		 String msg = result > 0 ? "답변 등록 성공!" : "답변 등록 실패";
		 redirectAttr.addFlashAttribute("msg", msg);
		 

		 return "redirect:/space/spaceQnaDetail.do?spaceNo=" + spaceNo;
	}
	
	@RequestMapping(value = "/deleteQuestion.do", method = RequestMethod.POST)
	public String deleteQna(Qna qna, @RequestParam("spaceNo") String spaceNo, RedirectAttributes redirectAttr) {
		int result = qnaService.deleteQna(qna);
		
		 String msg = result > 0 ? "질문이 삭제되었습니다." : "질문을 삭제하는데 실패했습니다.";
		 redirectAttr.addFlashAttribute("msg", msg); 

		 return "redirect:/space/spaceQnaDetail.do?spaceNo=" + spaceNo;
	}
	
	@RequestMapping(value = "/modifyQuestion.do", method = RequestMethod.POST)
	public String updateQna(Qna qna, @RequestParam("spaceNo") String spaceNo, RedirectAttributes redirectAttr) {
		int result = qnaService.updateQna(qna);
		
		 String msg = result > 0 ? "질문이 수정되었습니다." : "질문을 수정하는데 실패했습니다.";
		 redirectAttr.addFlashAttribute("msg", msg);

		 return "redirect:/space/spaceQnaDetail.do?spaceNo=" + spaceNo;
	}
	
	

	@RequestMapping(value = "/updateAnswer.do", method = RequestMethod.POST)
	public ModelAndView insertAnswer(Qna qna, RedirectAttributes redirectAttr, ModelAndView mav) {
		int result = qnaService.updateAnswer(qna);
		mav.setViewName("jsonView");

		return mav;
	}

	// 404에러페이지
	@GetMapping("/404.do")
	public String error(RedirectAttributes redirectAttr) {

		return "/space/error404";
	}

}
