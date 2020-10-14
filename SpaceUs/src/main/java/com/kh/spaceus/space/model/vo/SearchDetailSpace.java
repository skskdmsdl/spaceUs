package com.kh.spaceus.space.model.vo;

import java.sql.Date;

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
public class SearchDetailSpace {

	private String category;
	private String location;
	private String date;
	private String optionArr;
}
