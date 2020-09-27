package com.kh.spaceus.community.group.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		//log.info("boardList = {}", boardList);

		List<GroupBoard> groupBoardList = groupService.selectListGroupBoard();
		//log.info("groupBoard = {}", groupBoardList);

		int totalCnt = groupService.selectTotalCnt();
		//log.info("totalCnt = {}", totalCnt);

		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("boardList", boardList);
		model.addAttribute("groupBoardList", groupBoardList);

		return "community/group/groupBoard";
	}

	// 소모임 게시판 분류별 리스트
	@GetMapping("/groupList/{boardNo}/{boardRef}.do")
	public String groupBoardList(@PathVariable("boardNo") String boardNo, @PathVariable("boardRef") String boardRef,
			Model model) {

		List<Board> boardList = groupService.selectListBoard();
		//log.info("boardList = {}", boardList);

		Map<String, String> listMap = new HashMap<>();
		listMap.put("boardNo", boardNo);
		listMap.put("boardRef", boardRef);

		//log.info("listMap={}", listMap);

		List<GroupBoard> groupBoardList = groupService.selectSortedListGroupBoard(listMap);
		//log.info("groupBoardList = {}", groupBoardList);

		int totalCnt = groupService.selectTotalCnt();
		//log.info("totalCnt = {}", totalCnt)

		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("boardList", boardList);
		model.addAttribute("groupBoardList", groupBoardList);

		return "community/group/groupBoard";
	}

	// 소모임 상세 게시판
	@RequestMapping("/groupDetail/{groupBoardNo}.do")
	public String groupDetail(HttpServletRequest request, HttpServletResponse response,
							 @PathVariable("groupBoardNo") String groupBoardNo, Model model) {
		//쿠키검사 : boardCookie
		Cookie[] cookies = request.getCookies();
		String boardCookieVal = "";
		boolean hasRead = false;
		
		if(cookies != null) {
			for(Cookie c : cookies) {
				String name = c.getName();
				String value = c.getValue();
				
				if("boardCookie".equals(name)) {
					boardCookieVal = value;
					
					if(value.contains("[" + groupBoardNo + "]"))
						hasRead = true;
				}
			}
		}
		if(!hasRead) {
		//boardCookie생성
		Cookie boardCookie = new Cookie("boardCookie", boardCookieVal + "["+groupBoardNo +"]");
			boardCookie.setPath("${pageContext.request.contextPath}");
			//브라우져가 종료되면 쿠키 삭제
			boardCookie.setMaxAge(-1);
			response.addCookie(boardCookie);
		}
		
		//조회수 증가
		if(!hasRead) {
			int result = groupService.increaseBoardReadCnt(groupBoardNo);
			log.info("result = {}",result);			
		}

		//브라우져가 종료되면 쿠키 삭제
		
		List<GroupBoard> list = groupService.selectDetailBoard(groupBoardNo);
		//log.info("list = {}", list);
		
		
		model.addAttribute("list", list);
		return "community/group/groupDetail";
	}

	// 게시판 등록 폼
	@RequestMapping("/groupEnrollForm.do")
	public String groupEnrollForm(Model model) {

		List<Board> boardList = groupService.selectListBoard();
		//log.info("boardList = {}", boardList);

		model.addAttribute("boardList", boardList);

		return "/community/group/groupEnrollForm";
	}

	// 게시판 등록
	@PostMapping("/insertBoard.do")
	public String insertBoard(GroupBoard gb, Model model, RedirectAttributes redirectAtt) {

		// GroupBoard gb = new GroupBoard(null, boardNo, memberEmail, 0,
		// groupBoardTitle, groupBoardContent, 0, null, nickname);

		int result = groupService.insertBoard(gb);
		//log.info("result = {}", result);

		List<Board> boardList = groupService.selectListBoard();
		//log.info("boardList = {}", boardList);

		List<GroupBoard> groupBoardList = groupService.selectListGroupBoard();
		//log.info("groupBoard = {}", groupBoardList);

		int totalCnt = groupService.selectTotalCnt();
		//log.info("totalCnt = {}", totalCnt);

		String msg = (result > 0) ? "게시물 등록!" : "등록 실패!";
		
		redirectAtt.addFlashAttribute("msg", msg);

		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("boardList", boardList);
		model.addAttribute("groupBoardList", groupBoardList);

		return "redirect:/community/group/groupList.do";
	}
	
	//게시물 수정 폼
	@RequestMapping("/modifyBoard/{groupBoardNo}.do")
	public String modifyBoard(@PathVariable("groupBoardNo") String groupBoardNo, Model model) {
		log.info("groupBoardNo={}",groupBoardNo);
		
		List<GroupBoard> gb = groupService.selectDetailBoard(groupBoardNo);
		log.info("gb= {}", gb);
		
		List<Board> boardList = groupService.selectListBoard();
		//log.info("boardList = {}", boardList);

		model.addAttribute("List", boardList);
		model.addAttribute("gb", gb);
		return "/community/group/groupModifyForm";
	}
	
	//게시물 수정
	@RequestMapping("/updateBoard/{groupBoardNo}.do")
	public String updateBoard(GroupBoard gb, RedirectAttributes redirectAtt, Model model) {
		
		log.info("gb = {}",gb);
		int result = groupService.updateBoard(gb);
		log.info("result={}",result);
		
		redirectAtt.addFlashAttribute("msg", result>0?"수정성공!":"수정실패!");
		
		return "redirect:/community/group/groupDetail/{groupBoardNo}.do";
	}
	
	//게시물 삭제
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(@RequestParam("groupBoardNo") String groupBoardNo ,RedirectAttributes redirectAtt, Model model) {
		
		int result = groupService.deleteBoard(groupBoardNo);
		log.info("result = {}",result);
		
		List<Board> boardList = groupService.selectListBoard();
		//log.info("boardList = {}", boardList);

		List<GroupBoard> groupBoardList = groupService.selectListGroupBoard();
		//log.info("groupBoard = {}", groupBoardList);

		int totalCnt = groupService.selectTotalCnt();
		//log.info("totalCnt = {}", totalCnt);

		String msg = (result > 0) ? "게시물 삭제 성공!" : "게시물 삭제 실패!";
		
		redirectAtt.addFlashAttribute("msg", msg);

		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("boardList", boardList);
		model.addAttribute("groupBoardList", groupBoardList);

		return "redirect:/community/group/groupList.do";
	}
	

}
