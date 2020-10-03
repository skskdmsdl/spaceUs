package com.kh.security.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.kh.security.model.dao.SecurityDAO;
import com.kh.spaceus.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SecurityService implements UserDetailsService{

	@Autowired
	private SecurityDAO securityDAO;
	
	@Override
	public UserDetails loadUserByUsername(String username)
									throws UsernameNotFoundException {
		
		Member member = securityDAO.loadUserByUsername(username);
		log.info("memberrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr = {}", member);
		
		
		if(member == null)
			throw new UsernameNotFoundException(username);
		
		return member;
	}

}
