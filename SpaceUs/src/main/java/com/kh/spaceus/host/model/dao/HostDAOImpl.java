package com.kh.spaceus.host.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spaceus.qna.model.vo.Qna;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class HostDAOImpl implements HostDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Qna> selectUnreplied(String hostId) {
		log.debug("hostId = {}"+hostId);
		
		return session.selectList("host.selectUnreplied", hostId);
	}

	@Override
	public List<HashMap<String,Object>> selectSettlementList(String hostId) {
		return session.selectList("host.selectSettlementList", hostId);
	}

	@Override
	public List<Qna> selectQuestionList(String hostId) {
		return session.selectList("host.selectQuestionList", hostId);
	}

	
}
