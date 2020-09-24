package com.kh.spaceus.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {

	//회원관리 폼
	@RequestMapping("/memberManage.do")
	public String memberManage() {
		return "admin/memberManage";
	}
	
	//공간관리 폼
	@RequestMapping("/spaceManage.do")
	public String spaceManage() {
		return "admin/spaceManage";
	}
	
	//블랙리스트관리 폼
	@RequestMapping("/blackListManage.do")
	public String blackListManage() {
		return "admin/blackListManage";
	}
	
	
}
