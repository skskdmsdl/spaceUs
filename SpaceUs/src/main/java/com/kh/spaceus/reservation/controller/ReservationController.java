package com.kh.spaceus.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spaceus.reservation.model.service.ReservationService;
import com.kh.spaceus.reservation.model.vo.Reservation;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired 
	private ReservationService reservationService;
	 
	@RequestMapping(value="/insertReservation.do")
	public String insertReservation(Reservation reservation) {
		System.out.println("reservation="+reservation);
		
		int result = reservationService.insertReservation(reservation);
	
		return "redirect:/member/usageHistory.do";
	}
	
	@RequestMapping(value="/cancleReservation.do")
	public String cancleReservation(@RequestParam("revNo") String revNo) {
		System.out.println("revNO="+revNo);
		
		int result = reservationService.cancleReservation(revNo);
		
		return "redirect:/member/usageHistory.do";
	}
	
}

