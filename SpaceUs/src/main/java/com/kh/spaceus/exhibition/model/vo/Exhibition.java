package com.kh.spaceus.exhibition.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Exhibition implements Serializable{
	
	private String exNo;
	private String exTitle; //not null
	private String exSubtitle;
	private String tagNo; //not null
	private String tagName; //not null
	private String imageUrl;
	private String renamedFileName;
	
}
