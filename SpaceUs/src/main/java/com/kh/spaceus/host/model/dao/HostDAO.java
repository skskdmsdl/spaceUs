package com.kh.spaceus.host.model.dao;

import java.util.List;

import com.kh.spaceus.host.model.vo.Qna;

public interface HostDAO {
	
	List<Qna> selectUnreplied(String spaceId);
}
