package com.kh.spaceus.space.model.dao;

import com.kh.spaceus.space.model.vo.Space;
import com.kh.spaceus.space.model.vo.Tag;

public interface SpaceDAO {

	Tag selectOneTag(String hashTag);

	int insertHashTag(String hashTag);

	Space selectOneSpace(String spaceNo);

	Space selectOneSpace(int businessNum);


}
