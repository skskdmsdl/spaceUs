package com.kh.spaceus.member.model.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import com.kh.spaceus.member.model.vo.Member;

public interface MemberService {

	Member selectOneMember(String memberEmail);

	Member selectOneNickName(String nickName);

	int insertMember(Member member);

	Member selectOnePhone(String phone);

	int updatePassword(Map<String, Object> param);

	int updateStamp(String email);

	int updateMember(Member member);

	List<Member> selectBtdList(String format);

	int deleteAttendance();

	int deleteMember(String memberEmail);

	int updatePwd(Member member);

	int insertBtdCoupon(String memberEmail);

	int deleteToday();

	int insertAttend2Coupon();

	int insertAttend3Coupon();

	int insertBtdCoupon();

	int deleteCoupon();

}
