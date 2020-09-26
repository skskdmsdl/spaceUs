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
	private String exTitle;
	private String exSubtitle;
	private String tag;
	private String image;
}
