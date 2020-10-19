package com.kh.spaceus.community.group.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spaceus.community.group.model.vo.Board;
import com.kh.spaceus.community.group.model.vo.CmtReport;
import com.kh.spaceus.community.group.model.vo.GBComment;
import com.kh.spaceus.community.group.model.vo.Report;
import com.kh.spaceus.community.group.model.vo.GroupBoard;

public interface GroupService {

	List<Board> selectListBoard();

	List<GroupBoard> selectListGroupBoard(int limit, int offset);
	
	List<GroupBoard> selectSortedListGroupBoard(Map<String, String> listMap, int limit, int offset);
	
	int selectSortedListCnt(Map<String, String> listMap);

	int selectTotalCnt();

	List<GroupBoard> selectDetailBoard(String groupBoardNo);

	int insertBoard(GroupBoard gb);

	int updateBoard(GroupBoard gb);

	int deleteBoard(String groupBoardNo);

	int increaseBoardReadCnt(String groupBoardNo);

	List<Report> selectOne(Map<Object, Object> map);

	int insertReport(Report report);

	int updateCnt(Map<Object, Object> map);

	List<Board> selectBoardOne(String groupBoardNo);

	List<GBComment> selectAllComment(String groupBoardNo);

	int insertComment(GBComment param1);

	int updateComment(GBComment param1);

	int deleteComment(GBComment param1);

	int selectCommentCnt(String groupBoardNo);

	int alertComment(Map<String, String> map);

	List<CmtReport> selectReport();

	int updateReportCnt(String groupBoardCommentNo);

	

	

}
