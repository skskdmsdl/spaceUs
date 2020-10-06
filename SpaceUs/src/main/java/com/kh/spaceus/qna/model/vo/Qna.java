package com.kh.spaceus.qna.model.vo;

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
public class Qna implements Serializable {
	private String qnaNo;
	private String spaceNo;
	private String email;
	private String name;
	private String content;
	private String answer;
	private Date date;
	private boolean status;
	
}
