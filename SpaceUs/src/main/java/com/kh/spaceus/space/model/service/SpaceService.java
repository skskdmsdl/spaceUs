package com.kh.spaceus.space.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spaceus.qna.model.vo.Qna;
import com.kh.spaceus.space.model.vo.Attachment;
import com.kh.spaceus.space.model.vo.Category;
import com.kh.spaceus.space.model.vo.Option;
import com.kh.spaceus.space.model.vo.OptionList;
import com.kh.spaceus.space.model.vo.Review;
import com.kh.spaceus.space.model.vo.Space;
import com.kh.spaceus.space.model.vo.SpaceList;
import com.kh.spaceus.space.model.vo.SpaceTag;
import com.kh.spaceus.space.model.vo.Star;
import com.kh.spaceus.space.model.vo.Tag;
import com.kh.spaceus.space.model.vo.Wish;

public interface SpaceService {

	Tag selectOneTag(String hashTag);

	int insertHashTag(String hashTag);

	Space selectOneSpace(String spaceNo);

	Space selectOneSpace(long businessNo);

	List<Tag> selectListSpaceTag(String spaceNo);

	int insertReview(Review review);

	List<Review> selectListReview(String spaceNo, int limit, int offset);

	int selectReviewTotalContents(String spaceNo);

	Star selectStar(String spaceNo);

	List<Qna> selectQuestionList(String spaceNo, int limit, int offset);

	int selectQuestionTotalContents(String spaceNo);

	Space selectOneSpaceNo(String email);

	int updateReviewComment(Review review);

	List<Review> selectReviewComment(String spaceNo, int limit, int offset);

	int insertSpace(Space space);

	int insertOption(Option option);

	int insertSpaceTag(SpaceTag spaceTag);

	
	int insertWish(Wish wish);

	List<SpaceList> selectSameCategory(Space space);

	int selectLikeCnt(String spaceNo);

	int deleteWish(Wish wish);

	String selectCateName(String spaceNo);

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

	List<Category> selectCategoryList();

	List<OptionList> selectOptionList1();

	List<String> selectSpaceNoList(String keyword);

	Wish selectOneWish(Wish wish);

	//물어보기
	/* List<Space> selectSearchSpaceList(String searchSpace); */

	Attachment selectPopularImage(String spaceNo);

	List<SpaceList> selectSearchSpaceList(String searchSpace);

	List<String> selectSearchDetailSpaceNo(Map<String, String> map);

	int increaseSpaceReadCnt(String spaceNo);
	
	int minusLikeCnt(Wish wish);
	
	/* List<Space> selectListSpaceCollection(String email); */


}
