package com.kh.spaceus.exhibition.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spaceus.exhibition.model.vo.Exhibition;

@Repository
public class ExhibitionDAOImpl implements ExhibitionDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Exhibition> selectExList() {
		return sqlSession.selectList("exhibition.selectExList");
	}

	@Override
	public int deleteExhibition(String exNo) {
		return sqlSession.delete("exhibition.deleteExhibition", exNo);
	}

	@Override
	public int insertExhibition(Exhibition exhibition) {
		return sqlSession.insert("exhibition.insertExhibition", exhibition);
	}

	@Override
	public Exhibition selectOne(String exNo) {
		return sqlSession.selectOne("exhibition.selectOne", exNo);
	}

	@Override
	public List<Exhibition> selectByTag(String tag) {
		return sqlSession.selectList("exhibition.selectByTag", tag);
	}

	@Override
	public Exhibition selectOneByTag(String tag) {
		return sqlSession.selectOne("exhibition.selectOneByTag", tag);
	}

}
