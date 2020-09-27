package com.kh.spaceus.community.group.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

		int totalCnt = groupService.selectTotalCnt();
		log.info("totalCnt = {}",totalCnt);

		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("boardList", boardList);
		model.addAttribute("groupBoardList", groupBoardList);

		return "community/group/groupBoard";
	}

	// 소모임 게시판 분류별 리스트
	@GetMapping("/groupList/{boardNo}/{boardRef}.do")
	public String groupBoardList(@PathVariable("boardNo") String boardNo, 
								@PathVariable("boardRef") String boardRef,
								Model model) {

		 List<Board> boardList = groupService.selectListBoard();
		 log.info("boardList = {}", boardList);
		  
		 Map<String,String> listMap = new HashMap<>();
		 listMap.put("boardNo", boardNo);
		 listMap.put("boardRef", boardRef);
		 
		 log.info("listMap={}",listMap);
		 
		 List<GroupBoard> groupBoardList = groupService.selectSortedListGroupBoard(listMap);
		 log.info("groupBoardList = {}", groupBoardList);
		 
		 int totalCnt = groupService.selectTotalCnt();
		 log.info("totalCnt = {}",totalCnt);
		 
		 model.addAttribute("totalCnt", totalCnt);
		 model.addAttribute("boardList", boardList);
		 model.addAttribute("groupBoardList", groupBoardList);

		return "community/group/groupBoard";
	}

	// 소모임 상세 게시판
	@RequestMapping("/groupDetail/{groupBoardNo}.do")
	public String groupDetail(@PathVariable("groupBoardNo") String groupBoardNo ,Model model) {
		log.info("groupBoardNo= {}" , groupBoardNo);
		
		List<GroupBoard> list = groupService.selectDetailBoard(groupBoardNo);
		log.info("list = {}", list);
		
		model.addAttribute("list", list);
		return "community/group/groupDetail";
	}
	
	// 게시판 등록 폼 
	@RequestMapping("/groupEnrollForm.do")
	public String groupEnrollForm(Model model) {
		
		List<Board> boardList = groupService.selectListBoard();
		log.info("boardList = {}", boardList);
		
		
		model.addAttribute("boardList", boardList);
		
		return "/community/group/groupEnrollForm";
	}
	
	//게시판 등록
	@PostMapping("/insertBoard.do")
	public String insertBoard(GroupBoard gb,
							  @RequestParam("groupBoardContent") String groupBoardContent) {
		log.info("gb = {}" , gb);
		log.info("groupBoardContent = {}" , groupBoardContent);		
		
		//GroupBoard gb = new GroupBoard(null, boardNo, memberEmail, 0, groupBoardTitle, groupBoardContent, 0, null, nickname);
		
		//int result = groupService.insertBoard(gb);
		//log.info("result = {}",result);
		
		return "/community/group/groupEnrollForm";
	}

}
