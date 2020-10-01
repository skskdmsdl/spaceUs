package com.kh.spaceus.reservation.model.vo;

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
public class Reservation implements Serializable {
	private String revNo;
	private String email;
	private String spaceNo;
	private Date rev_date;
	private Date day;
	private int start;
	private int end;
	private int price;
	private int cancle;
	private int complete;
}
