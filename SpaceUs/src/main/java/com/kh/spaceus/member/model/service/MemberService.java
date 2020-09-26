package com.kh.spaceus.member.model.service;

import java.util.Map;

import com.kh.spaceus.member.model.vo.Member;

public interface MemberService {

	Member selectOneMember(String memberEmail);

	Member selectOneNickName(String nickName);

	int insertMember(Member member);

	Member selectOnePhone(String phone);

	int updatePassword(Map<String, Object> param);

}
