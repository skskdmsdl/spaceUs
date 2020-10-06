package com.kh.spaceus.space.model.dao;

import java.util.List;

import com.kh.spaceus.qna.model.vo.Qna;
import com.kh.spaceus.space.model.vo.Attachment;
import com.kh.spaceus.space.model.vo.Option;
import com.kh.spaceus.space.model.vo.Review;
import com.kh.spaceus.space.model.vo.ReviewAttachment;
import com.kh.spaceus.space.model.vo.Space;
import com.kh.spaceus.space.model.vo.Star;
import com.kh.spaceus.space.model.vo.Tag;

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

	Star selectStar();

	List<Qna> selectQuestionList(String spaceNo, int limit, int offset);

	int selectQuestionTotalContents(String spaceNo);

	Space selectOneSpaceNo(String email);

	int updateReviewComment(Review review);

	List<Review> selectReviewComment(String spaceNo, int limit, int offset);

	int insertSpace(Space space);

	int insertAttachment(Attachment attach);

	int insertOption(Option option);


	/* List<Space> selectListSpaceCollection(String email); */


}
