package com.kh.spaceus.community.group.model.vo;

import java.io.Serializable;

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
public class Board implements Serializable {
	
	private String boardNo;
	private String boardRef;
	private String boardName;
	private int boardLevel;
}
