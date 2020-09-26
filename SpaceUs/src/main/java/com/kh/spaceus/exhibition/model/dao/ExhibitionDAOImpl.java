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

}
