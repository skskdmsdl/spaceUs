package com.kh.spaceus.space.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spaceus.space.model.service.SpaceService;
import com.kh.spaceus.space.model.vo.Category;
import com.kh.spaceus.space.model.vo.OptionList;
import com.kh.spaceus.space.model.vo.Space;

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
		System.out.println("ssssssssssssss:  " + keyword);
		/* System.out.println(spaceNoList); */
		log.info("spaceNoList={}", spaceNoList);
		 //spaceNo 하나씩 나누기
		 for(int i=0; i<spaceNoList.size(); i++) {
			 //System.out.println(spaceNoList.subList(i, i+1));
			 List<String> spaceNo = spaceNoList.subList(i, i+1);
			 
			 //List -> String
			 String searchSpace = spaceNo.toString();
			 searchSpace = searchSpace.replace("[", "");
			 searchSpace = searchSpace.replace("]", "");
			 System.out.println(searchSpace);
			 
			 // 가져온 spaceNo로 space테이블 데이터 가져오기
			 List<Space> spaceList = spaceSerive.selectSearchSpaceList(searchSpace);
			 //log.info("spaceList={}",spaceList);
			 
		 }

		mav.addObject("keyword", keyword);
		
		 mav.addObject("categoryList", categoryList);
		 mav.addObject("optionList",optionList);
		 mav.addObject("spaceNoList", spaceNoList);
		return mav;
	}

}
