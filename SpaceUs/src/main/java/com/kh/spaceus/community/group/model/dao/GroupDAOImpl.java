package com.kh.spaceus.community.group.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spaceus.community.group.model.vo.Board;
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
	public List<GroupBoard> selectListGroupBoard() {
		return session.selectList("board.selectListGroupBoard");
	}

	@Override
	public List<GroupBoard> selectSortedListGroupBoard(Map<String, String> listMap) {
		return session.selectList("board.selectSortedListGroupBoard", listMap);
	}

	@Override
	public int selectTotalCnt() {
		return session.selectOne("board.selectTotalCnt");
	}

	@Override
	public List<GroupBoard> selectDetailBoard(String groupBoardNo) {
		return session.selectList("board.selectDetailBoard", groupBoardNo);
	}
	
	
	
	
	
}
