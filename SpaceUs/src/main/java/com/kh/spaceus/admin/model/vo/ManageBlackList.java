package com.kh.spaceus.admin.model.vo;

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
public class ManageBlackList implements Serializable {
	
	private String reportBoardNo;
	private String groupBoardTitle;
	private String memberEmail;
	private String title;
	private Date blackListDate;
	
}
