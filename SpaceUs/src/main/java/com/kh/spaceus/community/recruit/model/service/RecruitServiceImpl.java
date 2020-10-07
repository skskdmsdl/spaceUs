package com.kh.spaceus.community.recruit.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spaceus.community.recruit.model.dao.RecruitDAO;
import com.kh.spaceus.community.recruit.model.vo.Recruit;
import com.kh.spaceus.community.recruit.model.vo.RecruitComment;
import com.kh.spaceus.community.recruit.model.vo.ReportComment;
import com.kh.spaceus.community.recruit.model.vo.ReportRecruit;
import com.kh.spaceus.space.model.dao.SpaceDAO;
import com.kh.spaceus.space.model.vo.Tag;

@Service
public class RecruitServiceImpl implements RecruitService{
	
	@Autowired
	private RecruitDAO recruitDAO;

	@Override
	public int insertRecruit(Recruit recruit) {
		return recruitDAO.insertRecruit(recruit);
	}

	@Override
	public List<Recruit> selectRecruitList(int limit, int offset) {
		return recruitDAO.selectRecruitList(limit, offset);
	}

	@Override
	public int selectRecruitTotalContents() {
		return recruitDAO.selectRecruitTotalContents();
	}

	@Override
	public Recruit selectOneRecruit(String no) {
		return recruitDAO.selectOneRecruit(no);
	}

	@Override
	public int updateRecruit(Recruit recruit) {
		return recruitDAO.updateRecruit(recruit);
	}

	@Override
	public int deleteRecruit(String no) {
		return recruitDAO.deleteRecruit(no);
	}

	@Override
	public ReportRecruit selectOneReport(String no, String memberEmail) {
		return recruitDAO.selectOneReport(no, memberEmail);
	}

	@Override
	public int insertReport(ReportRecruit report) {
		return recruitDAO.insertReport(report);
	}


	@Override
	public int updateReport(String no) {
		return recruitDAO.updateReport(no);
	}

	@Override
	public int increaseRecruitReadCnt(String no) {
		return recruitDAO.increaseRecruitReadCnt(no);
	}

	@Override
	public int insertComment(RecruitComment comment) {
		return recruitDAO.insertComment(comment);
	}

	@Override
	public List<RecruitComment> selectCommentList(RecruitComment comment) {
		return recruitDAO.selectCommentList(comment);
	}

	@Override
	public int updateComment(RecruitComment comment) {
		return recruitDAO.updateComment(comment);
	}

	@Override
	public int deleteComment(String commentNo) {
		return recruitDAO.deleteComment(commentNo);
	}

	@Override
	public int selectCommentTotalContents(String no) {
		return recruitDAO.selectCommentTotalContents(no);
	}

	@Override
	public int insertReportComment(ReportComment reportComment) {
		return recruitDAO.insertReportComment(reportComment);
	}

	@Override
	public List<Recruit> searchRecruit(String keyWord, int limit, int offset) {
		return recruitDAO.searchRecruit(keyWord, limit, offset);
	}

	@Override
	public int selectRecruitTotalSearch(String keyWord) {
		return recruitDAO.selectRecruitTotalSearch(keyWord);
	}

	@Override
	public List<Recruit> recruitHeaderSearch(String header, int limit, int offset) {
		return recruitDAO.recruitHeaderSearch(header, limit, offset);
	}

	@Override
	public int selectRecruitTotalHeader(String header) {
		return recruitDAO.selectRecruitTotalHeader(header);
	}





	

}
