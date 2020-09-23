package com.kh.spaceus.recruit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spaceus.member.controller.MemberController;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/recruit")
public class RecruitController {

	// 구인/구직 목록
	@RequestMapping("/recruitList.do")
	public String recruitList () {
		
		return "recruit/recruitList";
	}
	
	// 구인/구직 등록폼
	@RequestMapping("/recruitEnrollForm.do")
	public String recruitEnrollFrom () {
		
		return "recruit/recruitEnrollForm";
	}
	
	// 구인/구직 상세페이지
	@RequestMapping("/recruitDetail.do")
	public String recruitDetail () {
		
		return "recruit/recruitDetail";
	}
}
