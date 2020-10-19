package com.kh.spaceus.member.model.dao;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spaceus.member.model.vo.Coupon;
import com.kh.spaceus.member.model.vo.Member;
import com.kh.spaceus.space.model.vo.Wish;

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

	@Override
	public List<Member> selectBtdList(String format) {
		return sqlSession.selectList("member.selectBtdList", format);
	}

	@Override
	public int deleteAttendance() {
		return sqlSession.update("member.deleteAttendance");
	}

	@Override
	public int deleteMember(String memberEmail) {
		return sqlSession.delete("member.deleteMember", memberEmail);
	}

	@Override
	public int updatePwd(Member member) {
		return sqlSession.update("member.updatePwd", member);
	}

	@Override
	public int insertBtdCoupon(String memberEmail) {
		return sqlSession.insert("member.insertBtdCoupon", memberEmail);
	}

	@Override
	public int deleteToday() {
		return sqlSession.update("member.deleteToday");
	}

	@Override
	public int insertAttend2Coupon() {
		return sqlSession.insert("member.insertAttend2Coupon");
	}

	@Override
	public int insertAttend3Coupon() {
		return sqlSession.insert("member.insertAttend3Coupon");
	}

	@Override
	public int insertBtdCoupon() {
		return sqlSession.insert("member.insertBtdCoupon");
	}

	@Override
	public int deleteCoupon() {
		return sqlSession.delete("member.deleteCoupon");
	}

	@Override
	public int deleteCoupon(String couponNo) {
		return sqlSession.delete("member.deleteCouponNo",couponNo);
	}
	
	@Override
	public List<Coupon> selectCouponList(String email) {
		return sqlSession.selectList("member.selectCouponList", email);
	}

	@Override
	public List<Wish> selectWishList(String email) {
		return sqlSession.selectList("member.selectWishList", email);
	}

	@Override
	public int selectWishTotal(String email) {
		return sqlSession.selectOne("member.selectWishTotal", email);
	}
	
	@Override
	public int updatePwd(String memberEmail) {
		return sqlSession.update("member.updateUser",memberEmail);
	}

}
