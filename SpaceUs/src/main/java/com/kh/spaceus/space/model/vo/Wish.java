package com.kh.spaceus.space.model.vo;

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
public class Wish implements Serializable{
	String spaceNo;
	String email;
	String spaceName;
	String content;
	float starAvg;
	int likeCnt;
	String address;
	int hourlyPrice;
	String image;
	int reviewCnt;
	Date date;
}
