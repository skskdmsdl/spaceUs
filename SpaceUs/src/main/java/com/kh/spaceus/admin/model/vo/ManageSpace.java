package com.kh.spaceus.admin.model.vo;

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
public class ManageSpace implements Serializable {
	
	private String spaceNo;
	private String renamedFilename;
	private String memberEmail;
	private String spaceName;
	private Date registrationDate;
}
