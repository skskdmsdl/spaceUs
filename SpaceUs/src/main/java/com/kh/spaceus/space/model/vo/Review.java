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
public class Review implements Serializable{

	private String reviewNo;
	private String spaceNo;
	private String revNo;
	private String nickName;
	private String reviewComment;
	private String starRating;
	private String content;
	private Date enrollDate;
	private String image;
	private List<ReviewAttachment> reviewAtt;
}

