package com.kh.spaceus.space.model.vo;

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
public class SpaceList {
	
	private String spaceNo;
	private String spaceName;
	private String address;
	private int hourlyPrice;
	private int views;
	private int likeCnt;
	private float starAvg;
	private int reviewCnt;
	private String renamedFilename;
}
