package com.kh.spaceus.scheduler;

import java.text.SimpleDateFormat;
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

import com.kh.spaceus.member.model.service.MemberService;
import com.kh.spaceus.member.model.vo.Member;
import com.kh.spaceus.space.model.service.SpaceService;

import lombok.NonNull;
import lombok.extern.slf4j.Slf4j; 

@Slf4j 
@Component
public class Scheduler { 
	
	@Autowired 
	private MemberService memberService;
	
	@Autowired
	private SpaceService spaceService;
	
	/** 
	 * cron표현식 초 분 시 일 월 요일 년(생략가능)
	 */
	@Scheduled(cron = "0 0 0 1 * *") 
	@Transactional
	public void monthlyScheduler(){ 
		System.out.println("출석데이터 삭제"); 
		System.out.println("출석 쿠폰 발급"); 
		
		
	}

	@Scheduled(cron ="0 03 4 * * *") 
	@Transactional
	public void everyScheduler(){ 
		System.out.println("기념일 쿠폰 발급 "); 
		//기념일 쿠폰 발급
		Date today = new Date();
		SimpleDateFormat data = new SimpleDateFormat ("MM/dd");
		System.out.println(data.format(today)); 
		List<Member> btdList = memberService.selectBtdList(data.format(today));
		System.out.println(btdList);
		
		
		System.out.println("당일 출첵 여부 초기화 "); 
		
		
	} 
}

