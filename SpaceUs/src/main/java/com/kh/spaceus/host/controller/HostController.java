package com.kh.spaceus.host.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spaceus.host.model.service.HostService;
import com.kh.spaceus.host.model.vo.Qna;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/host")
public class HostController {
	
	@Autowired
	private HostService hostService;
	
	private Logger log = 
			LoggerFactory.getLogger(HostController.class);
	
	
	//정산내역
	@RequestMapping("/settlementDetails.do")
	public String settlementDetails () {
		
		return "host/settlementDetails";
	}
	
	@RequestMapping("/spaceInfo.do")
	public String ManageSpace() {
		
		return "host/spaceInfo";
	}
	
	@RequestMapping("/hostReservation.do")
	public String ManageHostReservation() {
		
		return "host/hostReservation";
	}	
	
	@RequestMapping("/hostCheckReview.do")
	public String CheckNewReview(Principal principal, Model model) {
		log.debug("principal = {}", principal);
		model.addAttribute("loginMember", principal);
		
		return "host/hostCheckReview";
	}
	
	@RequestMapping("/hostCheckArticle.do")
	public String CheckNewArticle(Principal principal, Model model) {
		log.debug("principal = {}", principal);
		model.addAttribute("loginMember", principal);
		
		return "host/hostCheckArticle";
	}
	
	@RequestMapping(value= "/unreplied.do", method = RequestMethod.GET)
	@ResponseBody
	public List<Qna> SelectUnreplied(@RequestParam("hostId") String hostId) {
		
		
		List<Qna> list = hostService.selectUnreplied(hostId);
	
		log.debug("list = {}", list);
		
		return list;
	}
	
}
