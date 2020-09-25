package com.kh.spaceus.community.group.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spaceus.community.group.model.dao.GroupDAO;
import com.kh.spaceus.community.group.model.vo.Board;
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
	public List<GroupBoard> selectListGroupBoard() {
		return groupDAO.selectListGroupBoard();
	}
	
	
		

}
