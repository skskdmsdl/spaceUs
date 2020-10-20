package com.kh.spaceus.exhibition.model.service;

import java.util.List;

import com.kh.spaceus.exhibition.model.vo.Exhibition;
import com.kh.spaceus.exhibition.model.vo.ExhibitionTag;
import com.kh.spaceus.space.model.vo.SpaceList;

public interface ExhibitionService {

	List<Exhibition> selectExList();

	int deleteExhibition(String exNo);

	int insertExhibition(Exhibition exhibition);

	Exhibition selectOne(String exNo);

	List<SpaceList> selectByTagNo(String tagNo);

	Exhibition selectOneByTag(String tag);

	List<ExhibitionTag> selectTagList();
}
