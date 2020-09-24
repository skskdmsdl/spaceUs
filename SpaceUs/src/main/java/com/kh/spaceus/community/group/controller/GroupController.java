package com.kh.spaceus.community.group.controller;

import java.util.List;

import org.springframework.ui.Model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
