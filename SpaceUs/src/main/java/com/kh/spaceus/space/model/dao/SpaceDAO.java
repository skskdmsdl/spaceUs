package com.kh.spaceus.space.model.dao;

import java.util.List;

import com.kh.spaceus.space.model.vo.Review;
import com.kh.spaceus.space.model.vo.ReviewAttachment;
import com.kh.spaceus.space.model.vo.Space;
import com.kh.spaceus.space.model.vo.Tag;

public interface SpaceDAO {

	Tag selectOneTag(String hashTag);

	int insertHashTag(String hashTag);

	Space selectOneSpace(String spaceNo);

	Space selectOneSpace(int businessNo);

	List<Tag> selectListSpaceTag(String spaceNo);

	int insertReview(Review review);

	int insertReviewAttahment(ReviewAttachment attach);

	List<Review> selectListReview(String spaceNo);

	/* List<Space> selectListSpaceCollection(String email); */


}
