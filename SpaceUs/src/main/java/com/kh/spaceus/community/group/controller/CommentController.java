package com.kh.spaceus.community.group.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.spaceus.community.group.model.service.GroupService;
import com.kh.spaceus.community.group.model.vo.CmtReport;
import com.kh.spaceus.community.group.model.vo.GBComment;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/community/comment")
public class CommentController {
	
	@Autowired
	private GroupService groupService;
	
	@PostMapping("/insertComment/{groupBoardRef}.do")
	public void insertComment(@PathVariable("groupBoardRef") String groupBoardRef,
								@ModelAttribute GBComment param1) {
		log.info("comment={}",param1);
		
		try {
			int result = groupService.insertComment(param1);
			if(result>0) {
				log.info("댓글 등록 성공");				
			}
			
		}catch(Exception e) {
			log.error("댓글 등록 오류",e);
		}
		
	}
	
	@PostMapping("/updateComment.do")
	public void updateComment(@ModelAttribute GBComment param1) {
		log.info("param1 = {}", param1);
		log.info("---------------------------------------------------");
		
		try {
			int result = groupService.updateComment(param1);
			if(result>0) {
				log.info("댓글 수정 성공");
			}
		}catch(Exception e) {
			log.error("댓글 수정 오류",e);
		}
	}
	
	@PostMapping("/deleteComment.do")
	public void deleteComment(@ModelAttribute GBComment param1) {
		log.info("groupBoardCommentNo = {}", param1);
		
		try {
			int result = groupService.deleteComment(param1);
			if(result>0) {
				log.info("댓글 삭제 성공");
			}
		}catch(Exception e) {
			log.error("댓글 삭제 오류",e);
		}
	}
	
	@PostMapping("/alertComment.do")
	public  void alertComment(@ModelAttribute CmtReport param1) {
		log.info("param1 = {}", param1);
	}
}
