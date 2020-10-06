package com.kh.spaceus.community.group.model.vo;

import org.springframework.web.bind.annotation.SessionAttributes;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@SessionAttributes
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CmtReport {

	private String memberEmail;
	private String boardCommentNo;
}
