package com.kh.spaceus.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spaceus.admin.model.service.AdminService;
import com.kh.spaceus.admin.model.vo.ManageMember;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	//회원관리 폼
	@RequestMapping("/memberManage.do")
	public String memberManage(Model model) {
		List<ManageMember> memberList = adminService.selectList();
		log.info("memberList={}",memberList);
		
		model.addAttribute("memberList", memberList);
		return "admin/memberManage";
	}
	
	//Id로 입력시 회원목록 조회
	@RequestMapping("/findUserList.do")
	public String findUserList(Model model, @RequestParam String searchType, @RequestParam String searchKeyword) {
		log.info("searchType={}", searchType);
		log.info("searchKeyword={}",searchKeyword);
		
		List<ManageMember> memberList = null;
		if(searchType.equals("userId")) {
			memberList = adminService.findUserIdList(searchKeyword);
			log.info("memberList = {}", memberList);
		}
		else if(searchType.equals("userName")) {
			memberList = adminService.findUserNameList(searchKeyword);						
			log.info("memberList = {}", memberList);
		}
		else if(searchType.equals("userRole")) {
			if(searchKeyword.equals("total")) {
				memberList = adminService.selectList();
			}else{
				memberList = adminService.findUserRoleList(searchKeyword);
			}
		}
		
		model.addAttribute("memberList", memberList);
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
