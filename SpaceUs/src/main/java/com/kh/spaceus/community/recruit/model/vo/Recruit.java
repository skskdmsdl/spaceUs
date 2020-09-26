package com.kh.spaceus.community.recruit.model.vo;

import java.io.Serializable;
import java.util.Date;

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
public class Recruit implements Serializable{

	private String no;
	private String email;
	private String nickName;
	private String title;
	private String content;
	private String header;
	private int viewCnt;
	private int reportCnt;
	private Date enrollDate;
}

