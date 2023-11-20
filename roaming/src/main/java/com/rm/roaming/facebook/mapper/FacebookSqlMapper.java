package com.rm.roaming.facebook.mapper;

import java.util.List;

import com.rm.roaming.dto.FeedCommentDto;
import com.rm.roaming.dto.FeedDto;
import com.rm.roaming.dto.FeedImageDto;
import com.rm.roaming.dto.FeedLikesDto;
import com.rm.roaming.dto.FollowDto;
import com.rm.roaming.dto.ReelsDto;
import com.rm.roaming.dto.UserDto;

public interface FacebookSqlMapper {
	//home
	public List<FeedImageDto> selectHomeImages(int feedId);
	//feed 등록
	public int createPk();
	public void insertFeed(FeedDto feedDto);
	public void insertFeedImage(FeedImageDto feedImageDto);
	//피드 메인 페이지 뽑기
	public List<FeedImageDto> selectFeedMainImage();
	public FeedDto selectFeedMainTitle(int feedId);
	public String selectFeedDate(int feedId);
	public String selectReelsDate(int reelsId);
	//상세 피드 페이지
	public FeedImageDto selectFeedDetailMain(int id);
	public List<FeedImageDto> selectFeedImgAll(int id);
	public FeedDto selectFeedDetailContent(int id);
	public UserDto selectFeedDetailInfo(int id);
	//피드 댓글 삽입
	public void insertFeedComment(FeedCommentDto feedCommentDto);
	public List<FeedCommentDto> selectFeedComment(int id);
	public List<UserDto> selectFeedCommentUser(int id);
	public FeedDto selectFeedUserId(int id);
	//피드 좋아요 삽입
	public void insertFeedLikes(FeedLikesDto feedLikesDto);
	public void feedLikesUp(int id);
	public void feedLikesDown(int id);
	public FeedLikesDto feedLikesGo(int id);
	public int feedLikesCount(int id);
	public int feedLikesShow();
	//피드 싫어요 삽입
	public void insertFeedHates(FeedLikesDto feedLikesDto);
	public void feedHatesDown(int id);
	public void feedHatesUp(int id);
	public FeedLikesDto feedHatesGo(int id);
	public int feedHatesCount(int id);
	public int feedHatesShow();
	//피드 메인에서 좋아요 각각 보여주기
	public int feedLikesAll(int id);
	//릴스 등록
	public void insertReels(ReelsDto reelsDto);
	public List<ReelsDto> selectReels(ReelsDto reelsDto);
	public UserDto selectReelsUser(int userId);
	public UserDto selectReelsUserInfo(int userId);
	//유저 프로필 사진
	public void updateUserImg(UserDto userDto);
	public UserDto selectUserImgDefault(int userId);
	public int selectMyFeedCount(int userId);
	public List<FeedImageDto> selectMyFeed(int userId);
	public List<FeedDto> selectMyFeedId(int userId);
	//마이페이지
	public List<UserDto> selectProfile(int userId);
	//js 시작 좋아요 싫어요 댓글 쿼리
	public void insertFeedLike(FeedLikesDto feedLikesDto);
	public void deleteLike(FeedLikesDto feedLikesDto);
	public int countMyLike(FeedLikesDto feedLikesDto);
	public int countLikeByUserId(int feedId);
	public void insertComment(FeedCommentDto feedCommentDto);
	public void deleteComment(int id);
	public void updateComment(FeedCommentDto feedCommentDto);
	public UserDto selectById(int id);
	public List<FeedCommentDto> selectCommentAll(int feedId);
	public int countMyTotal(FeedLikesDto feedLikesDto);
	public int countLikeByUserIdReels(int reelsId);
	public int countMyHate(FeedLikesDto feedLikesDto);
	public void deleteHate(FeedLikesDto feedLikesDto);
	public void insertFeedHate(FeedLikesDto feedLikesDto);
	public int countHateByUserId(int feedId);
	//릴스 리스트 아작스로 뽑기
	public List<ReelsDto> getReelsList();
	public void insertFollow(FollowDto followDto);
	
	//팔로우 팔로워
	public int selectFollow(int userId);
	public int selectFollower(int userId);
}