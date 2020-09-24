package com.kh.spaceus.community.recruit.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spaceus.community.recruit.model.dao.RecruitDAO;
import com.kh.spaceus.space.model.dao.SpaceDAO;
import com.kh.spaceus.space.model.vo.Tag;

@Service
public class RecruitServiceImpl implements RecruitService{
	
	@Autowired
	private RecruitDAO recruitDAO;

	@Override
	public int insertRecruit(String header, String title, String ir1) {
		return 0;
	}

	

}
