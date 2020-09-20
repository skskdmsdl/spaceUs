package com.kh.spaceus.aboutus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/aboutus")
@Slf4j
public class AboutUsController {

	//FAQ
	@RequestMapping("/faqs.do")
	public String faqList() {
		return "aboutus/faqs";
	}
	
	//SpaceUs소개
	@RequestMapping("/aboutSpaceUs.do")
	public String aboutSpaceUs() {
		return "aboutus/aboutSpaceUs";
	}

}