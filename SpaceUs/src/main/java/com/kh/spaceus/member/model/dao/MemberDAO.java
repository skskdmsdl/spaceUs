package com.kh.spaceus.member.model.dao;

import com.kh.spaceus.member.model.vo.Member;

public interface MemberDAO {

	Member selectOneMember(String memberEmail);

	Member selectOneNickName(String nickName);

	int insertMember(Member member);

}
