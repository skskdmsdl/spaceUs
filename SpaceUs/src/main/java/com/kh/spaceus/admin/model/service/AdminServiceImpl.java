package com.kh.spaceus.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spaceus.admin.model.dao.AdminDAO;
import com.kh.spaceus.admin.model.vo.ManageMember;
import com.kh.spaceus.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public List<ManageMember> selectList() {
		return adminDAO.selectList();
	}

	@Override
	public List<ManageMember> findUserIdList(String searchKeyword) {
		return adminDAO.findUserIdList(searchKeyword);
	}

	@Override
	public List<ManageMember> findUserNameList(String searchKeyword) {
		return adminDAO.findUserNameList(searchKeyword);
	}

	@Override
	public List<ManageMember> findUserRoleList(String searchKeyword) {
		return adminDAO.findUserRoleList(searchKeyword);
	}
	
	
}
