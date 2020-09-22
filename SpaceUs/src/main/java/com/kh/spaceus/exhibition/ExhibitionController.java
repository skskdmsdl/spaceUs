package com.kh.spaceus.exhibition;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/exhibition")
public class ExhibitionController {
	
	//기획전메인
	@RequestMapping("/exhibition.do")
	public String exhibition( ) {
		return "exhibition/exhibition";
	}
	
	//기획전리스트
	@RequestMapping("/exhibitionList.do")
	public String exhibitionList() {
		return "exhibition/exhibitionList";
	}
}
