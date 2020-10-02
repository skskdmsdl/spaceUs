package com.kh.spaceus.space.model.vo;

import java.io.Serializable;
import java.util.Date;
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
public class Star implements Serializable{

	private int star1;
	private int star2;
	private int star3;
	private int star4;
	private int star5;
	private int sumStar;
	
}

