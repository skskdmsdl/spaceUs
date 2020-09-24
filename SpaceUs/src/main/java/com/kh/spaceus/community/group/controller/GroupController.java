package com.kh.spaceus.community.group.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spaceus.community.group.model.service.GroupService;
import com.kh.spaceus.community.group.model.vo.Board;
import com.kh.spaceus.community.group.model.vo.GroupBoard;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/community/group")
public class GroupController {
	
	@Autowired
	GroupService groupService;
	
	// 소모임 게시판
	@RequestMapping("/groupList.do")
	public String groupList (Model model) {
		
		List<Board> boardList = groupService.selectListBoard();
		log.debug("boardList = {}", boardList);
		
		List<GroupBoard> groupBoardList = groupService.selectListGroupBoard();
		log.debug("groupBoard = {}", groupBoardList);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("groupBoardList", groupBoardList);
		
		return "community/group/groupBoard";
	}
	
	//소모임 상세 게시판
	@RequestMapping("/groupDetail.do")
	public String groupDetail(Model model) {
		
		return "community/group/groupDetail";
	}
}
