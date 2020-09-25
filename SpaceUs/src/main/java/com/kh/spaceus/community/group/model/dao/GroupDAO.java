package com.kh.spaceus.community.group.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spaceus.community.group.model.vo.Board;
import com.kh.spaceus.community.group.model.vo.GroupBoard;

public interface GroupDAO {

	List<Board> selectListBoard();

	List<GroupBoard> selectListGroupBoard();

	List<GroupBoard> selectSortedListGroupBoard(Map<String, String> listMap);

	int selectTotalCnt();
	
	
}
