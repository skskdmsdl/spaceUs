package com.kh.spaceus.space.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.spaceus.space.model.service.SpaceService;


@Controller
@RequestMapping("/space")
public class SpaceListController {
	
	@Autowired
	private SpaceService spaceSerivce;
	
	@RequestMapping(value = "/autocomplete.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String autocomplete(@RequestParam String value) {
		System.out.println(value);
		
		List<Object> array = spaceSerivce.selectAutoList(value);
	    	    	    
	    Gson gson = new Gson();
	    
	    return gson.toJson(array);
	}
	

}
