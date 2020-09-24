package com.kh.spaceus.space.model.service;

import com.kh.spaceus.space.model.vo.HashTag;

public interface SpaceService {

	HashTag selectOneTag(String hashTag);

	int insertHashTag(String hashTag);

}
