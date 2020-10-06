package com.kh.spaceus.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spaceus.reservation.model.service.ReservationService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired 
	private ReservationService reservationService;
	 
	/*@RequestMapping(value="/getRevAvail.do")
	public ModelAndView insertSpace(ModelAndView mav,
									@RequestParam String day) {
		//log.debug("해쉬태그 등록 요청");
		//log.debug("day = {}",day);
		System.out.println("day="+day);
		
		return mav;
	}*/
	
	
}

