package com.kh.security.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spaceus.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class SecurityDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member loadUserByUsername(String username) {
		return sqlSession.selectOne("security.loadUserByUsername", username);
	} 

}
