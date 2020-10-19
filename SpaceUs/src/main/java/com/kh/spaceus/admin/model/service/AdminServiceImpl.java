package com.kh.spaceus.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spaceus.admin.model.dao.AdminDAO;
import com.kh.spaceus.admin.model.vo.ConfirmSpace;
import com.kh.spaceus.admin.model.vo.ConfirmSpaceOption;
import com.kh.spaceus.admin.model.vo.ConfirmSpaceTag;
import com.kh.spaceus.admin.model.vo.ManageBlackList;
import com.kh.spaceus.admin.model.vo.ManageMember;
import com.kh.spaceus.admin.model.vo.ManageRecruit;
import com.kh.spaceus.admin.model.vo.ManageSpace;
import com.kh.spaceus.community.group.model.vo.GroupBoard;
import com.kh.spaceus.community.group.model.vo.Report;
import com.kh.spaceus.space.model.vo.Category;
import com.kh.spaceus.space.model.vo.Space;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public List<ManageMember> selectList(int limit, int offset) {
		return adminDAO.selectList(limit,offset);
	}

	@Override
	public int selectTotalCnt() {
		return adminDAO.selectTotalCnt();
	}

	@Override
	public List<ManageMember> findUserIdList(int limit, int offset, String searchKeyword) {
		return adminDAO.findUserIdList(searchKeyword,limit,offset);
	}

	@Override
	public int selectUserIdCnt(String searchKeyword) {
		return adminDAO.selectUserIdCnt(searchKeyword);
	}

	@Override
	public int selectUserNameCnt(String searchKeyword) {
		return adminDAO.selectUserNameCnt(searchKeyword);
	}

	@Override
	public List<ManageMember> findUserNameList(int limit, int offset, String searchKeyword) {
		return adminDAO.findUserNameList(searchKeyword,limit,offset);
	}


	@Override
	public List<ManageMember> findUserRoleList(int limit, int offset, String searchKeyword) {
		return adminDAO.findUserRoleList(searchKeyword,limit,offset);
	}

	@Override
	public int selectUserRoleCnt(String searchKeyword) {
		return adminDAO.selectUserRoleCnt(searchKeyword);
	}

	@Override
	public List<ManageBlackList> selectGroupList() {
		return adminDAO.selectGroupList();
	}

	@Override
	public List<ManageBlackList> selectRecruitList() {
		return adminDAO.selectRecruitList();
	}

	@Override
	public List<Report> selectReasonList(String reportBoardNo) {
		return adminDAO.selectReasonList(reportBoardNo);
	}

	@Override
	public List<GroupBoard> selectGBList() {
		return adminDAO.selectGBList();
	}

	@Override
	public List<ManageRecruit> selectrList() {
		return adminDAO.selectrList();
	}

	@Override
	public List<ManageSpace> selectSpaceList() {
		return adminDAO.selectSpaceList();
	}

	@Override
	public List<Space> selectSpaceOneList(String spaceNo) {
		return adminDAO.selectSpaceOneList(spaceNo);
	}

	@Override
	public List<ConfirmSpace> selectSpaceOneImageList(String spaceNo) {
		return adminDAO.selectSpaceOneImageList(spaceNo);
	}

	@Override
	public List<Category> selectSpaceOneCategory(String spaceNo) {
		return adminDAO.selectSpaceOneCategory(spaceNo);
	}

	@Override
	public List<ConfirmSpaceTag> selectSpaceOneTagList(String spaceNo) {
		return adminDAO.selectSpaceOneTagList(spaceNo);
	}

	@Override
	public List<ConfirmSpaceOption> selectSpaceOptionList(String spaceNo) {
		return adminDAO.selectSpaceOptionList(spaceNo);
	}

	@Override
	public int updatdStatus(Space param1) {
		return adminDAO.updateStatus(param1);
	}

	@Override
	public int updateHost(Space param1) {
		return adminDAO.updateHost(param1);
	}
	
	
}
