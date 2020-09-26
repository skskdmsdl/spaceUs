package com.kh.spaceus.space.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spaceus.space.model.vo.Space;
import com.kh.spaceus.space.model.vo.Tag;


@Repository
public class SpaceDAOImpl implements SpaceDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Tag selectOneTag(String hashTag) {
		return sqlSession.selectOne("space.selectOneTag", hashTag);
	}
	
	@Override
	public int insertHashTag(String hashTag) {
		return sqlSession.insert("space.insertHashTag", hashTag);
	}

	@Override
	public Space selectOneSpace(int businessNum) {
		return sqlSession.selectOne("space.selectOneSpace", businessNum);
	}


}
