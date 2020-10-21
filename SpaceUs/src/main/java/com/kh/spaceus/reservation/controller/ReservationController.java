package com.kh.spaceus.reservation.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spaceus.member.model.service.MemberService;
import com.kh.spaceus.member.model.vo.Member;
import com.kh.spaceus.reservation.model.service.ReservationService;
import com.kh.spaceus.reservation.model.vo.Reservation;
import com.kh.spaceus.reservation.model.vo.Unselectable;
import com.kh.spaceus.space.model.service.SpaceService;
import com.kh.spaceus.space.model.vo.Space;
import com.kh.spaceus.reservation.model.vo.ReservationAvail;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired 
	private ReservationService reservationService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SpaceService spaceService;
	 
	@RequestMapping(value="/insertReservation.do")
	public String insertReservation(
									Model model,
									Reservation reservation, 
									@RequestParam("couponNo") String couponNo,
									Principal principal,
									RedirectAttributes redirectAttr) {
		
		boolean flag = true;
		String msg = "";
		
		//예약된 날짜와 시간
		List<Unselectable> unselectableList = reservationService.unselectableList(reservation.getSpaceNo());
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		for(int i=0; i<unselectableList.size(); i++) {
			boolean dateCheck = false;
			boolean startCheck = false;
			boolean endCheck = false;
			
			String undate = dateFormat.format(unselectableList.get(i).getDay());
			String revdate = dateFormat.format(reservation.getDay());
			
			if(revdate.equals(undate)) {
				dateCheck = true;
			}
			System.out.println("dateCheck : "+dateCheck);
			if(unselectableList.get(i).getStartHour() <= reservation.getStartHour() 
					&& reservation.getStartHour() <= unselectableList.get(i).getEndHour()) {
				startCheck = true;
			}
			System.out.println("startCheck : "+startCheck);
			
			if(unselectableList.get(i).getStartHour() <= (reservation.getEndHour() -1)
					&& (reservation.getEndHour() -1) <= unselectableList.get(i).getEndHour()) {
				endCheck = true;
			}
			System.out.println("endCheck : "+endCheck);
			
			if(dateCheck && (startCheck || endCheck)) {
				flag = false;
				msg = "먼저 예약된 시간이 포함되어 있어 예약이 실패했습니다. 다시 시도해주세요.";
				break;
			}
			
		}//for-end
		
		if(flag) {	
			int result = reservationService.insertReservation(reservation);
			
			Space space = spaceService.selectOneSpace(reservation.getSpaceNo());
			Member member = memberService.selectOneMember(principal.getName());;
			
			model.addAttribute("revNo",reservation.getRevNo());
			model.addAttribute("space",space);
			model.addAttribute("member",member);
			model.addAttribute("couponNo",couponNo);
			
			return "space/payment";
		}
		else {
			redirectAttr.addFlashAttribute("msg", msg);
			return "redirect:/member/usageHistory.do";
		}

	}
	
	@RequestMapping(value="/payment.do")
	public String payment(Reservation reservation, 
						  @RequestParam("couponNo") String couponNo,
						  @RequestParam("flag") String flag) {
		
		String revNo = reservation.getSpaceNo() + reservation.getMemberEmail();
		int result;
		
		if("true".equals(flag)) {	
			result = reservationService.updateRevNo(revNo, reservation.getRevNo());
			int delCoupon = memberService.deleteCoupon(couponNo);
		}
		else {			
			result = reservationService.deleteReservation(revNo);
		}
		return "redirect:/member/usageHistory.do";

	}
	
	@RequestMapping(value="/cancelReservation.do")
	public String cancleReservation(@RequestParam("revNo") String revNo) {
		
		int result = reservationService.cancleReservation(revNo);
		
		return "redirect:/member/usageHistory.do";
	}
	
}

