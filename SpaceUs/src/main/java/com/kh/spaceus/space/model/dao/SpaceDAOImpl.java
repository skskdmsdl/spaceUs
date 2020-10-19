package com.kh.spaceus.space.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spaceus.qna.model.vo.Qna;
import com.kh.spaceus.space.model.vo.Attachment;
import com.kh.spaceus.space.model.vo.Category;
import com.kh.spaceus.space.model.vo.Option;
import com.kh.spaceus.space.model.vo.OptionList;
import com.kh.spaceus.space.model.vo.Review;
import com.kh.spaceus.space.model.vo.ReviewAttachment;
import com.kh.spaceus.space.model.vo.Space;
import com.kh.spaceus.space.model.vo.SpaceList;
import com.kh.spaceus.space.model.vo.SpaceTag;
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
	public Star selectStar(String spaceNo) {
		return sqlSession.selectOne("space.selectStar", spaceNo);
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
	public int insertSpace(Space space) {
		return sqlSession.insert("space.insertSpace", space);
	}

	@Override
	public int insertAttachment(Attachment attach) {
		return sqlSession.insert("space.insertAttachment", attach);
	}
	
	@Override
	public int insertOption(Option option) {
		return sqlSession.insert("space.insertOption", option);
	}

	@Override
	public int insertSpaceTag(SpaceTag spaceTag) {
		return sqlSession.insert("space.insertSpaceTag", spaceTag);
	}

	@Override
	public int insertWish(Wish wish) {
		return sqlSession.insert("space.insertWish", wish);
	}

	@Override
	public List<SpaceList> selectSameCategory(Space space) {
		return sqlSession.selectList("space.selectSameCategory", space);
	}

	@Override
	public int selectLikeCnt(String spaceNo) {
		return sqlSession.selectOne("space.selectLikeCnt", spaceNo);
	}

	@Override
	public int deleteWish(Wish wish) {
		return sqlSession.delete("space.deleteWish", wish);
	}

	@Override
	public String selectCateName(String spaceNo) {
		return sqlSession.selectOne("space.selectCateName", spaceNo);
	}

	@Override
	public List<Space> selectReviewList(String email) {
		return sqlSession.selectList("space.selectReviewList", email);
	}

	@Override
	public int updateReview(Review review) {
		return sqlSession.update("space.updateReview", review);
	}

	@Override
	public List<Review> selectStarAvg(String spaceNo) {
		return sqlSession.selectList("space.selectStarAvg", spaceNo);
	}

	@Override
	public void updateStarAvg(Space space) {
		sqlSession.update("space.updateStarAvg", space);
	}

	@Override
	public List<Space> selectReviewPossible(String email) {
		return sqlSession.selectList("space.selectReviewPossible", email);
	}

	@Override
	public List<Space> selectReviewComplete(String email) {
		return sqlSession.selectList("space.selectReviewComplete", email);
	}

	@Override
	public List<Space> selectAll() {
		return sqlSession.selectList("space.selectAll");
	}

	@Override
	public List<OptionList> selectOptionList(String spaceNo) {
		return sqlSession.selectList("space.selectOptionList", spaceNo);
	}
	
	@Override	
	public List<Review> selectRecentReviewList() {
		return sqlSession.selectList("space.selectRecentReviewList");
	}

	@Override
	public List<Object> selectAutoList(String value) {
		return sqlSession.selectList("space.selectAutoList", value);
	}
	
	@Override	
	public List<SpaceList> selectPopularSpaces() {
		return sqlSession.selectList("space.selectPopularSpaces");
	}

	@Override
	public List<Category> selectCategoryList() {
		return sqlSession.selectList("space.selectCategoryList");
	}

	@Override
	public List<OptionList> selectOptionList1() {
		return sqlSession.selectList("space.selectOptionList1");
	}

	@Override
	public List<String> selectSpaceNoList(Map<String, String> map) {
		return sqlSession.selectList("space.selectSpaceNoList", map);
	}

	
	/*@Override
	public List<Space> selectListSpaceCollection(String email) {
		return sqlSession.selectList("space.selectListSpaceCollection", email);
	}*/
		
	@Override
	public List<SpaceList> selectSearchSpaceList(String searchSpace) {
		return sqlSession.selectList("space.selectSearchSpaceList", searchSpace);
	}

	@Override
	public Wish selectOneWish(Wish wish) {
		return sqlSession.selectOne("space.selectOneWish", wish);
	}
	
	@Override
	public Attachment selectPopularImage(String spaceNo) {
		return sqlSession.selectOne("space.selectPopularImage", spaceNo);
	}

	@Override
	public List<String> selectSearchDetailSpaceNo(Map<String, String> map) {
		return sqlSession.selectList("space.selectSearchDetailSpaceNo", map);
	}

	@Override
	public int increaseSpaceReadCnt(String spaceNo) {
		return sqlSession.update("space.increaseSpaceReadCnt", spaceNo);
	}
		
	@Override
	public int minusLikeCnt(Wish wish) {
		return sqlSession.update("space.minusLikeCnt", wish);
	}

	@Override
	public int deleteOption(String spaceNo) {
		return sqlSession.delete("space.deleteOption", spaceNo);
	}

	@Override
	public int updateStatus(String spaceNo, String status) {
		Map<String,String> map = new HashMap<>();
		map.put("spaceNo", spaceNo);
		map.put("status", status);
		return sqlSession.update("space.updateStatus", map);
	}

	@Override
	public int selectHostReviewTotalContents(String spaceNo) {
		return sqlSession.selectOne("space.selectHostReviewTotalContents", spaceNo);
	}

	@Override
	public int deleteSpace(String spaceNo) {
		return sqlSession.delete("space.deleteSpace", spaceNo);
	}

}
