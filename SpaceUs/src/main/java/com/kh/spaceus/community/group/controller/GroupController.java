package com.kh.spaceus.community.group.controller;

import java.util.List;

import org.springframework.ui.Model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spaceus.community.group.model.service.GroupService;
import com.kh.spaceus.community.group.model.vo.Board;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/community/group")
public class GroupController {
	
	@Autowired
	GroupService groupService;
	
	// 소모임 게시판
	@RequestMapping("/groupList.do")
	public String recruitList (Model model) {
		
		List<Board> boardList = groupService.selectListBoard();
		log.debug("boardList = {}", boardList);
		model.addAttribute("boardList", boardList);
		
		return "community/group/groupBoard";
	}
}
