package com.kh.spaceus.space.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spaceus.space.model.service.SpaceService;
import com.kh.spaceus.space.model.vo.Category;
import com.kh.spaceus.space.model.vo.OptionList;
import com.kh.spaceus.space.model.vo.SearchDetailSpace;
import com.kh.spaceus.space.model.vo.SpaceList;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/space")
public class SearchSpaceController {

	@Autowired
	private SpaceService spaceSerive;

	@RequestMapping(value = "/searchSpace.do", method = RequestMethod.GET)
	public ModelAndView searchSpace(ModelAndView mav, @RequestParam("keyword") String keyword) {
		// category List
		List<Category> categoryList = spaceSerive.selectCategoryList();
		// option List
		List<OptionList> optionList = spaceSerive.selectOptionList1();

		// 입력값을 통해 spaceNo가져오기
		List<String> spaceNoList = spaceSerive.selectSpaceNoList(keyword);
		
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
		 System.out.println(spaceList);
		 
		 
		 mav.addObject("keyword", keyword);
		
		 mav.addObject("categoryList", categoryList);
		 mav.addObject("optionList",optionList);
		 mav.addObject("spaceNoList", spaceNoList);
		 mav.addObject("spaceList", spaceList);
		return mav;
	}
	
	@GetMapping("/searchDetailSpace222.do")
	@ResponseBody
	public void searchDetailSpace(@ModelAttribute SearchDetailSpace param1) {
		System.out.println(param1); 
		
		Map<String,Object> map = new HashMap<>();
		map.put("category", param1.getCategory());
		map.put("location", param1.getLocation());
		map.put("optionArr", param1.getOption());
		
		System.out.println(map);
		
		List<Map<String,Object>> list = spaceSerive.selectSearchDetailSpace(map);
		log.info("list= {}",list);
	}
	
	@GetMapping("/searchDetailSpace.do")
	public ModelAndView searchDetailSpace(ModelAndView mav, @RequestParam String category, @RequestParam String location, @RequestParam String option) {
		log.info("category={}",category);
		log.info("location={}",location);
		log.info("option={}",option);
		String keyword = category+" "+location+" "+option;
		
		
		mav.setViewName("space/searchSpace");
		mav.addObject("keyword", keyword);
		return mav;
	}

}
