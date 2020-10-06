package com.kh.spaceus.space.model.service;

import java.util.List;

import com.kh.spaceus.qna.model.vo.Qna;
import com.kh.spaceus.space.model.vo.Review;
import com.kh.spaceus.space.model.vo.Space;
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

	Star selectStar();

	List<Qna> selectQuestionList(String spaceNo, int limit, int offset);

	int selectQuestionTotalContents(String spaceNo);

	Space selectOneSpaceNo(String email);

	int updateReviewComment(Review review);

	List<Review> selectReviewComment(String spaceNo, int limit, int offset);

	void insertWish(Wish wish);

	List<Space> selectSameCategory(String category);

	int selectLikeCnt(String spaceNo);

	void deleteWish(Wish wish);

	/* List<Space> selectListSpaceCollection(String email); */


}
