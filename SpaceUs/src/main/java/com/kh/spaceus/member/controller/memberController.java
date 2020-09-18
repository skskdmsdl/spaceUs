package com.kh.spaceus.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
public class memberController {
	
	
	@RequestMapping("/memberProfile.do")
	public String memberProfile () {
		
		return "member/memberProfile";
	}
	
	//로그인
	@RequestMapping("/memberLogin.do")
	public String memberLogin () {
		
		return "member/memberLogin";
	}
	
	//회원가입
	@RequestMapping("/memberEnroll.do")
	public String memberEnroll() {
		
		return "member/memberEnroll";
	}

}
