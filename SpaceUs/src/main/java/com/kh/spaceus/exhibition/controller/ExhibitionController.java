package com.kh.spaceus.exhibition.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spaceus.common.Utils;
import com.kh.spaceus.exhibition.model.service.ExhibitionService;
import com.kh.spaceus.exhibition.model.vo.Exhibition;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/exhibition")
public class ExhibitionController {
	
	@Autowired
	ExhibitionService exhibitionService;
	
	@Autowired
	ServletContext servletContext;
	
	//기획전메인
	@RequestMapping("/exhibition.do")
	public ModelAndView exhibition(ModelAndView mav) {
		
		List<Exhibition> list = exhibitionService.selectExList();
		
		log.info("list = {}", list);
		
		mav.addObject("list", list);
		
		mav.setViewName("exhibition/exhibition");
		return mav;
	}
	
	//기획전리스트
	@RequestMapping("/exhibitionList.do")
	public String exhibitionList() {
		return "exhibition/exhibitionList";
	}

	//기획전추가폼
	@RequestMapping("/insertExhibitionFrm.do")
	public String insertExhibitionFrm() {
		return "exhibition/insertExhibition";
	}
	
	
	//이미지업로드
	@RequestMapping(value = "/uploadImage.do",
					method= RequestMethod.POST,
					produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String uploadImage(@RequestParam("upFile") MultipartFile[] uploadfile,
												HttpServletRequest request, Model model) throws Exception {
		
		String saveDirectory = request.getServletContext()
				  .getRealPath("/resources/upload/exhibition");
		
		String renamedFileName = null;
		
	for(MultipartFile f : uploadfile) {
			
		if(!f.isEmpty() && f.getSize() != 0) {
			renamedFileName = Utils.getRenamedFileName(f.getOriginalFilename());
			
			File newFile = new File(saveDirectory, renamedFileName);
			
			try {
				f.transferTo(newFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
	}
		//log.info("renamedFileName = {}", renamedFileName);
		model.addAttribute("renamedFileName", renamedFileName);
		return renamedFileName;
	}
	
	//기획전추가
	@GetMapping("/insertExhibition.do")
	public String insertExhibition(Exhibition exhibition) {

//		log.info("title = {}", exhibition.getExTitle());
//		log.info("imageUrl = {}", exhibition.getImageUrl());
//		log.info("image = {}", exhibition.getRenamedFileName());
		int result = exhibitionService.insertExhibition(exhibition);
		
		log.info("result = {}", result);
		
		return "redirect:exhibition.do";
	}
	
	
	//기획전삭제
	@RequestMapping("/deleteExhibition")
	public ModelAndView deleteExhibition(ModelAndView mav, @RequestParam("exNo") String exNo) {
		
		
		Exhibition exhibition = exhibitionService.selectOne(exNo);
		log.info("exhibition = {}", exhibition);
		
		//삭제할 파일의 경로
		String imagePath = servletContext.getRealPath("resources/upload/exhibition/" + exhibition.getRenamedFileName());
		
		log.info("imagePath = {}", imagePath);
		
		File file = new File(imagePath);
		if(file.exists() == true)
			file.delete();
		
		int result = exhibitionService.deleteExhibition(exNo);
		
		mav.setViewName("exhibition/exhibition");
		return mav;
	}
}
