package com.kh.spaceus.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spaceus.reservation.model.service.ReservationService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired 
	private ReservationService reservationService;
	 
	
	
}

