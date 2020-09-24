package com.kh.spaceus.community.group.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spaceus.community.recruit.controller.RecruitController;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/community/group")
public class GroupController {

	// 소모임 게시판
	@RequestMapping("/groupList.do")
	public String recruitList () {
		
		return "community/group/groupBoard";
	}
}
