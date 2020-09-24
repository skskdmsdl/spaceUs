package com.kh.spaceus.community.group.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spaceus.community.group.model.dao.GroupDAO;
import com.kh.spaceus.community.group.model.vo.Board;

@Service
public class GroupServiceImpl implements GroupService {
	
	@Autowired
	private GroupDAO groupDAO;

	@Override
	public List<Board> selectListBoard() {
		return groupDAO.selectListBoard();
	}
	
	
		

}
