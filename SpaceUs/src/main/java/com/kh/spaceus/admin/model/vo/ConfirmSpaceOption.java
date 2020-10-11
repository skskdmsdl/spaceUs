package com.kh.spaceus.admin.model.vo;

import java.io.Serializable;

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
public class ConfirmSpaceOption implements Serializable{
	
	private String optionNo;
	private String spaceNo;
	private String optionName;
}
