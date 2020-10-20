package com.kh.spaceus.exhibition.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spaceus.exhibition.model.dao.ExhibitionDAO;
import com.kh.spaceus.exhibition.model.vo.Exhibition;
import com.kh.spaceus.exhibition.model.vo.ExhibitionTag;
import com.kh.spaceus.space.model.vo.SpaceList;

@Service
public class ExhibitionServiceImpl implements ExhibitionService{
	
	@Autowired
	ExhibitionDAO exhibitionDAO;

	@Override
	public List<Exhibition> selectExList() {
		return exhibitionDAO.selectExList();
	}
	@Override
	public int deleteExhibition(String exNo) {
		return exhibitionDAO.deleteExhibition(exNo);
	}
	@Override
	public int insertExhibition(Exhibition exhibition) {
		return exhibitionDAO.insertExhibition(exhibition);
	}
	@Override
	public Exhibition selectOne(String exNo) {
		return exhibitionDAO.selectOne(exNo);
	}
	@Override
	public List<SpaceList> selectByTagNo(String tagNo) {
		return exhibitionDAO.selectByTagNo(tagNo);
	}
	@Override
	public Exhibition selectOneByTag(String tag) {
		return exhibitionDAO.selectOneByTag(tag);
	}
	@Override
	public List<ExhibitionTag> selectTagList() {
		return exhibitionDAO.selectTagList();
	}
	
	

}
