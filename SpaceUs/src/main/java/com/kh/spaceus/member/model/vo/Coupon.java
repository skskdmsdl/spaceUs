package com.kh.spaceus.member.model.vo;

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
public class Coupon implements Serializable{
	
	private String no;
	private String type;
	private String email;
	private float discount;
	private Date issuedDate;
	private Date deadLine;
	private int status;
}
