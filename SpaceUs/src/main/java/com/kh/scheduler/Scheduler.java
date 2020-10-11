package com.kh.scheduler;

import org.springframework.scheduling.annotation.Scheduled; 
import org.springframework.stereotype.Component; 

@Component public class Scheduler { 
	/** 
	 * cron표현식 초 분 시 일 월 요일 년(생략가능)
	 */
	@Scheduled(cron = "0 0 0 1 * *") 
	public void deleteAttendance(){ 
		System.out.println("출석데이터 삭제"); 
		System.out.println("출석 쿠폰 발급"); 
		
		
	}

	@Scheduled(cron = "0 0 0 * * *") 
	public void coupon(){ 
		System.out.println("기념일 쿠폰 발급 "); 
		System.out.println("당일 출첵 여부 초기화 "); 
		
		
	} 
}

