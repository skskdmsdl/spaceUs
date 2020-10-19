package com.kh.spaceus.community.group.controller;

import java.security.Principal;
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

import com.kh.spaceus.common.Utils;
import com.kh.spaceus.community.group.model.service.GroupService;
import com.kh.spaceus.community.group.model.vo.Board;
import com.kh.spaceus.community.group.model.vo.CmtReport;
import com.kh.spaceus.community.group.model.vo.GBComment;
import com.kh.spaceus.community.group.model.vo.GroupBoard;
import com.kh.spaceus.community.group.model.vo.Report;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/community/group")
public class GroupController {

	@Autowired
	private GroupService groupService;

	// 소모임 게시판 전체 리스트
	@GetMapping("/groupList.do")
	public String groupList(HttpServletRequest request ,Model model,
							@RequestParam(defaultValue = "1", value="cPage") int cPage) {

		List<Board> boardList = groupService.selectListBoard();
		

		//페이징 처리
		final int limit = 10;
		int offset = (cPage -1) * limit;
		
		List<GroupBoard> groupBoardList = groupService.selectListGroupBoard(limit,offset);
		log.info("groupBoardList = {}",groupBoardList);
		
		

		int totalCnt = groupService.selectTotalCnt();
		String url = request.getRequestURI() + "?";
		String pageBar = Utils.getPageBarHtml(cPage, limit, totalCnt, url);
		log.info("totalCnt = {}", totalCnt);
		
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("boardList", boardList);
		model.addAttribute("groupBoardList", groupBoardList);
		model.addAttribute("pageBar", pageBar);
		return "community/group/groupBoard";
	}

	// 소모임 게시판 분류별 리스트
	@GetMapping("/groupList/{boardNo}/{boardRef}.do")
	public String groupBoardList(@PathVariable("boardNo") String boardNo, @PathVariable("boardRef") String boardRef,
								 Model model, HttpServletRequest request, @RequestParam(defaultValue = "1", value="cPage") int cPage) {

		List<Board> boardList = groupService.selectListBoard();

		Map<String, String> listMap = new HashMap<>();
		listMap.put("boardNo", boardNo);
		listMap.put("boardRef", boardRef);

		//페이징 처리
		final int limit = 10;
		int offset = (cPage -1) * limit;
				
		List<GroupBoard> groupBoardList = groupService.selectSortedListGroupBoard(listMap,limit,offset);
		
		int totalCnt = groupService.selectSortedListCnt(listMap);
		String url = request.getRequestURI() + "?";
		String pageBar = Utils.getPageBarHtml(cPage, limit, totalCnt, url);
		
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("boardList", boardList);
		model.addAttribute("groupBoardList", groupBoardList);
		model.addAttribute("pageBar", pageBar);

		return "community/group/groupBoard";
	}

	// 소모임 상세 게시판
	@RequestMapping("/groupDetail/{groupBoardNo}.do")
	public String groupDetail(HttpServletRequest request, HttpServletResponse response,
							 @PathVariable("groupBoardNo") String groupBoardNo, Model model) {
		try {
			
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
				boardCookie.setPath(request.getContextPath()+"/community/group");
				//브라우져가 종료되면 쿠키 삭제
				boardCookie.setMaxAge(-1);//브라우저가 끄면 사라짐
				response.addCookie(boardCookie);

			}
			
			//조회수 증가
			if(!hasRead) {
				int result = groupService.increaseBoardReadCnt(groupBoardNo);
				log.info("result = {}",result);			
			}
			
			//브라우져가 종료되면 쿠키 삭제
			
			List<GroupBoard> list = groupService.selectDetailBoard(groupBoardNo);
			List<Board> boardList = groupService.selectBoardOne(groupBoardNo);
			List<GBComment> commentList = groupService.selectAllComment(groupBoardNo);
			int commentCnt = groupService.selectCommentCnt(groupBoardNo);
			List<CmtReport> report = groupService.selectReport();
			
			log.info("report={}", report);

			model.addAttribute("list", list);
			model.addAttribute("boardList", boardList);
			model.addAttribute("commentList", commentList);
			model.addAttribute("commentCnt", commentCnt);
			model.addAttribute("report", report);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "community/group/groupDetail";
	}

	// 게시판 등록 폼
	@RequestMapping("/groupEnrollForm.do")
	public String groupEnrollForm(Model model) {

		List<Board> boardList = groupService.selectListBoard();
		System.out.println(boardList);
		
		model.addAttribute("boardList", boardList);
		return "/community/group/groupEnrollForm";
	}

	// 게시판 등록
	@PostMapping("/insertBoard.do")
	public String insertBoard(GroupBoard gb, Model model, RedirectAttributes redirectAtt) {

		int result = groupService.insertBoard(gb);

		String msg = (result > 0) ? "게시물 등록!" : "등록 실패!";
		
		redirectAtt.addFlashAttribute("msg", msg);

		return "redirect:/community/group/groupList.do";
	}
	
	//게시물 수정 폼
	@RequestMapping("/modifyBoard/{groupBoardNo}.do")
	public String modifyBoard(@PathVariable("groupBoardNo") String groupBoardNo, Model model) {
		//log.info("groupBoardNo={}",groupBoardNo);
		
		List<GroupBoard> gb = groupService.selectDetailBoard(groupBoardNo);
		log.info("gb= {}", gb);
		
		List<Board> boardList = groupService.selectListBoard();

		model.addAttribute("List", boardList);
		model.addAttribute("gb", gb);
		return "/community/group/groupModifyForm";
	}
	
	//게시물 수정
	@RequestMapping("/updateBoard/{groupBoardNo}.do")
	public String updateBoard(GroupBoard gb, RedirectAttributes redirectAtt, Model model) {
		
		//log.info("gb = {}",gb);
		int result = groupService.updateBoard(gb);
		//log.info("result={}",result);
		
		redirectAtt.addFlashAttribute("msg", result>0?"수정성공!":"수정실패!");
		
		return "redirect:/community/group/groupDetail/{groupBoardNo}.do";
	}
	
	//게시물 삭제
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(@RequestParam("groupBoardNo") String groupBoardNo ,RedirectAttributes redirectAtt, Model model) {
		
		int result = groupService.deleteBoard(groupBoardNo);
		//log.info("result = {}",result);
		
		List<Board> boardList = groupService.selectListBoard();

	

		String msg = (result > 0) ? "게시물 삭제 성공!" : "게시물 삭제 실패!";
		
		redirectAtt.addFlashAttribute("msg", msg);

		model.addAttribute("boardList", boardList);

		return "redirect:/community/group/groupList.do";
	}
	
	//게시물 신고하기
	@RequestMapping("/alertBoard.do")
	public String alertBoard(@RequestParam("groupBoardNo") String groupBoardNo,
						     Report report,
							 Principal principal, 
							 RedirectAttributes redirectAtt, Model model) {
		
		//아이디 하나당 게시물을 한번만 신고가능함
		report.setBoardNo(groupBoardNo);
		report.setMemberEmail(principal.getName());
		log.info("report = {}",report);
		
		Map<Object,Object> map = new HashMap<>();
		map.put("memberEmail", principal.getName());
		map.put("boardNo", groupBoardNo);
		
		//report테이블에서 아이디 + 게시물 이 있는지 없는지 확인 
		List<Report> gbReport = groupService.selectOne(map);
		log.info("gbReport = {}", gbReport);
		
		String msg = "";
		
		if(gbReport.isEmpty()) {
			// 없었다면 update하여서 +1 추가
			int result1 = groupService.insertReport(report);
			int result2 = groupService.updateCnt(map);
			
			msg = "성공적으로 신고 접수를 하였습니다";
		}
		else {
			msg = "이미 신고 접수 건이 존재합니다";
		}
		
		redirectAtt.addFlashAttribute("msg", msg);
		
		return "redirect:/community/group/groupList.do";
	}
	
}
