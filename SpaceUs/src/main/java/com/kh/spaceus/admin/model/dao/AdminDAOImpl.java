package com.kh.spaceus.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<ManageMember> selectList(int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("admin.selectList",null,rowBounds);
	}
	

	@Override
	public int selectTotalCnt() {
		return session.selectOne("admin.selectTotalCnt");
	}

	@Override
	public List<ManageMember> findUserIdList(String searchKeyword, int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("admin.findUserIdList", searchKeyword,rowBounds);
	}
	
	@Override
	public int selectUserIdCnt(String searchKeyword) {
		return session.selectOne("admin.selectUserIdCnt");
	}


	@Override
	public List<ManageMember> findUserNameList(String searchKeyword, int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("admin.findUserNameList", searchKeyword,rowBounds);
	}


	@Override
	public int selectUserNameCnt(String searchKeyword) {
		return session.selectOne("admin.selectUserNameCnt");
	}

	
	@Override
	public List<ManageMember> findUserRoleList(String searchKeyword, int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("admin.findUserRoleList", searchKeyword, rowBounds);
	}


	@Override
	public int selectUserRoleCnt(String searchKeyword) {
		return session.selectOne("admin.selectUserRoleCnt", searchKeyword);
	}


	@Override
	public List<ManageBlackList> selectGroupList() {
		return session.selectList("admin.selectGroupList");
	}

	@Override
	public List<ManageBlackList> selectRecruitList() {
		return session.selectList("admin.selectRecruitList");
	}

	@Override
	public List<Report> selectReasonList(String reportBoardNo) {
		return session.selectList("admin.selectReasonList",reportBoardNo);
	}

	@Override
	public List<GroupBoard> selectGBList() {
		return session.selectList("admin.selectGBList");
	}

	@Override
	public List<ManageRecruit> selectrList() {
		return session.selectList("admin.selectrList");
	}

	@Override
	public List<ManageSpace> selectSpaceList() {
		return session.selectList("admin.selectSpceList");
	}

	@Override
	public List<Space> selectSpaceOneList(String spaceNo) {
		return session.selectList("admin.selectSpaceOneList", spaceNo);
	}

	@Override
	public List<ConfirmSpace> selectSpaceOneImageList(String spaceNo) {
		return session.selectList("admin.selectSpaceOneImageList", spaceNo);
	}

	@Override
	public List<Category> selectSpaceOneCategory(String spaceNo) {
		return session.selectList("admin.selectSpaceOneCategory", spaceNo);
	}

	@Override
	public List<ConfirmSpaceTag> selectSpaceOneTagList(String spaceNo) {
		return session.selectList("admin.selectSpaceOneTagList", spaceNo);
	}

	@Override
	public List<ConfirmSpaceOption> selectSpaceOptionList(String spaceNo) {
		return session.selectList("admin.selectSpaceOptionList", spaceNo);
	}

	@Override
	public int updateStatus(Space param1) {
		return session.update("admin.updateStatus", param1);
	}

	@Override
	public int updateHost(Space param1) {
		return session.update("admin.updateHost", param1);
	}
	
	
	
}
