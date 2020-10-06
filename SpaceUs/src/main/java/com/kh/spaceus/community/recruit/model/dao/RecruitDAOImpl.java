package com.kh.spaceus.community.recruit.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spaceus.community.recruit.model.vo.Recruit;
import com.kh.spaceus.community.recruit.model.vo.RecruitComment;
import com.kh.spaceus.community.recruit.model.vo.ReportComment;
import com.kh.spaceus.community.recruit.model.vo.ReportRecruit;
import com.kh.spaceus.space.model.vo.Tag;


@Repository
public class RecruitDAOImpl implements RecruitDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertRecruit(Recruit recruit) {
		return sqlSession.insert("recruit.insertRecruit", recruit);
	}

	@Override
	public List<Recruit> selectRecruitList(int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("recruit.selectRecruitList", null, rowBounds);
	}

	@Override
	public int selectRecruitTotalContents() {
		return sqlSession.selectOne("recruit.selectRecruitTotalContents");
	}

	@Override
	public Recruit selectOneRecruit(String no) {
		return sqlSession.selectOne("recruit.selectOneRecruit", no);
	}

	@Override
	public int updateRecruit(Recruit recruit) {
		return sqlSession.update("recruit.updateRecruit", recruit);
	}

	@Override
	public int deleteRecruit(String no) {
		return sqlSession.delete("recruit.deleteRecruit", no);
	}

	@Override
	public ReportRecruit selectOneReport(String no, String memberEmail) {
		ReportRecruit reportRecruit = new ReportRecruit();
		reportRecruit.setBoardNo(no);
		reportRecruit.setMemberEmail(memberEmail);
		return sqlSession.selectOne("recruit.selectOneReport", reportRecruit);
	}

	@Override
	public int insertReport(ReportRecruit report) {
		return sqlSession.insert("recruit.insertReport", report);
	}

	@Override
	public int updateReport(String no) {
		return sqlSession.update("recruit.updateReport", no);
	}

	@Override
	public int increaseRecruitReadCnt(String no) {
		return sqlSession.update("recruit.increaseRecruitReadCnt", no);
	}

	@Override
	public int insertComment(RecruitComment comment) {
		return sqlSession.insert("recruit.insertComment", comment);
	}

	@Override
	public List<RecruitComment> selectCommentList(RecruitComment comment) {
		return sqlSession.selectList("recruit.selectCommentList", comment);
	}

	@Override
	public int updateComment(RecruitComment comment) {
		return sqlSession.update("recruit.updateComment", comment);
	}

	@Override
	public int deleteComment(String commentNo) {
		return sqlSession.update("recruit.deleteComment", commentNo);
	}

	@Override
	public int selectCommentTotalContents(String no) {
		return sqlSession.selectOne("recruit.selectCommentTotalContents", no);
	}

	@Override
	public int insertReportComment(ReportComment reportComment) {
		return sqlSession.insert("recruit.insertReportComment", reportComment);
	}

	@Override
	public List<Recruit> searchRecruit(String keyWord, int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("recruit.searchRecruit", keyWord, rowBounds);
	}






}
