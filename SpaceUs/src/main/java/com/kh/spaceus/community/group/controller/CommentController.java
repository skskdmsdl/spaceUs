package com.kh.spaceus.community.group.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.xmlbeans.impl.xb.xsdschema.RedefineDocument.Redefine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spaceus.community.group.model.service.GroupService;
import com.kh.spaceus.community.group.model.vo.GBComment;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/community/comment")
public class CommentController {
	
	@Autowired
	private GroupService groupService;
	
	@PostMapping("/insertComment/{groupBoardRef}.do")
	public String insertComment(@PathVariable("groupBoardRef") String groupBoardRef,
								@ModelAttribute GBComment param1, RedirectAttributes redirectAttr) {
		log.info("comment={}",param1);
		String msg = "댓글 등록 성공!";
		try {
			int result = groupService.insertComment(param1);
			
		}catch(Exception e) {
			log.error("댓글 등록 오류",e);
			msg = "댓글 등록 실패!";
		}
		redirectAttr.addFlashAttribute("msg", msg);
		return "redirect:/community/group/groupDetail/{groupBoardRef}.do";
	}
}
