package com.kh.spaceus.qna.model.service;

import com.kh.spaceus.qna.model.vo.Qna;

public interface QnaService {

	int insertQna(Qna qna);

	int updateAnswer(Qna qna);

	int deleteQna(Qna qna);

	int updateQna(Qna qna);

}
