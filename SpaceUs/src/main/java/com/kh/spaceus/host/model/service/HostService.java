package com.kh.spaceus.host.model.service;

import java.util.List;

import com.kh.spaceus.host.model.vo.Qna;

public interface HostService {
	
	List<Qna> selectUnreplied(String spaceId);
	
}
