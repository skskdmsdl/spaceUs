package com.kh.spaceus.member.model.dao;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import com.kh.spaceus.member.model.vo.Member;

public interface MemberDAO {

	Member selectOneMember(String memberEmail);

	Member selectOneNickName(String nickName);

	int insertMember(Member member);

	Member selectOnePhone(String phone);

	int updatePassword(Map<String, Object> param);

	int updateStamp(String email);

	int updateMember(Member member);

	List<Member> selectBtdList(String format);

}
