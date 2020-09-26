package com.kh.spaceus.space.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spaceus.space.model.service.SpaceService;
import com.kh.spaceus.space.model.vo.Space;
import com.kh.spaceus.space.model.vo.Tag;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/space")
public class SpaceController {
	
	@Autowired 
	private SpaceService spaceService;
	 
	
	@RequestMapping("/insertSpace.do")
	public String insertSpace() {
		
		return "space/insertSpace";
	}
	
	@GetMapping("/insertHashTag.do")
	public ModelAndView insertHashTag(ModelAndView mav, @RequestParam("hashTag") String hashTag) {
		log.debug("해쉬태그 등록 요청");
		//1.업무로직 : 중복체크
    	Tag tag = spaceService.selectOneTag(hashTag);
    	if(tag!=null) {
	    	mav.addObject("hashTag", hashTag);
	    	mav.setViewName("jsonView");
    	}
    	else {
    		spaceService.insertHashTag(hashTag);
	    	mav.addObject("hashTag", hashTag);
	    	mav.setViewName("jsonView");
    	}
		return mav;
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
	//사업자등록증 조회
	@GetMapping("/checkIdDuplicate.do")
    public ModelAndView checkIdDuplicate1(ModelAndView mav,
    									  @RequestParam("businessNum") int businessNum) {
    	
    	//1.업무로직 : 중복체크
    	Space space = spaceService.selectOneSpace(businessNum);
    	boolean isUsable = space == null;
    	
    	//2. model에 속성 등록
    	mav.addObject("isUsable", isUsable);
    	
    	//3. viewName : jsonView빈 지정
    	mav.setViewName("jsonView"); // /WEB-INF/views/jsonView.jsp
    	
    	return mav;
    }
	
}

