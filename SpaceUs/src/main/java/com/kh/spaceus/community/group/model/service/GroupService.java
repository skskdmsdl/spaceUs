package com.kh.spaceus.community.group.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spaceus.community.group.model.vo.Board;
import com.kh.spaceus.community.group.model.vo.GroupBoard;

public interface GroupService {

	List<Board> selectListBoard();

	List<GroupBoard> selectListGroupBoard();

	List<GroupBoard> selectSortedListGroupBoard(Map<String, String> listMap);

	int selectTotalCnt();

	List<GroupBoard> selectDetailBoard(String groupBoardNo);
	
	

}
