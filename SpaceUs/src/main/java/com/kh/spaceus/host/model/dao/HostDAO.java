package com.kh.spaceus.host.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.spaceus.host.model.vo.Qna;

public interface HostDAO {
	
	List<Qna> selectUnreplied(String spaceId);

	List<HashMap<String,Object>>selectSettlementList(String hostId);
}
