package com.kh.spaceus.admin.model.vo;

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
public class ConfirmSpace {

	private String spaceNo;
	private long businessLicense;
	private String address;
	private String spacePhone;
	private String memberEmail;
	private String spaceName;
	private String status;
	private String content;
	private String hourlyPrice;
	private Date registrationDate;

}
