package com.kh.spaceus.admin.model.vo;

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
public class ManageMember implements Serializable{
	
	private String memberEmail;
	private String nickname;
	private String memberPhone;
	private Date memberRegDate;
	private String authority;
}
