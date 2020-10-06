package com.kh.spaceus.space.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spaceus.qna.model.vo.Qna;
import com.kh.spaceus.space.model.vo.Review;
import com.kh.spaceus.space.model.vo.ReviewAttachment;
import com.kh.spaceus.space.model.vo.Space;
import com.kh.spaceus.space.model.vo.Star;
import com.kh.spaceus.space.model.vo.Tag;
import com.kh.spaceus.space.model.vo.Wish;


@Repository
public class SpaceDAOImpl implements SpaceDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Tag selectOneTag(String hashTag) {
		return sqlSession.selectOne("space.selectOneTag", hashTag);
	}
	
	@Override
	public int insertHashTag(String hashTag) {
		return sqlSession.insert("space.insertHashTag", hashTag);
	}

	@Override
	public Space selectOneSpace(String spaceNo) {
		return sqlSession.selectOne("space.selectOneSpaceNum", spaceNo);
	}
	
	@Override
	public Space selectOneSpace(long businessNo) {
		return sqlSession.selectOne("space.selectOneSpace", businessNo);
	}

	@Override
	public List<Tag> selectListSpaceTag(String spaceNo) {
		return sqlSession.selectList("space.selectListSpaceTag", spaceNo);
	}

	@Override
	public int insertReview(Review review) {
		return sqlSession.insert("space.insertReview", review);
	}

	@Override
	public int insertReviewAttahment(ReviewAttachment attach) {
		return sqlSession.insert("space.insertReviewAttahment", attach);
	}

	@Override
	public List<Review> selectListReview(String spaceNo, int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("space.selectListReview", spaceNo, rowBounds);
	}

	@Override
	public int selectReviewTotalContents(String spaceNo) {
		return sqlSession.selectOne("space.selectReviewTotalContents", spaceNo);
	}

	@Override
	public Star selectStar() {
		return sqlSession.selectOne("space.selectStar");
	}

	@Override
	public List<Qna> selectQuestionList(String spaceNo, int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("qna.selectQuestionList", spaceNo, rowBounds);
	}

	@Override
	public int selectQuestionTotalContents(String spaceNo) {
		return sqlSession.selectOne("qna.selectQuestionTotalContents", spaceNo);
	}

	@Override
	public Space selectOneSpaceNo(String email) {
		return sqlSession.selectOne("space.selectOneSpaceNo", email);
	}

	@Override
	public int updateReviewComment(Review review) {
		return sqlSession.update("space.updateReviewComment", review);
	}

	@Override
	public List<Review> selectReviewComment(String spaceNo, int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("space.selectReviewComment", spaceNo, rowBounds);
	}

	@Override
	public int insertWishList(Wish wish) {
		return sqlSession.insert("space.insertWishList", wish);
	}

	@Override
	public List<Space> selectSameCategory(String category) {
		return sqlSession.selectList("space.selectSameCategory", category);
	}

	/*@Override
	public List<Space> selectListSpaceCollection(String email) {
		return sqlSession.selectList("space.selectListSpaceCollection", email);
	}*/

}
