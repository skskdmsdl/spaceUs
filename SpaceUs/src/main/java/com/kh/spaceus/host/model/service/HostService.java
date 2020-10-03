package com.kh.spaceus.host.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.spaceus.qna.model.vo.Qna;

public interface HostService {
	
	List<Qna> selectUnreplied(String spaceId);

	List<HashMap<String,Object>> selectSettlementList(String hostId);

	List<Qna> selectQuestionList(String hostId);
	
}
