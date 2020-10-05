package com.kh.spaceus.exhibition.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spaceus.exhibition.model.dao.ExhibitionDAO;
import com.kh.spaceus.exhibition.model.vo.Exhibition;

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

}
