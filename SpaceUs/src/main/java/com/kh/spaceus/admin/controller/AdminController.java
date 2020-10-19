package com.kh.spaceus.admin.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spaceus.admin.model.service.AdminService;
import com.kh.spaceus.admin.model.vo.ConfirmSpace;
import com.kh.spaceus.admin.model.vo.ConfirmSpaceOption;
import com.kh.spaceus.admin.model.vo.ConfirmSpaceTag;
import com.kh.spaceus.admin.model.vo.ManageBlackList;
import com.kh.spaceus.admin.model.vo.ManageMember;
import com.kh.spaceus.admin.model.vo.ManageRecruit;
import com.kh.spaceus.admin.model.vo.ManageSpace;
import com.kh.spaceus.community.group.model.vo.GroupBoard;
import com.kh.spaceus.community.group.model.vo.Report;
import com.kh.spaceus.member.model.service.MemberService;
import com.kh.spaceus.member.model.vo.Member;
import com.kh.spaceus.space.model.vo.Category;
import com.kh.spaceus.space.model.vo.Space;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberService memberService;
	
	//회원관리 폼
	@RequestMapping("/memberManage.do")
	public String memberManage(Model model, Principal principal) {
		List<ManageMember> memberList = adminService.selectList();
		log.info("memberList={}",memberList);
		Member member = memberService.selectOneMember(principal.getName());
		
		model.addAttribute("member", member);
		model.addAttribute("memberList", memberList);
		return "admin/memberManage";
	}
	
	//Id로 입력시 회원목록 조회
	@RequestMapping("/findUserList.do")
	public String findUserList(Model model, @RequestParam String searchType, @RequestParam String searchKeyword) {
		log.info("searchType={}", searchType);
		log.info("searchKeyword={}",searchKeyword);
		
		List<ManageMember> memberList = null;
		if(searchType.equals("userId")) {
			memberList = adminService.findUserIdList(searchKeyword);
			log.info("memberList = {}", memberList);
		}
		else if(searchType.equals("userName")) {
			memberList = adminService.findUserNameList(searchKeyword);						
			log.info("memberList = {}", memberList);
		}
		else if(searchType.equals("userRole")) {
			if(searchKeyword.equals("total")) {
				memberList = adminService.selectList();
			}else{
				memberList = adminService.findUserRoleList(searchKeyword);
			}
		}
		
		model.addAttribute("memberList", memberList);
		return "admin/memberManage";
	}
	
	//공간관리 폼
	@RequestMapping("/spaceManage.do")
	public String spaceManage(Model model) {
		List<ManageSpace> spaceList = adminService.selectSpaceList();
		
		model.addAttribute("spaceList", spaceList);
		return "admin/spaceManage";
	}
	
	//블랙리스트관리 폼
	@RequestMapping("/blackListManage.do")
	public String blackListManage(Model model) {
		List<ManageBlackList> groupList = adminService.selectGroupList();
		List<ManageBlackList> recruitList = adminService.selectRecruitList();
		List<GroupBoard> gbList = adminService.selectGBList();
		List<ManageRecruit> rList = adminService.selectrList();
		
		model.addAttribute("groupList", groupList);
		model.addAttribute("recruitList", recruitList);
		model.addAttribute("gbList", gbList);
		model.addAttribute("rList", rList);
		return "admin/blackListManage";
	}
	
	
	@GetMapping(value="/reasonList.do",
				produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<Report> reasonList(Model model, @RequestParam String boardNo) {
		log.info("boardNo={}",boardNo);
		List<Report> reasonList = adminService.selectReasonList(boardNo);
		log.info("reasonList={}",reasonList);
		
		return reasonList;
	}
	
	@RequestMapping("confirmSpaceFrm.do")
	public String confirmSpaceFrm(@RequestParam String spaceNo, Model model) {
		log.info("spaceNo = {}", spaceNo);
		//space
		List<Space> spaceOneList = adminService.selectSpaceOneList(spaceNo);
		//image
		List<ConfirmSpace> spaceOneImageList = adminService.selectSpaceOneImageList(spaceNo);
		//category
		List<Category> spaceOneCategory = adminService.selectSpaceOneCategory(spaceNo);
		//tag
		List<ConfirmSpaceTag> spaceOneTagList = adminService.selectSpaceOneTagList(spaceNo);
		//option
		List<ConfirmSpaceOption> spaceOneOptionList = adminService.selectSpaceOptionList(spaceNo); 
		
		model.addAttribute("spaceOneList", spaceOneList);
		model.addAttribute("sapceOneImageList", spaceOneImageList);
		model.addAttribute("spaceOneCategory", spaceOneCategory);
		model.addAttribute("spaceOneTagList", spaceOneTagList);
		model.addAttribute("spaceOneOptionList", spaceOneOptionList);
		return "admin/confirmSpaceFrm";
	}
	
	@PostMapping("spaceConfirm.do")
	@ResponseBody
	public void spaceConfirm(@ModelAttribute Space param1) {
		log.info("param1={}",param1);
		//status update
		int result1 = adminService.updatdStatus(param1);
		//host
		int result2 = adminService.updateHost(param1);
		
	}
	
}
