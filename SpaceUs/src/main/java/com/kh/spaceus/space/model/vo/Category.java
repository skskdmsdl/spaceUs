package com.kh.spaceus.space.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Category implements Serializable{
	
	private String spaceNo;
	private String categoryNo;
	private String categoryName;
}
