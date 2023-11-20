package com.rm.roaming.post.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rm.roaming.dto.CommentDto;
import com.rm.roaming.dto.CommentLikeDto;
import com.rm.roaming.dto.DayDto;
import com.rm.roaming.dto.HwangDto;
import com.rm.roaming.dto.JoinConfirmDto;
import com.rm.roaming.dto.JoinUserDto;
import com.rm.roaming.dto.PostDto;
import com.rm.roaming.dto.PostImageDto;
import com.rm.roaming.dto.PostLikeDto;
import com.rm.roaming.dto.ReCommentDto;
import com.rm.roaming.dto.ReportDto;
import com.rm.roaming.dto.ScheduleDto;
import com.rm.roaming.dto.UserDto;

public interface PostMapper {

	// pk id 생성
	public int createPk();
	// 여행 게시글 등록
	public void insertPost(PostDto postDto);
	// 여행 게시글 수정
	public void updatePost(PostDto postDto);
	// 여행 게시글 리스트 가져오기
	public List<PostDto> getPostList();
	// 여행 게시글 Id로 가져오기
	public PostDto getPostById(int id);
	// 여행 게시글 작성자 정보 가져오기
	public UserDto getPostByCreateId(int create_id);
	// 파티참가
	public void insertPartyJoin(JoinUserDto joinUserDto);
	// 조회수 증가
	public void viewsUpdate(int id);
	// 참가신청
	public void insertJoinConfirm(JoinConfirmDto joinConfirmDto);
	// 참가신청 리스트
	public List<JoinConfirmDto> selectJoinConfirm(int create_id);
	// 참가신청 status 업데이트
	public void updatePostStatus(JoinConfirmDto joinConfirmDto);
	// 게시물 신고하기
	public void insertReport(ReportDto reportDto);
	// 유저 정보 가져오기
	public UserDto getUserById(int userId);
	// 파티참가 유저 리스트
	public List<JoinUserDto> getJoinUserByPostId(int id);
	// 파티참가 인원 수
	public int joinUserCount(int id);
	
	// 동행참가 status 
	public JoinConfirmDto selectJoinStatus();
		

	// 여행 게시글 이미지 등록
	public void insertPostImage(PostImageDto postImageDto);
	// 여행 게시글 이미지 리스트 가져오기
	public List<PostImageDto> getPostImageByPostId(int postId);
	
	// 게시물 댓글 등록
	public void insertPostComment(CommentDto commentDto);
	// 게시물 대댓글 등록
	public void insertPostReComment(ReCommentDto reCommentDto);
	// 게시물 댓글 가져오기
	public List<CommentDto> getPostComment(int postId);
	// 게시물 리댓글 가져오기
	public List<ReCommentDto> getPostReComment(int commentId);
	// 게시물 댓글 총합
	public int getPostCommentTotalCount(int postId);
	
	// 게시물 좋아요 추가
	public void insertLike(PostLikeDto postLikeDto);
	// 게시물 좋아요 삭제
	public void deleteLike(PostLikeDto postLikeDto);
	// 게시물 좋아요 개수 가져오기
	public int getLikeCount(PostLikeDto postLikeDto);
	// 게시물 좋아요 총개수 가져오기
	public int getLikeTotalCount(int postId);
	// 댓글 좋아요 추가
	public void insertCommentLike(CommentLikeDto commentLikeDto);
	// 댓글 좋아요 삭제
	public void deleteCommentLike(CommentLikeDto commentLikeDto);
	// 댓글 좋아요 개수 가져오기
	public int getCommentLikeCount(CommentLikeDto commentLikeDto);
	// 댓글 좋아요 총개수 가져오기
	public int getCommentLikeTotalCount(int commentId);
	
	// 일차 추가
	public void insertNewDay(int post_id);
	// 일차 가져오기
	public List<DayDto> selectNewDay(int postId);
	// 일차 삭제
	public void deleteDayId(int id);
	// 게시물 스케줄 인서트
	public void insertSchedule(ScheduleDto scheduleDto);
	// 게시물 스케줄 가져오기
	public List<ScheduleDto> selectScheduleDay_id(int day_id);

	// 일차 스케줄 조인 가져오기
	public List<DayDto> selectDayPostId(int id);
	
	// 스케줄 수정
	public void updateSchedule(ScheduleDto scheduleDto);
	// 스케줄 삭제
	public void deleteSchedule(int id);
	
	
	//황준 테스트
	public void insertPostSchedule(HwangDto hwangDto);
	public int selectPostDayCountByPostId(int post_id);
	public int selectPostScheduleCountByPostId(int post_id);
}
