package com.kh.spaceus.qna.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spaceus.qna.model.dao.QnaDAO;
import com.kh.spaceus.qna.model.vo.Qna;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDAO QnaDAO;
	
	@Override
	public int insertQna(Qna qna) {
		return QnaDAO.insertQna(qna);
	}

	@Override
	public int updateAnswer(Qna qna) {
		return QnaDAO.updateAnswer(qna);
	}

	@Override
	public int deleteQna(Qna qna) {
		return QnaDAO.deleteQna(qna);
	}

	@Override
	public int updateQna(Qna qna) {
		return QnaDAO.updateQna(qna);
	}


}
