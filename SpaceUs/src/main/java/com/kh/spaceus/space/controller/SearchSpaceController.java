package com.kh.spaceus.space.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spaceus.admin.model.vo.ConfirmSpaceImage;
import com.kh.spaceus.space.model.service.SpaceService;
import com.kh.spaceus.space.model.vo.Category;
import com.kh.spaceus.space.model.vo.OptionList;
import com.kh.spaceus.space.model.vo.Space;
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

}
