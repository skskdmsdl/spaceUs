package com.kh.spaceus.member.model.service;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spaceus.member.model.dao.MemberDAO;
import com.kh.spaceus.member.model.vo.Coupon;
import com.kh.spaceus.member.model.vo.Member;
import com.kh.spaceus.space.model.vo.Wish;

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

	@Override
	public Member selectOnePhone(String phone) {
		return memberDAO.selectOnePhone(phone);
	}

	@Override
	public int updatePassword(Map<String, Object> param) {
		return memberDAO.updatePassword(param);
	}

	@Override
	public int updateStamp(String email) {
		return memberDAO.updateStamp(email);
	}

	@Override
	public int updateMember(Member member) {
		return memberDAO.updateMember(member);
	}

	@Override
	public List<Member> selectBtdList(String format) {
		return memberDAO.selectBtdList(format);
	}

	@Override
	public int deleteAttendance() {
		return memberDAO.deleteAttendance();
	}

	@Override
	public int deleteMember(String memberEmail) {
		return memberDAO.deleteMember(memberEmail);
	}

	@Override
	public int updatePwd(Member member) {
		return memberDAO.updatePwd(member);
	}

	@Override
	public int insertBtdCoupon(String memberEmail) {
		return memberDAO.insertBtdCoupon(memberEmail);
	}

	@Override
	public int deleteToday() {
		return memberDAO.deleteToday();
	}

	@Override
	public int insertAttend2Coupon() {
		return memberDAO.insertAttend2Coupon();
	}

	@Override
	public int insertAttend3Coupon() {
		return memberDAO.insertAttend3Coupon();
	}

	@Override
	public int insertBtdCoupon() {
		return memberDAO.insertBtdCoupon();
	}

	@Override
	public int deleteCoupon() {
		return memberDAO.deleteCoupon();
	}

	@Override
	public int deleteCoupon(String couponNo) {
		return memberDAO.deleteCoupon(couponNo);
	}
	
	@Override
	public List<Coupon> selectCouponList(String email) {
		return memberDAO.selectCouponList(email);
	}

	@Override
	public List<Wish> selectWishList(String email) {
		return memberDAO.selectWishList(email);
	}

	@Override
	public int selectWishTotal(String email) {
		return memberDAO.selectWishTotal(email);
	}

	@Override
	public int updateUser(String memberEmail) {
		return memberDAO.updatePwd(memberEmail);
	}

}
