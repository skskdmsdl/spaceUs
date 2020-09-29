package com.kh.spaceus.community.recruit.model.vo;

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
public class ReportRecruit implements Serializable{
	
	private String memberEmail;
	private String boardNo;
	private String reportReason;
}
