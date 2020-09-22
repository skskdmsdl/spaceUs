package com.kh.spaceus.recruit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spaceus.member.controller.MemberController;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/recruit")
public class RecruitController {

	// 구인/구직
	@RequestMapping("/recruitList.do")
	public String memberProfile () {
		
		return "recruit/recruitList";
	}
}
