package com.kh.spaceus.host.model.service;

import java.util.List;

import com.kh.spaceus.host.model.vo.DailySale;
import com.kh.spaceus.qna.model.vo.Qna;

public interface HostService {
	
	List<Qna> selectUnreplied(String spaceId);

	List<DailySale> selectSettlementList(String hostId);

	List<Qna> selectQuestionList(String hostId);

	List<String> selectReservationSpaceNo();

	int insertSettlement(String spaceNo);

	
}
