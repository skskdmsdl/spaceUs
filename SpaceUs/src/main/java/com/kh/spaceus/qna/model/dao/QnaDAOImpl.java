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

	@Override
	public int updateAnswer(Qna qna) {
		return session.update("qna.updateAnswer", qna);
	}

	@Override
	public int deleteQna(Qna qna) {
		return session.delete("qna.deleteQuestion", qna);
	}

	@Override
	public int updateQna(Qna qna) {
		return session.delete("qna.updateQuestion", qna);
	}

	

}
