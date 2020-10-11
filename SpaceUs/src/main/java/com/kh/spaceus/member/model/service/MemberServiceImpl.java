package com.kh.spaceus.member.model.service;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

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


}
