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
public class Unselectable implements Serializable {
	private Date day;
	private int startHour;
	private int endHour;
}
