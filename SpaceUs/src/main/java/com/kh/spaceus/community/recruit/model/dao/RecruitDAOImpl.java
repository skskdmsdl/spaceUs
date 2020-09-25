package com.kh.spaceus.community.recruit.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spaceus.space.model.vo.Tag;


@Repository
public class RecruitDAOImpl implements RecruitDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;



}
