package com.kh.spaceus.space.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Space implements Serializable{

	private String spaceNo;
	private String categoryNo;
	private String memberEmail;
	private int businessNo;
	private String spaceName;
	private String address;
	private String spacePhone;
	private int hourlyPrice;
	private float starAvg;
	private String enrollDate;
	private String modificationDate;
	private int views;
	private int likeCnt;
	private String status;
	private int account;
	private String content;
	private String bank;
	
	private List<Attachment> attachList;
}
