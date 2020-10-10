package com.kh.spaceus.admin.model.dao;

import java.util.List;

import com.kh.spaceus.admin.model.vo.ManageBlackList;
import com.kh.spaceus.admin.model.vo.ManageMember;
import com.kh.spaceus.community.group.model.vo.GroupBoard;
import com.kh.spaceus.community.group.model.vo.Report;
import com.kh.spaceus.member.model.vo.Member;

public interface AdminDAO {

	List<ManageMember> selectList();

	List<ManageMember> findUserIdList(String searchKeyword);

	List<ManageMember> findUserNameList(String searchKeyword);

	List<ManageMember> findUserRoleList(String searchKeyword);

	List<ManageBlackList> selectGroupList();

	List<ManageBlackList> selectRecruitList();

	List<Report> selectReasonList(String reportBoardNo);

	List<GroupBoard> selectGBList();
	
}
