package com.kh.spaceus.space.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spaceus.space.model.service.SpaceService;
import com.kh.spaceus.space.model.vo.Category;
import com.kh.spaceus.space.model.vo.OptionList;
import com.kh.spaceus.space.model.vo.SpaceList;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/space")
public class SearchSpaceController {

	@Autowired
	private SpaceService spaceSerive;

	@RequestMapping(value = "/searchSpace.do", method = RequestMethod.GET)
	public ModelAndView searchSpace(ModelAndView mav, @RequestParam("keyword") String keyword, @RequestParam String sort) {
		//log.info("sort={}",sort);
		// 입력값을 통해 spaceNo가져오기
		List<String> spaceNoList = spaceSerive.selectSpaceNoList(keyword,sort);
		
		List<SpaceList> space = null;
		List<SpaceList> spaceList = new ArrayList<>();
		
		 //spaceNo 하나씩 나누기
		 for(int i=0; i<spaceNoList.size(); i++) {
		
			 List<String> spaceNo = spaceNoList.subList(i, i+1);
			 
			 //List -> String
			 String searchSpace = spaceNo.toString();
			 searchSpace = searchSpace.replace("[", "");
			 searchSpace = searchSpace.replace("]", "");
			 
			 
			 // 가져온 spaceNo로 space테이블 데이터 가져오기
			 space = spaceSerive.selectSearchSpaceList(searchSpace);
			 
			 //리스트로 space 정보들 합쳐 list저장
			 spaceList.addAll(space);
			 
		 }
		 mav.addObject("keyword", keyword);
		 mav.addObject("spaceList", spaceList);
		 mav.addObject("sort", sort);
		return mav;
	}
	
	@GetMapping("/searchDetailSpace.do")
	public ModelAndView searchDetailSpace(ModelAndView mav, @RequestParam String category, @RequestParam String location, @RequestParam String option, @RequestParam String sort) {
		log.info("sort={}",sort);
		
		String keyword = location+" "+category+" "+option;
		
		Map<String,String> map = new HashMap<>();
		map.put("category", category);
		map.put("location", location);
		map.put("option", option);
		log.info("map={}",map);
		
		//space_no 가져오기
		List<String> spaceNo = spaceSerive.selectSearchDetailSpaceNo(map);
		log.info("spaceNo={}",spaceNo);
		
		//space_no로 차례로 space 데이터 가져오기
		List<SpaceList> space = null;
		List<SpaceList> spaceList = new ArrayList<>();
		
		for(int i=0;i<spaceNo.size();i++) {
			List<String> spaceNo1 = spaceNo.subList(i, i+1);
			String spaceNo2 = spaceNo1.toString();
			spaceNo2 = spaceNo2.replace("[", "");
			spaceNo2 = spaceNo2.replace("]", "");
			
			space = spaceSerive.selectSearchSpaceList(spaceNo2);
			spaceList.addAll(space);
			System.out.println(spaceList);
			
		}
		mav.setViewName("space/searchSpace");
		mav.addObject("category", category);
		mav.addObject("option", option);
		mav.addObject("location", location);
		mav.addObject("keyword", keyword);
		mav.addObject("spaceList",spaceList);
		mav.addObject("spaceNo", spaceNo);
		mav.addObject("sort", sort);
		return mav;
	}
}
