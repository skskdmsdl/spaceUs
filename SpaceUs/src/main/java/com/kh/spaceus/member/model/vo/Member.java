package com.kh.spaceus.member.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
 @Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class Member implements Serializable{
	
	private String memberEmail;
	private String password;
	private String nickName;
	private String memberPhone;
	private Date birtDay; 
	private Date memberRegDate; //가입일
	private int attendanceCnt; //출석횟수
	//private List<SimpleGrantedAuthority> authorities; //권한 ('U', 'H', 'A')
	
}
