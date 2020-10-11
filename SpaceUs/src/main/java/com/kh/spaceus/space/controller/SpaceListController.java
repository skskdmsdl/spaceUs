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
		
	    List<Object> array = spaceSerivce.selectAutoTagList(value);
	    
	    System.out.println(array);
	    
	    Gson gson = new Gson();
	     
	    System.out.println(gson.toJson(array));
	    
	    return gson.toJson(array);
	}
	
	@RequestMapping(value = "/autocomplete2.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String autocomplete2(@RequestParam String value) {
		System.out.println(value);
		
	    List<Object> array = spaceSerivce.selectAutoCategoryList(value);
	    
	    System.out.println(array);
	    
	    Gson gson = new Gson();
	     
	    System.out.println(gson.toJson(array));
	    
	    return gson.toJson(array);
	}
	
	@RequestMapping(value = "/autocomplete3.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String autocomplete3(@RequestParam String value) {
		System.out.println(value);
		
	    List<Object> array = spaceSerivce.selectAutoOptionList(value);
	    
	    System.out.println(array);
	    
	    Gson gson = new Gson();
	     
	    System.out.println(gson.toJson(array));
	    
	    return gson.toJson(array);
	}
}
