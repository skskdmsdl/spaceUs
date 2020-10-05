package com.kh.spaceus.common;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Utils {

	public static String getRenamedFileName(String oname) {
		
		int beginIndex = oname.lastIndexOf(".");
		String ext = oname.substring(beginIndex);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS_");
		int rndNum = (int)(Math.random() * 1000);
		String rname = sdf.format(new Date()) + rndNum + ext; 
		log.debug("rname = {}", rname);
		
		return rname;
	}

	public static String getPageBarHtml(int cPage, int numPerPage, int totalContents, String url) {
		String pageBar = "";
		int pageBarSize = 5; //페이지바에 표시될 페이지 번호 수
		//(공식2)
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		//(공식3) pageStaty 시작페이지 번호 구하기
		//1 2 3 4 5 => pageStart = 1
		//6 7 8 9 10 => pageStart = 6
		//11 12 13 14 15 => pageStart = 11
		//......
		int pageStart = ((cPage-1)/pageBarSize) * pageBarSize + 1 ;//cPage,pageBarSize
		int pageEnd = pageStart + pageBarSize - 1;
		
		//증감변수
		int pageNo = pageStart;
		
		//[이전]영역
		if(pageNo == 1) {
			//이전영역 없을 때
		}
		else {
			pageBar += "<a class=\"page-link\" href='"+url+"cPage="+(pageNo-1)+"'>[Previous]</a>"; //6페이지면 5페이지로 가게 //11페이지면 10페이지로 가게
		}
		//페이지번호 영역
		while(pageNo <= pageEnd && pageNo <= totalPage ) {
			//현재페이지인 경우
			if(pageNo == cPage) {
				pageBar += "<span class='cPage align-self-center'>"+pageNo+"</span>";
			}else {
				pageBar += "<a class='page-link' href='"+url+"cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		//[다음]영역
		if(pageNo > totalPage) {
			
		}
		else {
			//totalpAGE보다 큰경우
			pageBar += "<a class='page-link' href='"+url+"cPage="+pageNo+"'>[Next]</a>";
		}
		
//		System.out.println(pageBar);
		return pageBar;
	}
}