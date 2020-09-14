package com.kh.spaceus.space.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/space")
public class SpaceController {

	
	@RequestMapping("/space.do")
	public String space() {
		
		return "space/space";
	}
	
	@RequestMapping("/spaceDetail.do")
	public String spaceDetail() {
		
		return "space/spaceDetail";
	}
}

