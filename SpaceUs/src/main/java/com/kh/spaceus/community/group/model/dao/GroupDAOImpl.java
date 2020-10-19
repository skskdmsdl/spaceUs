package com.kh.spaceus.community.group.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spaceus.community.group.model.vo.Board;
import com.kh.spaceus.community.group.model.vo.CmtReport;
import com.kh.spaceus.community.group.model.vo.GBComment;
import com.kh.spaceus.community.group.model.vo.Report;
import com.kh.spaceus.community.group.model.vo.GroupBoard;

@Repository
public class GroupDAOImpl implements GroupDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Board> selectListBoard() {
		return session.selectList("board.selectListBoard");
	}

	@Override
	public List<GroupBoard> selectListGroupBoard(int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("board.selectListGroupBoard",null,rowBounds);
	}	
	

	@Override
	public List<GroupBoard> selectSortedListGroupBoard(Map<String, String> listMap, int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("board.selectSortedListGroupBoard", listMap, rowBounds);
	}

	@Override
	public int selectSortedListCnt(Map<String, String> listMap) {
		return session.selectOne("board.selectSortedListCnt", listMap);
	}

	@Override
	public int selectTotalCnt() {
		return session.selectOne("board.selectTotalCnt");
	}

	@Override
	public List<GroupBoard> selectDetailBoard(String groupBoardNo) {
		return session.selectList("board.selectDetailBoard", groupBoardNo);
	}

	@Override
	public int insertBoard(GroupBoard gb) {
		return session.insert("board.insertBoard", gb);
	}

	@Override
	public int updateBoard(GroupBoard gb) {
		return session.update("board.updateBoard", gb);
	}

	@Override
	public int deleteBoard(String groupBoardNo) {
		return session.delete("board.deleteBoard", groupBoardNo);
	}

	@Override
	public int increaseBoardReadCnt(String groupBoardNo) {
		return session.update("board.increaseBoardReadCnt", groupBoardNo);
	}

	@Override
	public List<Report> selectOne(Map<Object, Object> map) {
		return session.selectList("board.selectOne", map);
	}

	@Override
	public int insertReport(Report report) {
		return session.insert("board.insertReport", report);
	}

	@Override
	public int updateCnt(Map<Object, Object> map) {
		return session.update("board.updateCnt", map);
	}

	@Override
	public List<Board> selectBaordOne(String groupBoardNo) {
		return session.selectList("board.selectBoardOne", groupBoardNo);
	}

	@Override
	public List<GBComment> selectAllComment(String groupBoardNo) {
		return session.selectList("board.selectAllComment", groupBoardNo);
	}

	@Override
	public int insertComment(GBComment param1) {
		return session.insert("board.insertComment", param1);
	}

	@Override
	public int updateComment(GBComment param1) {
		return session.update("board.updateComment", param1);
	}

	@Override
	public int deleteComment(GBComment param1) {
		return session.delete("board.deleteComment", param1);
	}

	@Override
	public int selectCommentCnt(String groupBoardNo) {
		return session.selectOne("board.selectCommentCnt", groupBoardNo);
	}

	@Override
	public int alertComment(Map<String, String> map) {
		return session.insert("board.alertComment", map);
	}

	@Override
	public List<CmtReport> selectReport() {
		return session.selectList("board.selectReport");
	}

	@Override
	public int updateReportCnt(String groupBoardCommentNo) {
		return session.update("board.updateReportCnt", groupBoardCommentNo);
	}

	
	
	
	
}
