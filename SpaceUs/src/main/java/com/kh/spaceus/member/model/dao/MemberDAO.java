package com.kh.spaceus.member.model.dao;

import java.util.Map;

import com.kh.spaceus.member.model.vo.Member;

public interface MemberDAO {

	Member selectOneMember(String memberEmail);

	Member selectOneNickName(String nickName);

	int insertMember(Member member);

	Member selectOnePhone(String phone);

	int updatePassword(Map<String, Object> param);

}
