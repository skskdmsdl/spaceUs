package com.kh.spaceus.exhibition.model.dao;

import java.util.List;

import com.kh.spaceus.exhibition.model.vo.Exhibition;

public interface ExhibitionDAO {

	List<Exhibition> selectExList();

	int deleteExhibition(String exNo);

	int insertExhibition(Exhibition exhibition);

}
