package com.rm.roaming.post.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rm.roaming.dto.CommentDto;
import com.rm.roaming.dto.CommentLikeDto;
import com.rm.roaming.dto.JoinConfirmDto;
import com.rm.roaming.dto.PostLikeDto;
import com.rm.roaming.dto.ReCommentDto;
import com.rm.roaming.dto.UserDto;
import com.rm.roaming.post.service.PostService;

@RestController
@RequestMapping("/post/*")
public class RestPostController {

	@Autowired
	private PostService postService;
	
	
	
	
	@RequestMapping("getMyId")
	public Map<String, Object> getMyId(HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser != null) {
			map.put("result", "success");
			map.put("id", sessionUser.getId());
		}else {
			map.put("result", "fail");
			map.put("reason", "로그인이 되어있지 않습니다.");
		}
		
		return map;
	}
	
	@RequestMapping("insertPostComment")
	public Map<String, Object> insertPostComment(HttpSession session, CommentDto commentDto) {
		// 게시글 댓글 구현
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		System.out.println(commentDto.getPost_id());
		commentDto.setUser_id(sessionUser.getId());
		System.out.println(commentDto.getUser_id());
		
		Map<String, Object> map = new HashMap<>();
		if(commentDto.getPost_comment() != null) {
			postService.insertPostComment(commentDto);
			map.put("result", "success");
			
		}else {
			map.put("result", "fail");
			map.put("reason", "댓글달기 실패");
		}
		
		return map;
	}
	
	// 대댓글 insert
		@RequestMapping("insertRePostComment")
		public Map<String, Object> insertRePostComment(HttpSession session, ReCommentDto reCommentDto) {
			UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
			reCommentDto.setUser_id(sessionUser.getId());
			Map<String, Object> map = new HashMap<>();		
			
			map.put("result", "success");
			postService.insertPostReComment(reCommentDto);
			
			return map;
		}
	
		@RequestMapping("insertReRePostComment")
		public Map<String, Object> insertReRePostComment(HttpSession session, ReCommentDto reCommentDto) {
			UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
			reCommentDto.setUser_id(sessionUser.getId());
			Map<String, Object> map = new HashMap<>();		
			
			map.put("result", "success");
			postService.insertPostReComment(reCommentDto);
			
			return map;
		}
	
	
	
//		동행 댓글 구현
	
	// 댓글 가져오기
	@RequestMapping("getPostComment")
	public Map<String, Object> getPostComment(int postId) {
		Map<String, Object> map = new HashMap<>();		
		
		map.put("result", "success");
		map.put("commentList", postService.getPostComment(postId));
		
		return map;
	}
	
	
	@RequestMapping("commentTotalCount")
	public Map<String, Object> commentTotalCount(int postId) {
		Map<String, Object> map = new HashMap<>();
		
		
		map.put("result", "success");
		map.put("comment_total", postService.getPostCommentTotalCount(postId));
		return map;
	}
	
	
	
		// 일정 구현, 추가버튼, 삭제버튼
	
		// 동행 꽉차면 모달
	
	
	
	
//	게시물 좋아요
	// 하트 클릭
	@RequestMapping("likeClick")
	public Map<String, Object> likeClick(HttpSession session, PostLikeDto postLikeDto) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		postLikeDto.setUser_id(sessionUser.getId());
		postService.insertLike(postLikeDto);
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		
		return map;
	}
	
	// 내 좋아요 가져오기
	@RequestMapping("myCheckLike")
	public Map<String, Object> myCheckLike(HttpSession session, PostLikeDto postLikeDto) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		postLikeDto.setUser_id(sessionUser.getId());
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		map.put("liked", postService.getLikeCount(postLikeDto));
		return map;
	}
	
	// 게시물 좋아요 총개수
	@RequestMapping("likedTotalCount")
	public Map<String, Object> likedTotalCount(int postId) {
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		map.put("totalCount", postService.getLikeTotalCount(postId));
		return map;
	}
	
	// 댓글 출력
	@RequestMapping("getPostCommentList")
	public Map<String, Object> getPostCommentList(int id) {
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		map.put("commentList", postService.getPostComment(id));
		 return map;
	}
		
	
	
	
//	댓글 좋아요
	// 하트 클릭
	@RequestMapping("commentLikeClick")
	public Map<String, Object> commentLikeClick(HttpSession session, CommentLikeDto commentLikeDto) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		commentLikeDto.setUser_id(sessionUser.getId());
		postService.insertCommentLike(commentLikeDto);
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		
		return map;
	}
	
	// 내 좋아요 가져오기
	@RequestMapping("commentMyCheckLike")
	public Map<String, Object> commentMyCheckLike(HttpSession session, CommentLikeDto commentLikeDto) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		commentLikeDto.setUser_id(sessionUser.getId());
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		map.put("liked", postService.getCommentLikeCount(commentLikeDto));
		return map;
	}
	
	// 게시물 댓글 좋아요 총개수
	@RequestMapping("commentLikedTotalCount")
	public Map<String, Object> commentLikedTotalCount(int commentId) {
		// 삭제
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		map.put("totalCount", postService.getCommentLikeTotalCount(commentId));
		return map;
	}
	
	
	
	// 일차 리스트
	@RequestMapping("getDayList")
	public Map<String, Object> getDayList(int postId) {
		Map<String, Object> map = new HashMap<>();		
		
		map.put("result", "success");
		map.put("dayList", postService.selectNewDay(postId));
		map.put("postDto", postService.getPostById(postId));
		return map;
	}
	
	@RequestMapping("deleteDay")
	public Map<String, Object> deleteDay(int id) {
		Map<String, Object> map = new HashMap<>();
		postService.deleteDayId(id);
		map.put("result", "success");
		
		return map;
	}
	
	
	@RequestMapping("getSchedule")
	public Map<String, Object> getSchedule(int id) {
		Map<String, Object> map = new HashMap<>();
		postService.selectScheduleDay_id(id);
		map.put("result", "success");
		
		return map;
	}
	
	
	// 동행참가 버튼 status
	@RequestMapping("getPostJoinStatus")
	public Map<String, Object> getPostJoinStatus(HttpSession session, JoinConfirmDto joinConfirmDto) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		joinConfirmDto.setUser_id(sessionUser.getId());
		
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		map.put("data", postService.selectJoinStatus(joinConfirmDto));
		return map;
	}

	
	
	
	
	
}
