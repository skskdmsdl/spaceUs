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
public class Attachment implements Serializable{

	private String fileNo;
	private String spaceNo;
	private String oname;
	private String rname;
	private Date uploadDate;
	private boolean status;
}

