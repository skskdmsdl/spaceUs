package com.kh.spaceus.community.group.model.service;

import java.util.List;

import com.kh.spaceus.community.group.model.vo.Board;
import com.kh.spaceus.community.group.model.vo.GroupBoard;

public interface GroupService {

	List<Board> selectListBoard();

	List<GroupBoard> selectListGroupBoard();
	
	

}