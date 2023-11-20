package com.rm.roaming.facebook.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rm.roaming.dto.FeedCommentDto;
import com.rm.roaming.dto.FeedLikesDto;
import com.rm.roaming.dto.FollowDto;
import com.rm.roaming.dto.UserDto;
import com.rm.roaming.facebook.service.FacebookServiceImpl;

@RestController
@RequestMapping("/facebook/*")
public class RestFacebookController {
	@Autowired
	private FacebookServiceImpl facebookService;
	
	@RequestMapping("toggleLike")
	public Map<String, Object> toggleLike(HttpSession session, FeedLikesDto feedLikesDto) {
		Map<String, Object> map = new HashMap<>();
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		feedLikesDto.setUser_id(sessionUser.getId());
		facebookService.toggleLike(feedLikesDto);
		map.put("result", sessionUser);
		return map;
	}
	@RequestMapping("toggleHate")
	public Map<String, Object> toggleHate(HttpSession session, FeedLikesDto feedLikesDto) {
		Map<String, Object> map = new HashMap<>();
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		feedLikesDto.setUser_id(sessionUser.getId());
		facebookService.toggleHate(feedLikesDto);
		map.put("result", sessionUser);
		return map;
	}
	@RequestMapping("isLiked")
	public Map<String, Object> isLiked(HttpSession session, FeedLikesDto feedLikesDto) {
		Map<String, Object> map = new HashMap<>();
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "로그인 되어 있지 않음..");
			return map;
		}
		feedLikesDto.setUser_id(sessionUser.getId());
		map.put("result", "success");
		map.put("isLike", facebookService.isLiked(feedLikesDto));
		map.put("isHate", facebookService.isHated(feedLikesDto));
		return map;
	}
	@RequestMapping("isHated")
	public Map<String, Object> isHated(HttpSession session, FeedLikesDto feedLikesDto) {
		Map<String, Object> map = new HashMap<>();
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "로그인 되어 있지 않음..");
			return map;
		}
		feedLikesDto.setUser_id(sessionUser.getId());
		map.put("result", "success");
		map.put("isHate", facebookService.isHated(feedLikesDto));
		map.put("isLike", facebookService.isLiked(feedLikesDto));
		return map;
	}
	@RequestMapping("getTotalLikeCount")
	public Map<String, Object> getTotalLikeCount(int feedId) {
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		map.put("count", facebookService.getTotalLike(feedId));
		map.put("counth", facebookService.getTotalHate(feedId));
		return map;
	}

	@RequestMapping("registerComment")
	public Map<String, Object> registerComment(HttpSession session, FeedCommentDto feedCommentDto) {
		Map<String, Object> map = new HashMap<>();
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		feedCommentDto.setUser_comment_id(sessionUser.getId());
		feedCommentDto.setUser_id(sessionUser.getId());
		facebookService.registerComment(feedCommentDto);
		map.put("result", "success");
		return map;
	}
	@RequestMapping("deleteComment")
	public Map<String, Object> deleteComment(int id) {
		Map<String, Object> map = new HashMap<>();
		facebookService.deleteComment(id);
		map.put("result", "success");
		return map;
	}
	@RequestMapping("updateComment")
	public Map<String, Object> updateComment(FeedCommentDto feedCommentDto) {
		Map<String, Object> map = new HashMap<>();
		facebookService.updateComment(feedCommentDto);
		map.put("result", "success");
		return map;
	}
	@RequestMapping("getCommentList")
	public Map<String, Object> getCommentList(int feedId) {
		Map<String, Object> map = new HashMap<>();
		map.put("feedCommentDto", facebookService.getCommentList(feedId));
		map.put("result", "success");
		return map;
	}
	@RequestMapping("getReelsList")
	public Map<String, Object> getReelsList() {
		Map<String, Object> map = new HashMap<>();
		map.put("list", facebookService.getReelsList());
		map.put("result", "success");
		return map;
	}
	@RequestMapping("getMyPageInfo")
	public Map<String, Object> getMyPageInfo(HttpSession session) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		Map<String, Object> map = new HashMap<>();
		map.put("map", facebookService.selectUserImgDefault(sessionUser.getId()));
		map.put("list", facebookService.selectMyFeed(sessionUser.getId()));
		map.put("count", facebookService.selectMyFeedCount(sessionUser.getId()));
		return map;
	}
	@RequestMapping("getBoardList")
	public Map<String, Object> getBoardList(HttpSession session) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		Map<String, Object> map = new HashMap<>();
		map.put("list", facebookService.selectMyFeed(sessionUser.getId()));
		return map;
	}
	@RequestMapping("getMyBoardList")
	public Map<String, Object> getMyBoardList(HttpSession session, int userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("list", facebookService.selectMyFeed(userId));
		return map;
	}
	@RequestMapping("followProcess")
	public Map<String, Object> followProcess(FollowDto followDto) {
		System.out.println(followDto.getReceive_id());
		System.out.println(followDto.getSend_id());
		facebookService.insertFollow(followDto);
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		return map;
	}
}
