package com.kh.spaceus.host.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spaceus.host.model.dao.HostDAO;
import com.kh.spaceus.qna.model.vo.Qna;
import com.kh.spaceus.reservation.model.vo.Reservation;
import com.kh.spaceus.space.model.vo.Space;

@Service
public class HostServiceImpl implements HostService {

	@Autowired
	private HostDAO hostDAO;
	
	@Override
	public List<Qna> selectUnreplied(String hostId) {
		return hostDAO.selectUnreplied(hostId);
	}

	@Override
	public List<HashMap<String,Object>> selectSettlementList(String hostId) {
		return hostDAO.selectSettlementList(hostId);
	}

	@Override
	public List<Qna> selectQuestionList(String hostId) {
		return hostDAO.selectQuestionList(hostId);
	}

	@Override
	public List<String> selectReservationSpaceNo() {
		return hostDAO.selectReservationSpaceNo();
	}

	@Override
	public int insertSettlement(String spaceNo) {
		return hostDAO.insertSettlement(spaceNo);
	}

}
