package com.kh.spaceus.space.model.vo;

import java.io.Serializable;
import java.sql.Date;

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
	private int businessLicense;
	private String spaceName;
	private String address;
	private String spacePhone;
	private int hourlyPrice;
	private int starAvg;
	private Date registrationDate;
	private Date modificationDate;
	private int views;
	private int likeCnt;
	private String status;
}
