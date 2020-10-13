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

public class Member implements Serializable, UserDetails{
	
	private String memberEmail;
	private String password;
	private String nickName;
	private String memberPhone;
	private String birthDay; 
	private Date memberRegDate; //가입일
	private int attendanceCnt; //출석횟수
	private int today; //오늘출석여부
	private List<SimpleGrantedAuthority> authorities; //권한 ('U', 'H', 'A')
	

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}
	@Override
	public String getUsername() {
		return memberEmail;
	}
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	public boolean isEnabled() {
		return true;
	}
}
