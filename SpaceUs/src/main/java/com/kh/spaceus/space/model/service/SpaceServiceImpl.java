package com.kh.spaceus.space.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spaceus.space.model.dao.SpaceDAO;
import com.kh.spaceus.space.model.vo.Space;
import com.kh.spaceus.space.model.vo.Tag;

@Service
public class SpaceServiceImpl implements SpaceService{
	
	@Autowired
	private SpaceDAO spaceDAO;

	@Override
	public Tag selectOneTag(String hashTag) {
		return spaceDAO.selectOneTag(hashTag);
	}
	
	@Override
	public int insertHashTag(String hashTag) {
		return spaceDAO.insertHashTag(hashTag);
	}

	@Override
	public Space selectOneSpace(String spaceNo) {
		return spaceDAO.selectOneSpace(spaceNo);
	}
	
	@Override
	public Space selectOneSpace(int businessNum) {
		return spaceDAO.selectOneSpace(businessNum);
	}

	@Override
	public List<Tag> selectListSpaceTag(String spaceNo) {
		return spaceDAO.selectListSpaceTag(spaceNo);
	}

	/*@Override
	public List<Space> selectListSpaceCollection(String email) {
		return spaceDAO.selectListSpaceCollection(email);
	}*/
	
}
