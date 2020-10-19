package com.kh.spaceus.community.group.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spaceus.community.group.model.dao.GroupDAO;
import com.kh.spaceus.community.group.model.vo.Board;
import com.kh.spaceus.community.group.model.vo.CmtReport;
import com.kh.spaceus.community.group.model.vo.GBComment;
import com.kh.spaceus.community.group.model.vo.Report;
import com.kh.spaceus.community.group.model.vo.GroupBoard;

@Service
public class GroupServiceImpl implements GroupService {
	
	@Autowired
	private GroupDAO groupDAO;

	@Override
	public List<Board> selectListBoard() {
		return groupDAO.selectListBoard();
	}

	@Override
	public List<GroupBoard> selectListGroupBoard(int limit, int offset) {
		return groupDAO.selectListGroupBoard(limit,offset);
	}

	@Override
	public List<GroupBoard> selectSortedListGroupBoard(Map<String, String> listMap, int limit, int offset) {
		return groupDAO.selectSortedListGroupBoard(listMap,limit,offset);
	}

	@Override
	public int selectSortedListCnt(Map<String, String> listMap) {
		return groupDAO.selectSortedListCnt(listMap);
	}

	@Override
	public int selectTotalCnt() {
		return groupDAO.selectTotalCnt();
	}

	@Override
	public List<GroupBoard> selectDetailBoard(String groupBoardNo) {
		return groupDAO.selectDetailBoard(groupBoardNo);
	}

	@Override
	public int insertBoard(GroupBoard gb) {
		return groupDAO.insertBoard(gb);
	}

	@Override
	public int updateBoard(GroupBoard gb) {
		return groupDAO.updateBoard(gb);
	}

	@Override
	public int deleteBoard(String groupBoardNo) {
		return groupDAO.deleteBoard(groupBoardNo);
	}

	@Override
	public int increaseBoardReadCnt(String groupBoardNo) {
		return groupDAO.increaseBoardReadCnt(groupBoardNo);
	}

	@Override
	public List<Report> selectOne(Map<Object, Object> map) {
		return groupDAO.selectOne(map);
	}

	@Override
	public int insertReport(Report report) {
		return groupDAO.insertReport(report);
	}

	@Override
	public int updateCnt(Map<Object, Object> map) {
		return groupDAO.updateCnt(map);
	}

	@Override
	public List<Board> selectBoardOne(String groupBoardNo) {
		return groupDAO.selectBaordOne(groupBoardNo);
	}

	@Override
	public List<GBComment> selectAllComment(String groupBoardNo) {
		return groupDAO.selectAllComment(groupBoardNo);
	}

	@Override
	public int insertComment(GBComment param1) {
		return groupDAO.insertComment(param1);
	}

	@Override
	public int updateComment(GBComment param1) {
		return groupDAO.updateComment(param1);
	}

	@Override
	public int deleteComment(GBComment param1) {
		return groupDAO.deleteComment(param1);
	}

	@Override
	public int selectCommentCnt(String groupBoardNo) {
		return groupDAO.selectCommentCnt(groupBoardNo);
	}

	@Override
	public int alertComment(Map<String, String> map) {
		return groupDAO.alertComment(map);
	}

	@Override
	public List<CmtReport> selectReport() {
		return groupDAO.selectReport();
	}

	@Override
	public int updateReportCnt(String groupBoardCommentNo) {
		return groupDAO.updateReportCnt(groupBoardCommentNo);
	}

	
	
	
	

}
