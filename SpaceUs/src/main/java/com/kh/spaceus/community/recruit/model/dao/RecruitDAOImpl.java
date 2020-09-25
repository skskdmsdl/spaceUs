package com.kh.spaceus.community.recruit.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spaceus.community.recruit.model.vo.Recruit;
import com.kh.spaceus.space.model.vo.Tag;


@Repository
public class RecruitDAOImpl implements RecruitDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertRecruit(Recruit recruit) {
		return sqlSession.insert("recruit.insertRecruit", recruit);
	}

	@Override
	public List<Recruit> selectRecruitList(int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("recruit.selectRecruitList", null, rowBounds);
	}

	@Override
	public int selectRecruitTotalContents() {
		return sqlSession.selectOne("recruit.selectRecruitTotalContents");
	}

	@Override
	public Recruit selectOneRecruit(String no) {
		return sqlSession.selectOne("recruit.selectOneRecruit", no);
	}



}
