package com.kh.spaceus.community.recruit.model.service;

import java.util.List;

import com.kh.spaceus.community.recruit.model.vo.Recruit;

public interface RecruitService {

	int insertRecruit(Recruit recruit);

	List<Recruit> selectRecruitList(int limit, int offset);

	int selectRecruitTotalContents();

	Recruit selectOneRecruit(String no);

	int updateRecruit(Recruit recruit);

	int deleteRecruit(String no);

}