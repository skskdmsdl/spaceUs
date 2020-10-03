package com.kh.spaceus.qna.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spaceus.qna.model.vo.Qna;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class QnaDAOImpl implements QnaDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertQna(Qna qna) {
		return session.insert("qna.insertQna", qna);
	}

}
