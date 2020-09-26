package com.kh.spaceus.exhibition.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spaceus.exhibition.model.service.ExhibitionService;
import com.kh.spaceus.exhibition.model.vo.Exhibition;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/exhibition")
public class ExhibitionController {
	
	@Autowired
	ExhibitionService exhibitionService;
	
	//기획전메인
	@RequestMapping("/exhibition.do")
	public ModelAndView exhibition(ModelAndView mav) {
		
		List<Exhibition> list = exhibitionService.selectExList();
		
		log.info("list = {}", list);
		
		mav.addObject("list", list);
		
		mav.setViewName("exhibition/exhibition");
		return mav;
	}
	
	//기획전리스트
	@RequestMapping("/exhibitionList.do")
	public String exhibitionList() {
		return "exhibition/exhibitionList";
	}
	
	//기획전추가
	@RequestMapping("/insertExhibition.do")
	public String insertExhibition() {
		return "exhibition/insertExhibition";
	}
	
	//기획전삭제
	@RequestMapping("/deleteExhibition")
	public ModelAndView deleteExhibition(ModelAndView mav,
										@RequestParam("exNo") String exNo) {
		
		int result = exhibitionService.deleteExhibition(exNo);
		
		log.info("result = {}", result);
		
		
		mav.setViewName("exhibition/exhibition");
		return mav;
	}
}
