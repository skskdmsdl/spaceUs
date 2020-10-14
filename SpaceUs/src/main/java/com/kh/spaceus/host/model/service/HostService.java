package com.kh.spaceus.host.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.spaceus.qna.model.vo.Qna;
import com.kh.spaceus.reservation.model.vo.Reservation;
import com.kh.spaceus.space.model.vo.Space;

public interface HostService {
	
	List<Qna> selectUnreplied(String spaceId);

	List<HashMap<String,Object>> selectSettlementList(String hostId);

	List<Qna> selectQuestionList(String hostId);

	List<String> selectReservationSpaceNo();

	int insertSettlement(String spaceNo);

	
}
