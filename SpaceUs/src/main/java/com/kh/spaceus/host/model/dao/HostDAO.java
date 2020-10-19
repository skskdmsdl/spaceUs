package com.kh.spaceus.host.model.dao;

import java.util.HashMap;
import java.util.List;

import com.kh.spaceus.host.model.vo.DailySale;
import com.kh.spaceus.qna.model.vo.Qna;
import com.kh.spaceus.reservation.model.vo.Reservation;
import com.kh.spaceus.space.model.vo.Space;


public interface HostDAO {
	
	List<Qna> selectUnreplied(String hostId);

	List<DailySale> selectSettlementList(String hostId);

	List<Qna> selectQuestionList(String hostId);

	List<String> selectReservationSpaceNo();

	int insertSettlement(String spaceNo);
}
