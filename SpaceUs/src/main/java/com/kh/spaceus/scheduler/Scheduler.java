package com.kh.spaceus.scheduler;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled; 
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Component;

import com.kh.spaceus.host.model.service.HostService;
import com.kh.spaceus.member.model.service.MemberService;
import com.kh.spaceus.member.model.vo.Member;
import com.kh.spaceus.reservation.model.vo.Reservation;
import com.kh.spaceus.space.model.service.SpaceService;
import com.kh.spaceus.space.model.vo.Space;

import lombok.NonNull;
import lombok.extern.slf4j.Slf4j; 

@Controller
@Slf4j 
public class Scheduler { 
	
	@Autowired 
	private MemberService memberService;
	
	@Autowired
	private SpaceService spaceService;
	
	@Autowired
	private HostService hostService;
	
	/** 
	 * cron표현식 초 분 시 일 월 요일 년(생략가능)
	 */
	 @Scheduled(cron = "0 0 0 1 * *")
	public void monthlyScheduler(){ 
		System.out.println("출석 쿠폰 발급"); 
		int result1 = memberService.insertAttend2Coupon();
		int result2 = memberService.insertAttend3Coupon();
		
		System.out.println("출석데이터 삭제"); 
		int result3 = memberService.deleteAttendance();
	}

	@Scheduled(cron ="0 0 0 * * *") 
	public void dailyScheduler(){ 
		System.out.println("생일 쿠폰 발급 "); 
		//기념일 쿠폰 발급
		int result1 = memberService.insertBtdCoupon();
		
		System.out.println("당일 출첵 여부 초기화 "); 
		int result2 = memberService.deleteToday();
		
		System.out.println("사용기간 만료 쿠폰 삭제 "); 
		int result3 = memberService.deleteCoupon();
		
		System.out.println("정산내역 db 저장"); 
		List<String> list = hostService.selectReservationSpaceNo();
		System.out.println(list);
		for(String str : list) {
			System.out.println(str);
			 int result4 = hostService.insertSettlement(str); 
		}
	} 
}

