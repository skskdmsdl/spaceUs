package com.kh.spaceus.host.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spaceus.host.model.vo.Qna;

@Repository
public class HostDAOImpl implements HostDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Qna> selectUnreplied(String spaceId) {
		
		
		return session.selectList("host.selectUnreplied");
	}

	@Override
	public List<HashMap<String,Object>> selectSettlementList(String hostId) {
		return session.selectList("host.selectSettlementList");
	}

	
}
