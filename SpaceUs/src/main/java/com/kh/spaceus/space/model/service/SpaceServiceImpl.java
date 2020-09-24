package com.kh.spaceus.space.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spaceus.space.model.dao.SpaceDAO;
import com.kh.spaceus.space.model.vo.HashTag;

@Service
public class SpaceServiceImpl implements SpaceService{
	
	@Autowired
	private SpaceDAO spaceDAO;

	@Override
	public HashTag selectOneTag(String hashTag) {
		return spaceDAO.selectOneTag(hashTag);
	}
	
	@Override
	public int insertHashTag(String hashTag) {
		return spaceDAO.insertHashTag(hashTag);
	}

}
