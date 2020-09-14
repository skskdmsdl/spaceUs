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
}