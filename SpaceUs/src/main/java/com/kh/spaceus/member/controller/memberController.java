package com.kh.spaceus.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
public class memberController {
	
	//프로필
	@RequestMapping("/memberProfile.do")
	public String memberProfile () {
		
		return "member/memberProfile";
	}
	
	//이용내역
	@RequestMapping("/usageHistory.do")
	public String usageHistory () {
		
		return "member/usageHistory";
	}
	
	//위시리스트
	@RequestMapping("/wishList.do")
	public String wishList () {
		
		return "member/wishList";
	}
	
	//쿠폰함
	@RequestMapping("/couponList.do")
	public String couponList () {
		
		return "member/couponList";
	}
	
	//리뷰목록
	@RequestMapping("/reviewList.do")
	public String reviewList () {
		
		return "member/reviewList";
	}
	
	//출석이벤트
	@RequestMapping("/stampEvent.do")
	public String stampEvent () {
		
		return "member/stampEvent";
	}
	
	//로그인 폼
	@RequestMapping("/memberLoginForm.do")
	public String memberLoginForm() {
		
		return "member/memberLoginForm";
	}
	
	//로그인
	@RequestMapping("/memberLogin.do")
	public String memberLogin () {
		
		return "redirect:/";
	}
	
	//회원가입
	@RequestMapping("/memberEnrollForm.do")
	public String memberEnroll() {
		
		return "member/memberEnrollForm";
	}
	
	
	//로그아웃
	@RequestMapping("/memberLogout.do")
	public String memberLogout() {
		return "redirect:/";
	}
	
	
}
