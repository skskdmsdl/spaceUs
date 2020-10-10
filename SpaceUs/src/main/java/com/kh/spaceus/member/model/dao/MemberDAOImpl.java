package com.kh.spaceus.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spaceus.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member selectOneMember(String memberEmail) {
		return sqlSession.selectOne("member.selectOneMember", memberEmail);
	}

	@Override
	public Member selectOneNickName(String nickName) {
		return sqlSession.selectOne("member.selectOneNickName", nickName);
	}

	@Override
	public int insertMember(Member member) {
		return sqlSession.insert("member.insertMember", member);
	}

	@Override
	public Member selectOnePhone(String phone) {
		return sqlSession.selectOne("member.selectOnePhone", phone);
	}

	@Override
	public int updatePassword(Map<String, Object> param) {
		return sqlSession.update("member.updatePassword", param);
	}

	@Override
	public int updateStamp(String email) {
		return sqlSession.update("member.updateStamp", email);
	}

	@Override
	public int updateMember(Member member) {
		return sqlSession.update("member.updateMember", member);
	}
}
