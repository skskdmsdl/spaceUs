package com.kh.spaceus.host.controller;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.streaming.SXSSFCell;
import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spaceus.host.model.service.HostService;
import com.kh.spaceus.member.model.service.MemberService;
import com.kh.spaceus.member.model.vo.Member;
import com.kh.spaceus.qna.model.vo.Qna;
import com.kh.spaceus.reservation.model.service.ReservationService;
import com.kh.spaceus.reservation.model.vo.Reservation;
import com.kh.spaceus.reservation.model.vo.ReservationAvail;
import com.kh.spaceus.space.model.service.SpaceService;
import com.kh.spaceus.space.model.vo.Option;
import com.kh.spaceus.space.model.vo.OptionList;
import com.kh.spaceus.space.model.vo.Review;
import com.kh.spaceus.space.model.vo.Space;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;

@Controller
@Slf4j
@RequestMapping("/host")
public class HostController {
	
	@Autowired
	private HostService hostService;
	
	@Autowired 
	private SpaceService spaceService;
	
	@Autowired 
	private MemberService memberService;
	
	@Autowired 
	private ReservationService reservationService;
	
	//정산내역
	@RequestMapping("/settlementDetails.do")
	public String settlementDetails () {
		
		return "host/settlementDetails";
	}
	
	//공간정보
	@RequestMapping("/spaceInfo.do")
	public ModelAndView ManageSpace(Principal principal, ModelAndView mav, Model model) {
		Space space = spaceService.selectOneSpaceNo(principal.getName());
		String cateName = spaceService.selectCateName(space.getCategoryNo());
		//List<Tag> tag = spaceService.selectListSpaceTag(space.getSpaceNo());
		List<OptionList> optionList = spaceService.selectOptionList(space.getSpaceNo());
		List<ReservationAvail> revAvail = reservationService.selectListAvail(space.getSpaceNo());
		
		model.addAttribute("cateName", cateName);
		mav.addObject("space", space);
		mav.addObject("optionList", optionList);
		mav.addObject("revAvail",revAvail);
		
		mav.setViewName("host/spaceInfo");
		
		return mav;
	}
	
	@RequestMapping("/updateSpace.do")
	public String updateSpace(@RequestParam String optionNo,
							  @RequestParam String day,
							  @RequestParam String status,
							  @RequestParam String spaceNo) {
		//option 삭제
		int result = spaceService.deleteOption(spaceNo);
		
		//option 추가
		String[] array = optionNo.split(",");
	    List<Option> optionList = new ArrayList<>();
	    Option option = new Option();
	    for(String str : array) {
	    	option.setOptionNo(str);
	    	option.setSpaceNo(spaceNo);
	    	int result2 = spaceService.insertOption(option);
	    }
	    
	    //reservation_avail 삭제
	    int result3 = reservationService.deleteRevAvail(spaceNo);
	    
	    //reservation_avail 추가
	    List<Map<String,Object>> info = new ArrayList<Map<String,Object>>();
		ReservationAvail reservationAvail = new ReservationAvail();
		
	    info = JSONArray.fromObject(day);
	    for (Map<String, Object> memberInfo : info) {
	    	if((int)memberInfo.get("startHour")==-1||(int)memberInfo.get("endHour")==-1)
	    		continue;
	    	reservationAvail.setDay((String) memberInfo.get("day"));
	    	reservationAvail.setSpaceNo(spaceNo);
	    	reservationAvail.setStartHour((int)memberInfo.get("startHour"));
	    	reservationAvail.setEndHour((int)memberInfo.get("endHour"));
	    	int result4 = reservationService.insertReservationVail(reservationAvail);
	    } 
	    
	    //status 수정
	    int result5 = spaceService.updateStatus(spaceNo, status);
		
	    System.out.println("=======================");
	    System.out.println(result);
	    System.out.println(result3);
	    System.out.println(result5);
	    System.out.println("=======================");
	    
		return "redirect:/host/spaceInfo.do";
	}
	
	//예약 현황 
	@RequestMapping("/hostReservation.do")
	public String ManageHostReservation(Principal principal, Model model) {
		
		String memberEmail = principal.getName();
		List<Reservation> list = reservationService.selectHostReservationList(memberEmail);
	
		model.addAttribute("list", list);
		return "host/hostReservation";
	}	
	
	//순서별 예약현황
	@RequestMapping("/hostReservationOrder.do")
	public String hostReservationOrder(Principal principal, Model model, @RequestParam String order) {
		
		String memberEmail = principal.getName();
		System.out.println(order);
		if(order.equals("all")) {
			List<Reservation> list = reservationService.selectHostReservationList(memberEmail);
			model.addAttribute("list", list);
			System.out.println(list);
		}
		else {
			List<Reservation> list = reservationService.selectUseReservation(memberEmail);
			model.addAttribute("list", list);
			System.out.println(list);
		}
		return "host/hostReservation";
	}	
	
	//예약 회원 조회 
	@RequestMapping("/hostSearchReservation.do")
	public String hostSearchReservation(Principal principal, Model model, Reservation reservation) {
		
		reservation.setHostEmail(principal.getName());
		List<Reservation> list = reservationService.hostSearchReservation(reservation);
		
		model.addAttribute("list", list);
		return "host/hostReservation";
	}	
	
	
	//공간 리뷰 조회
	@RequestMapping("/hostCheckReview.do")
	public String CheckNewReview(Principal principal, Model model) {
		log.debug("principal = {}", principal);
		model.addAttribute("loginMember", principal);
		
		return "host/hostCheckReview";
	}
	
	//공간 질문글 조회
	@RequestMapping(value="/hostCheckArticle.do", method=RequestMethod.GET)
	public ModelAndView CheckNewArticle(Principal principal, ModelAndView mav){
		log.debug("principal = {}", principal);
		
		String hostId = principal.getName();
		
		List<Qna> list = hostService.selectQuestionList(hostId);
		Member member = memberService.selectOneMember(principal.getName());
		mav.addObject("member", member);
		mav.addObject("list", list);
		mav.setViewName("host/hostCheckArticle");
		
		return mav;
	}
	
	//공간 미답변 질문글 조회
	@RequestMapping(value= "/unreplied.do", method = RequestMethod.GET)
	@ResponseBody
	public List<Qna> SelectUnreplied(@RequestParam("hostId") String hostId) {
		
		
		List<Qna> list = hostService.selectUnreplied(hostId);
	
		log.debug("list = {}", list);
		
		return list;
	}
	
	//정산 내역 엑셀 파일 다운로드
	@RequestMapping(value="/excelDown.do", method = RequestMethod.POST)
	public SXSSFWorkbook ExcelDownload(@RequestParam String hostId, HttpServletResponse response, Model model)
			throws Exception {
		
		SXSSFWorkbook objWorkBook = new SXSSFWorkbook();
		SXSSFSheet objSheet = null;
		SXSSFRow objRow = null;
		SXSSFCell objCell = null; // 셀 생성
		
		objSheet = objWorkBook.createSheet("일별 정산내역"); // 워크시트 생성
		
		List<HashMap<String,Object>> rowList = hostService.selectSettlementList(hostId);
		
		// 1행
		objRow = objSheet.createRow(0);
		objRow.setHeight((short) 0x150);
	
		objCell = objRow.createCell(0);
		objCell.setCellValue("공간 번호");
		
		objCell = objRow.createCell(1);
		objCell.setCellValue("공간 명");
		
		objCell = objRow.createCell(2);
		objCell.setCellValue("총 이용시간");
		
		objCell = objRow.createCell(3);
		objCell.setCellValue("정산 액수");
		
		int index = 1;
		for (HashMap<String,Object> map : rowList) {
			objRow = objSheet.createRow(index);
			objRow.setHeight((short) 0x150);
			
			objCell = objRow.createCell(0);
			objCell.setCellValue((String)map.get("spaceNo"));
			
			objCell = objRow.createCell(1);
			objCell.setCellValue((String)map.get("spaceName"));
			
			objCell = objRow.createCell(2);
			objCell.setCellValue((String)map.get("totalHour"));
			
			objCell = objRow.createCell(3);
			objCell.setCellValue((String)map.get("revenue"));
			index++;
		}
		
		for (int i = 0; i < rowList.size(); i++) {
			objSheet.autoSizeColumn(i);
		}
		
		response.setContentType("Application/Msexcel");
		response.setHeader("Content-Disposition", "ATTachment; Filename="
				+ URLEncoder.encode(hostId, "UTF-8") + ".xlsx");
		
		OutputStream fileOut = response.getOutputStream();
		objWorkBook.write(fileOut);
		fileOut.close();
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
		return objWorkBook;
	}
	
	//리뷰 목록
	@RequestMapping("/reviewList.do")
	public String reviewList(Principal principal,
							 Model model,
							 @RequestParam(defaultValue = "1", value = "cPage")
							 int cPage) {
		final int limit = 10; 
		int offset = (cPage - 1) * limit;
		Space space = spaceService.selectOneSpaceNo(principal.getName());
		String spaceNo = space.getSpaceNo();
		List<Review> review = spaceService.selectListReview(spaceNo, limit, offset);
		
		model.addAttribute("review", review);
		model.addAttribute("spaceNo", spaceNo);
		
		return "host/hostReviewList";
	}
	
	//댓글 등록
	@GetMapping("/updateReviewComment.do")
	public ModelAndView updateReviewComment(ModelAndView mav,
										   @RequestParam("content") String content,
										   @RequestParam("reviewNo") String reviewNo) {
		
		Review review = new Review();
		review.setReviewNo(reviewNo);
		review.setContent(content);
		
		int result = spaceService.updateReviewComment(review);
		
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//리뷰 조회
	@GetMapping("/selectReviewComment.do")
	public ModelAndView selectReviewComment(ModelAndView mav,
											@RequestParam("spaceNo") String spaceNo,
											@RequestParam(defaultValue = "1", value = "cPage")
											int cPage) {
		final int limit = 10; 
		int offset = (cPage - 1) * limit;
		
		List<Review> review = spaceService.selectReviewComment(spaceNo, limit, offset);
		
		mav.addObject("review", review);
		mav.addObject("spaceNo", spaceNo);
		mav.addObject("comment", "no");
		mav.setViewName("host/hostReviewList");
		System.out.println(review);
		return mav;
	}
	
}
