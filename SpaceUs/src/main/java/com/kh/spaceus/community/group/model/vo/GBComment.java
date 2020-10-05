package com.kh.spaceus.community.group.model.vo;

import java.io.Serializable;
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
public class GBComment implements Serializable {

	private String groupBoardCommentNo; //댓글번호
	private String writer; //글쓴이
	private String groupBoardRef; //게시물 번호
	private int secret; //비밀글 여부
	private String groupBoardCommentRef; //대댓글인 경우 , 참조중인 댓글 번호 | 댓글인 경우, null 
	private String groupBoardContent; //댓글내용
	private String groupBoardCommentLevel; //댓글(1), 대댓글(2) 여부판단
	private Date groupBoardDate; 
	private String reportCnt;
	private String nickname;
	
}
