package com.kh.spaceus.space.model.dao;

import com.kh.spaceus.space.model.vo.HashTag;

public interface SpaceDAO {

	HashTag selectOneTag(String hashTag);

	int insertHashTag(String hashTag);

}
