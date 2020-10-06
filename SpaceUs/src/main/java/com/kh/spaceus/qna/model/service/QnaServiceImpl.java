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
	public int updateAnswer(String answer, String qnaNo) {
		return QnaDAO.updateAnswer(answer, qnaNo);
	}


}
