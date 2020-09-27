package com.kh.spaceus.host.model.dao;

import java.util.HashMap;
import java.util.List;

import com.kh.spaceus.host.model.vo.Qna;

public interface HostDAO {
	
	List<Qna> selectUnreplied(String hostId);

	List<HashMap<String,Object>>selectSettlementList(String hostId);

	List<Qna> selectQuestionList(String hostId);
}
