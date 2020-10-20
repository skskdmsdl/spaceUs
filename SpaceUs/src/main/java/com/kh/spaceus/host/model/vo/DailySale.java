package com.kh.spaceus.host.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DailySale implements Serializable{
	String saleNo;
	String date;
	int totalHour;
	long revenue;
	
}
