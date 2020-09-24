package com.kh.spaceus.space.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.kh.spaceus.space.model.service.SpaceService;
import com.kh.spaceus.space.model.vo.HashTag;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/space")
public class SpaceController {
	
	
	@Autowired private SpaceService spaceService;
	 
	
	@RequestMapping("/insertSpace.do")
	public String insertSpace() {
		
		return "space/insertSpace";
	}
	
	@GetMapping("/insertHashTag.do")
	@ResponseBody
	public Map<String, Object> insertHashTag(@RequestParam("hashTag") String hashTag) {
		System.out.println("@@@@@@@@@@");
		log.debug("해쉬태그 등록 요청");
		//1.업무로직 : 중복체크
    	HashTag tag = spaceService.selectOneTag(hashTag);
    	Map<String, Object> map = new HashMap<>();
    	if(tag==null) {
	    	int result = spaceService.insertHashTag(hashTag);
	    	map.put("hashTag", hashTag);
    	}
    	else {
    		map.put("hashTag", hashTag);
    	}
		return map;
	}
	
	@RequestMapping("/spaceDetail.do")
	public String spaceDetail() {
		
		return "space/spaceDetail";
	}
	
	@RequestMapping("/reserveSpace.do")
	public String reserveSpace() {
		
		return "space/reserveSpace";
	}
	
	@RequestMapping(value="/searchSpace.do",
					method=RequestMethod.GET)
	public ModelAndView searchSpace(ModelAndView mav, @RequestParam("search_keyword") String keyword) {
		mav.addObject("keyword", keyword);
		
		
		return mav;
	}
	
	
}

