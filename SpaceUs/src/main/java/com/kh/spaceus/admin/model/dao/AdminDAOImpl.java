package com.kh.spaceus.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spaceus.admin.model.vo.ManageMember;
import com.kh.spaceus.member.model.vo.Member;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<ManageMember> selectList() {
		return session.selectList("admin.selectList");
	}

	@Override
	public List<ManageMember> findUserIdList(String searchKeyword) {
		return session.selectList("admin.findUserIdList", searchKeyword);
	}

	@Override
	public List<ManageMember> findUserNameList(String searchKeyword) {
		return session.selectList("admin.findUserNameList", searchKeyword);
	}

	@Override
	public List<ManageMember> findUserRoleList(String searchKeyword) {
		return session.selectList("admin.findUserRoleList", searchKeyword);
	}
	
	
	
}
