package com.kh.spaceus.community.recruit.model.dao;

import java.util.List;

import com.kh.spaceus.community.recruit.model.vo.Recruit;
import com.kh.spaceus.space.model.vo.Tag;

public interface RecruitDAO {

	int insertRecruit(Recruit recruit);

	List<Recruit> selectRecruitList(int limit, int offset);

	int selectRecruitTotalContents();

	Recruit selectOneRecruit(String no);

	int updateRecruit(Recruit recruit);

	int deleteRecruit(String no);

}
