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
	private String memberEmail;
	private String spaceNo;
	private Date revDate;
	private Date dDay;
	private int startHour;
	private int endHour;
	private int totalPrice;
	private int revCancle;
	private int revComplete;
}
