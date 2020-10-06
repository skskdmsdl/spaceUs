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
	
	
}