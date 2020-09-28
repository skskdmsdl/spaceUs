package com.kh.spaceus.host.controller;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.streaming.SXSSFCell;
import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spaceus.host.model.service.HostService;
import com.kh.spaceus.host.model.vo.Qna;
import com.kh.spaceus.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/host")
public class HostController {
	
	@Autowired
	private HostService hostService;
	
	
	//정산내역
	@RequestMapping("/settlementDetails.do")
	public String settlementDetails () {
		
		return "host/settlementDetails";
	}
	
	//공간정보
	@RequestMapping("/spaceInfo.do")
	public String ManageSpace() {
		
		return "host/spaceInfo";
	}
	
	//예약 현황 
	@RequestMapping("/hostReservation.do")
	public String ManageHostReservation() {
		
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
		
		mav.addObject("loginMember", principal);
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
}
