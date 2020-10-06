package com.kh.spaceus.community.group.model.vo;

import java.io.Serializable;
import java.sql.Date;

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
public class GroupBoard implements Serializable {

	private String groupBoardNo;
	private String boardNo;
	private String memberEmail;
	private int viewCnt;
	private String groupBoardTitle;
	private String groupBoardContent;
	private int reportCnt;
	private Date groupBoardDate;
	private String nickname;
	private String commentCnt;
}
