package com.kh.spaceus.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spaceus.member.model.dao.MemberDAO;
import com.kh.spaceus.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public Member selectOneMember(String memberEmail) {
		return memberDAO.selectOneMember(memberEmail);
	}

	@Override
	public Member selectOneNickName(String nickName) {
		return memberDAO.selectOneNickName(nickName);
	}

	@Override
	public int insertMember(Member member) {
		return memberDAO.insertMember(member);
	}

}
