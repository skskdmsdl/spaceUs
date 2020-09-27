package com.kh.spaceus.reservation.model.vo;

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
public class ReservationAvail implements Serializable {
	private String day;
	private String spaceNo;
	private int startHour;
	private int endHour;
}
