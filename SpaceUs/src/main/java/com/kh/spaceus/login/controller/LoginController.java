package com.kh.spaceus.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/login")
public class LoginController {
	
	
	@RequestMapping("/login.do")
	public String login () {
		
		
		return "login/login";
	}

}
