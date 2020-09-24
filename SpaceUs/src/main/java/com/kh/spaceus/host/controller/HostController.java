package com.kh.spaceus.host.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/host")
public class HostController {
	
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
	
	@RequestMapping("/hostCheckArticle.do")
	public String CheckNewArticle() {
		
		return "host/hostCheckArticle";
	}
	
}
