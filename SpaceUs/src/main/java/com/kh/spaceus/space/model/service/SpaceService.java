package com.kh.spaceus.space.model.service;

import com.kh.spaceus.space.model.vo.Tag;

public interface SpaceService {

	Tag selectOneTag(String hashTag);

	int insertHashTag(String hashTag);

}