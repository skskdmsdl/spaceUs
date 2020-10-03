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
public class ReviewAttachment implements Serializable{

	private String imgNo;
	private String reviewNo;
	private String oName;
	private String rName;
	private Date uploadDate;
	private int status;
}

