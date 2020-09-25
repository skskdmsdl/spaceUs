package com.kh.spaceus.community.group.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	private GroupService groupService;

	// 소모임 게시판 전체 리스트
	@GetMapping("/groupList.do")
	public String groupList(Model model) {

		List<Board> boardList = groupService.selectListBoard();
		log.info("boardList = {}", boardList);

		List<GroupBoard> groupBoardList = groupService.selectListGroupBoard();
		log.info("groupBoard = {}", groupBoardList);

		System.out.println(groupBoardList);

		model.addAttribute("boardList", boardList);
		model.addAttribute("groupBoardList", groupBoardList);

		return "community/group/groupBoard";
	}

	// 소모임 게시판 분류별 리스트
	@GetMapping("/groupList/{boardNo}/{boardRef}.do")
	public String groupBoardList(@PathVariable("boardNo") String boardNo, 
								@PathVariable("boardRef") String boardRef,
								Model model) {
		log.info(boardNo);
		log.info(boardRef);

		 List<Board> boardList = groupService.selectListBoard();
		 log.info("boardList = {}", boardList);
		  
		 Map<String,String> listMap = new HashMap<>();
		 listMap.put("boardNo", boardNo);
		 listMap.put("boardRef", boardRef);
		 
		 log.info("listMap={}",listMap);
		 
		 List<GroupBoard> groupBoardList = groupService.selectSortedListGroupBoard(listMap);
		 log.info("groupBoardList = {}", groupBoardList);
		  
		 model.addAttribute("boardList", boardList);
		 model.addAttribute("groupBoardList", groupBoardList);
		 
		return "community/group/groupBoard";
	}

	// 소모임 상세 게시판
	@RequestMapping("/groupDetail.do")
	public String groupDetail(Model model) {

		return "community/group/groupDetail";
	}

}
