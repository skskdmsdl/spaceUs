package com.kh.spaceus.host.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spaceus.common.Utils;
import com.kh.spaceus.host.model.service.HostService;
import com.kh.spaceus.host.model.vo.DailySale;
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
	public ModelAndView settlementDetails (Principal principal, ModelAndView mav) {
		List<DailySale> list = hostService.selectSettlementList(principal.getName());
		ArrayList<String> datelist = new ArrayList<String>();
		ArrayList<Long> revenuelist = new ArrayList<Long>();
		
		
		for(DailySale ds : list) {
			datelist.add(ds.getDate());
			revenuelist.add(ds.getRevenue());
		}
		
		//일정산내역 리스트
		mav.addObject("revenuelist", revenuelist);
		mav.addObject("datelist", datelist);
		mav.addObject("list", list);
		mav.setViewName("host/settlementDetails");
		
		return mav;
	}
	
	//공간정보
	@RequestMapping("/spaceInfo.do")
	public ModelAndView ManageSpace(Principal principal, ModelAndView mav, Model model) {
		Space space = spaceService.selectOneSpaceNo(principal.getName());
		String cateName = spaceService.selectCateName(space.getSpaceNo());
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
	public String ManageHostReservation(Principal principal, Model model, HttpServletRequest request,
										@RequestParam(defaultValue = "1", value = "cPage") int cPage) {
		
		final int limit = 15; 
		int offset = (cPage - 1) * limit;
		String memberEmail = principal.getName();
		List<Reservation> list = reservationService.selectHostReservationList(memberEmail, limit, offset);
	
		int totalContents = reservationService.selectHostRevTotalContents(memberEmail); 
		String url = request.getRequestURI() + "?";
		String pageBar = Utils.getPageBarHtml(cPage, limit, totalContents, url);
		
		model.addAttribute("list", list);
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("totalContents", totalContents);
		return "host/hostReservation";
	}	
	
	//순서별 예약현황
	@RequestMapping("/hostReservationOrder.do")
	public String hostReservationOrder(Principal principal, Model model, @RequestParam String order, HttpServletRequest request,
										@RequestParam(defaultValue = "1", value = "cPage") int cPage) {
		
		final int limit = 15; 
		int offset = (cPage - 1) * limit;
		String memberEmail = principal.getName();
		System.out.println(order);
		if(order.equals("all")) {
			List<Reservation> list = reservationService.selectHostReservationList(memberEmail, limit, offset);
			int totalContents = reservationService.selectHostRevTotalContents(memberEmail); 
			String url = request.getRequestURI() + "?order=all&";
			String pageBar = Utils.getPageBarHtml(cPage, limit, totalContents, url);
			
			model.addAttribute("list", list);
			model.addAttribute("pageBar", pageBar);
			model.addAttribute("totalContents", totalContents);
			return "host/hostReservation";
		}
		else {
			List<Reservation> list = reservationService.selectUseReservation(memberEmail, limit, offset);
			int totalContents = reservationService.selectHostRevTotalContents(memberEmail); 
			String url = request.getRequestURI() +"?order=rev&";
			String pageBar = Utils.getPageBarHtml(cPage, limit, totalContents, url);
			model.addAttribute("list", list);
			model.addAttribute("pageBar", pageBar);
			model.addAttribute("totalContents", totalContents);
			return "host/hostReservation";
		}
	}	
	
	//예약 회원 조회 
	@RequestMapping("/hostSearchReservation.do")
	public String hostSearchReservation(Principal principal, Model model, Reservation reservation, HttpServletRequest request,
			@RequestParam(defaultValue = "1", value = "cPage") int cPage) {
		
		reservation.setHostEmail(principal.getName());
		List<Reservation> list = reservationService.hostSearchReservation(reservation);
		
		model.addAttribute("list", list);
		return "host/hostReservation";
	}	
	
	//공간 질문글 조회
	@RequestMapping(value="/hostCheckArticle.do", method=RequestMethod.GET)
	public ModelAndView CheckNewArticle(Principal principal, ModelAndView mav){
		String hostId = principal.getName();
		
		List<Qna> list = hostService.selectQuestionList(hostId);
		Member member = memberService.selectOneMember(hostId);
		mav.addObject("member", member);
		mav.addObject("list", list);
		mav.setViewName("host/hostCheckArticle");
		
		return mav;
	}
	
	//공간 미답변 질문글 조회
	@RequestMapping(value= "/unreplied.do", method = RequestMethod.GET)
	public ModelAndView SelectUnreplied(Principal principal, ModelAndView mav) {
		String hostId = principal.getName();
		
		List<Qna> list = hostService.selectUnreplied(hostId);
		Member member = memberService.selectOneMember(hostId);
		
		mav.addObject("member", member);
		mav.addObject("list", list);
		mav.setViewName("host/hostCheckUnreplied");
		
		return mav;
	}
	
	//정산 내역 엑셀 파일 다운로드
	@RequestMapping(value = "/excelDown", method = RequestMethod.POST)
    public String downloadExcelFile(Model model, Principal principal) {

		List<DailySale> list = hostService.selectSettlementList(principal.getName());
        
		/* SXSSFWorkbook workbook = hostService.makeSheet(list); */
		SXSSFWorkbook workbook = excelFileDownloadProcess(list);
        
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "정산내역");
        
        return "excelDownloadView";
    }
	

	 /**
    * 엑셀파일로 만들 리스트 생성
    * @param names
    * @param prices
    * @param quantities
    * @return 엑셀파일 리스트
    */
		/*
		 * public List<DailySale> makeSheet(List<DailySale> list){ return
		 * List<DailySale> list; }
		 */
   
   /**
    * 과일 리스트를 간단한 엑셀 워크북 객체로 생성
    * @param list
    * @return 생성된 워크북
    */
   public SXSSFWorkbook makeSimpleExcelWorkbook(List<DailySale> list) {
       SXSSFWorkbook workbook = new SXSSFWorkbook();
       
       // 시트 생성
       SXSSFSheet sheet = workbook.createSheet("정산내역");
       
       //시트 열 너비 설정
       sheet.setColumnWidth(1, 3000);
       sheet.setColumnWidth(2, 7000);
       sheet.setColumnWidth(3, 7000);
       sheet.setColumnWidth(4, 7000);
       
       sheet.addMergedRegion(new CellRangeAddress(1, 3, 1, 4));
       
       //cell 정렬 
       CellStyle mergeRowStyle1 = workbook.createCellStyle();
       mergeRowStyle1.setAlignment(HorizontalAlignment.CENTER);
       mergeRowStyle1.setVerticalAlignment(VerticalAlignment.CENTER);
       //셀테두리 border
       mergeRowStyle1.setBorderTop(BorderStyle.THICK);
       mergeRowStyle1.setBorderLeft(BorderStyle.MEDIUM_DASH_DOT_DOT);
       
       mergeRowStyle1.setFillForegroundColor(IndexedColors.AQUA.getIndex());
       mergeRowStyle1.setFillPattern(FillPatternType.BRICKS);
       //foregroundcolor 대표색
       
       XSSFCellStyle mergeRowStyle2 = (XSSFCellStyle) workbook.createCellStyle();
       //cell font 설정
       Font headerFont = workbook.createFont();
       headerFont.setFontName("나눔고딕");
       headerFont.setFontHeight((short)200);
       headerFont.setColor(IndexedColors.BLACK.getIndex());
       headerFont.setBold(true);
       
       mergeRowStyle2.setAlignment(HorizontalAlignment.CENTER);
       mergeRowStyle2.setVerticalAlignment(VerticalAlignment.TOP);
       mergeRowStyle2.setBorderTop(BorderStyle.THIN);
       mergeRowStyle2.setBorderLeft(BorderStyle.DOTTED);
       mergeRowStyle2.setBorderBottom(BorderStyle.SLANTED_DASH_DOT);
       mergeRowStyle2.setBorderRight(BorderStyle.HAIR);
       mergeRowStyle2.setFillForegroundColor(new XSSFColor(new byte[] {(byte) 192,(byte) 192,(byte) 192}));
       mergeRowStyle2.setFillPattern(FillPatternType.BRICKS);
       mergeRowStyle2.setFont(headerFont);
       
       CellStyle mergeRowStyle3 = workbook.createCellStyle();
       mergeRowStyle3.setAlignment(HorizontalAlignment.CENTER);
       mergeRowStyle3.setVerticalAlignment(VerticalAlignment.CENTER);
               
       CellStyle headerStyle = workbook.createCellStyle();
       headerStyle.setFont(headerFont);
       
       Row titleRow = sheet.createRow(1);
       Cell titleCell = titleRow.createCell(1);
       titleCell.setCellValue("SpaceUs 호스트 정산내역");
       titleCell.setCellStyle(mergeRowStyle1); 
       
       // 헤더 행 생
       Row headerRow = sheet.createRow(4);
       // 해당 행의 첫번째 열 셀 생성
       Cell headerCell = headerRow.createCell(1);
       headerCell.setCellValue("번호");
       headerCell.setCellStyle(mergeRowStyle1);
       // 해당 행의 두번째 열 셀 생성
       headerCell = headerRow.createCell(2);
       headerCell.setCellValue("정산날짜");
       headerCell.setCellStyle(mergeRowStyle1);
       // 해당 행의 세번째 열 셀 생성
       headerCell = headerRow.createCell(3);
       headerCell.setCellValue("총 이용시간");
       headerCell.setCellStyle(mergeRowStyle1);
       // 해당 행의 네번째 열 셀 생성
       headerCell = headerRow.createCell(4);
       headerCell.setCellValue("일매출");
       headerCell.setCellStyle(mergeRowStyle1);
       
       // 정산내역 내용 행 및 셀 생성
       Row bodyRow = null;
       Cell bodyCell = null;
       
       for(int i=5; i<list.size()+5; i++) {
           DailySale ds = list.get(i-5);
           
           // 행 생성
           bodyRow = sheet.createRow(i);
           // 데이터 번호 표시
           bodyCell = bodyRow.createCell(1);
           bodyCell.setCellValue(i-4);
           bodyCell.setCellStyle(mergeRowStyle3); 
           // 정산날짜 
           bodyCell = bodyRow.createCell(2);
           bodyCell.setCellValue(ds.getDate());
           bodyCell.setCellStyle(mergeRowStyle2); 
           // 일일 총 이용시간
           bodyCell = bodyRow.createCell(3);
           bodyCell.setCellValue(ds.getTotalHour());
           bodyCell.setCellStyle(mergeRowStyle3); 
           
           // 일매출 표시
           bodyCell = bodyRow.createCell(4);
           bodyCell.setCellValue(ds.getRevenue());
           bodyCell.setCellStyle(mergeRowStyle2); 
       }
       
       return workbook;
   }
   
   /**
    * 생성한 엑셀 워크북을 컨트롤레에서 받게해줄 메소드
    * @param list
    * @return
    */
   public SXSSFWorkbook excelFileDownloadProcess(List<DailySale> list) {
       return this.makeSimpleExcelWorkbook(list);
   }
	
	//리뷰 목록
	@RequestMapping("/reviewList.do")
	public String reviewList(Principal principal,
							 Model model, HttpServletRequest request,
							 @RequestParam(defaultValue = "1", value = "cPage") int cPage) {
		final int limit = 10; 
		int offset = (cPage - 1) * limit;
		Space space = spaceService.selectOneSpaceNo(principal.getName());
		String spaceNo = space.getSpaceNo();
		List<Review> review = spaceService.selectListReview(spaceNo, limit, offset);
		int totalContents = spaceService.selectHostReviewTotalContents(spaceNo); 
		String url = request.getRequestURI() + "?";
		String pageBar = Utils.getPageBarHtml(cPage, limit, totalContents, url);
		
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("review", review);
		model.addAttribute("spaceNo", spaceNo);
		
		return "host/hostReviewList";
	}
	
	//리뷰 조회(페이징 처리 안함)
	@GetMapping("/selectReviewComment.do")
	public ModelAndView selectReviewComment(ModelAndView mav,
			@RequestParam("spaceNo") String spaceNo,
			@RequestParam(defaultValue = "1", value = "cPage") int cPage) {
		
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
	
}
