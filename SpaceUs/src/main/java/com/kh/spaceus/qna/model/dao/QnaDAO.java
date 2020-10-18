package com.kh.spaceus.qna.model.dao;

import com.kh.spaceus.qna.model.vo.Qna;

public interface QnaDAO {

	int insertQna(Qna qna);

	int updateAnswer(Qna qna);

	int deleteQna(Qna qna);

	int updateQna(Qna qna);

}
