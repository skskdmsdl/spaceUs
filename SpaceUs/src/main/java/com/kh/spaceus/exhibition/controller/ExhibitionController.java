package com.kh.spaceus.exhibition.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spaceus.common.Utils;
import com.kh.spaceus.exhibition.model.service.ExhibitionService;
import com.kh.spaceus.exhibition.model.vo.Exhibition;
import com.kh.spaceus.exhibition.model.vo.ExhibitionTag;
import com.kh.spaceus.space.model.vo.SpaceList;

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

		System.out.println("@@@@@@@@"+list);
		
		mav.addObject("list", list);
		
		mav.setViewName("exhibition/exhibition");
		
		return mav;
	}
	
	//기획전리스트
	@RequestMapping("/exhibitionList.do")
	public ModelAndView exhibitionList(@RequestParam("tagNo") String tagNo, ModelAndView mav) {
		System.out.println(tagNo);
		
		List<SpaceList> exList = exhibitionService.selectByTagNo(tagNo);
		
		Exhibition exhibition = exhibitionService.selectOneByTag(tagNo);
		
		
		mav.addObject("exhibition", exhibition);
		mav.addObject("exList", exList);
		mav.setViewName("exhibition/exhibitionList");
		
		return mav;
	}

	//기획전추가폼
	@RequestMapping("/insertExhibitionFrm.do")
	public String insertExhibitionFrm(Model model) {
		List<ExhibitionTag> tagList = exhibitionService.selectTagList();
		
		model.addAttribute("tagList", tagList);
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
		model.addAttribute("renamedFileName", renamedFileName);
		return renamedFileName;
	}
	
	//기획전추가
	@GetMapping("/insertExhibition.do")
	public String insertExhibition(Exhibition exhibition) {
		
		int result = exhibitionService.insertExhibition(exhibition);
		
		log.info("result = {}", result);
		
		return "redirect:exhibition.do";
	}
	
	
	//기획전삭제
	@RequestMapping("/deleteExhibition")
	public ModelAndView deleteExhibition(ModelAndView mav, @RequestParam("exNo") String exNo) {
		
		
		Exhibition exhibition = exhibitionService.selectOne(exNo);
		//log.info("exhibition = {}", exhibition);
		
		//삭제할 파일의 경로
		String imagePath = servletContext.getRealPath("resources/upload/exhibition/" + exhibition.getRenamedFileName());
		
		//log.info("imagePath = {}", imagePath);
		
		File file = new File(imagePath);
		if(file.exists() == true)
			file.delete();
		
		int result = exhibitionService.deleteExhibition(exNo);
		
		mav.setViewName("exhibition/exhibition");
		return mav;
	}
}
