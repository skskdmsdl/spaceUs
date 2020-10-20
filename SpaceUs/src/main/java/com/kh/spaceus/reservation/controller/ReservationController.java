package com.kh.spaceus.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spaceus.member.model.service.MemberService;
import com.kh.spaceus.reservation.model.service.ReservationService;
import com.kh.spaceus.reservation.model.vo.Reservation;
import com.kh.spaceus.reservation.model.vo.ReservationAvail;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired 
	private ReservationService reservationService;
	
	@Autowired
	private MemberService memberService;
	 
	@RequestMapping(value="/insertReservation.do")
	public String insertReservation(Reservation reservation, @RequestParam("couponNo") String couponNo) {
			int result = reservationService.insertReservation(reservation);
			int result2 = memberService.deleteCoupon(couponNo);
			

		return "redirect:/member/usageHistory.do";
	}
	
	@RequestMapping(value="/cancelReservation.do")
	public String cancleReservation(@RequestParam("revNo") String revNo) {
		
		int result = reservationService.cancleReservation(revNo);
		
		return "redirect:/member/usageHistory.do";
	}
	
}

