package com.kh.spaceus.space.model.dao;

import java.util.List;
import java.util.Map;

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

public interface SpaceDAO {

	Tag selectOneTag(String hashTag);

	int insertHashTag(String hashTag);

	Space selectOneSpace(String spaceNo);

	Space selectOneSpace(long businessNo);

	List<Tag> selectListSpaceTag(String spaceNo);

	int insertReview(Review review);

	int insertReviewAttahment(ReviewAttachment attach);

	List<Review> selectListReview(String spaceNo, int limit, int offset);

	int selectReviewTotalContents(String spaceNo);

	Star selectStar(String spaceNo);

	List<Qna> selectQuestionList(String spaceNo, int limit, int offset);

	int selectQuestionTotalContents(String spaceNo);

	Space selectOneSpaceNo(String email);

	int updateReviewComment(Review review);

	List<Review> selectReviewComment(String spaceNo, int limit, int offset);
	
	int insertSpace(Space space);

	int insertAttachment(Attachment attach);

	int insertOption(Option option);

	int insertSpaceTag(SpaceTag spaceTag);

	int insertWish(Wish wish);

	List<SpaceList> selectSameCategory(Space space);

	int selectLikeCnt(String spaceNo);

	int deleteWish(Wish wish);

	String selectCateName(String cateNo);

	List<Space> selectReviewList(String email);

	int updateReview(Review review);

	List<Review> selectStarAvg(String spaceNo);

	void updateStarAvg(Space space);

	List<Space> selectReviewPossible(String email);

	List<Space> selectReviewComplete(String email);

	List<Review> selectRecentReviewList();


	List<Space> selectAll();

	List<OptionList> selectOptionList(String spaceNo);
	
	List<SpaceList> selectPopularSpaces();

	List<Object> selectAutoList(String value);
	
	Wish selectOneWish(Wish wish);

	List<Category> selectCategoryList();

	List<OptionList> selectOptionList1();

	List<String> selectSpaceNoList(String keyword);

	List<SpaceList> selectSearchSpaceList(String searchSpace);

	List<String> selectSearchDetailSpaceNo(Map<String, String> map);
	
	Attachment selectPopularImage(String spaceNo);

	int increaseSpaceReadCnt(String spaceNo);


	/* List<Space> selectListSpaceCollection(String email); */


}
