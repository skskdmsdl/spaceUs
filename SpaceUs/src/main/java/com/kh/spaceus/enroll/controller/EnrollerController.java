package com.kh.spaceus.enroll.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/enroll")
public class EnrollerController {

	
	@RequestMapping("/enroll.do")
	public String enroll() {
		
		
		return "enroll/enroll";
	}
}
