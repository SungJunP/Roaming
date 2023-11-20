package com.rm.roaming.facebook.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rm.roaming.dto.FeedCommentDto;
import com.rm.roaming.dto.FeedDto;
import com.rm.roaming.dto.FeedImageDto;
import com.rm.roaming.dto.FeedLikesDto;
import com.rm.roaming.dto.FollowDto;
import com.rm.roaming.dto.ReelsDto;
import com.rm.roaming.dto.UserDto;
import com.rm.roaming.facebook.mapper.FacebookSqlMapper;

@Service
public class FacebookServiceImpl {
	
	@Autowired
	private FacebookSqlMapper facebookSqlMapper;
	
	public List<Map<String, Object>> selectHomeImages(int feedId) {
		List<Map<String, Object>> list = new ArrayList<>();
		List<FeedImageDto> feedImageDtoList = facebookSqlMapper.selectHomeImages(feedId);
		for(FeedImageDto feedImageDto : feedImageDtoList) {
			Map<String, Object> map = new HashMap<>();
			map.put("feedImageDto", feedImageDto);
			list.add(map);
		}
		return list;
	}
	public void makeFeedRegistration(FeedDto feedDto, List<FeedImageDto> feedImageDtoList) {
		int feedId = facebookSqlMapper.createPk();
		feedDto.setId(feedId);
		facebookSqlMapper.insertFeed(feedDto);
		for(FeedImageDto feedImageDto : feedImageDtoList) {
			feedImageDto.setFeed_id(feedId);
			facebookSqlMapper.insertFeedImage(feedImageDto);
		}
	}
	public List<Map<String, Object>> selectFeedMain() {
		List<Map<String, Object>> list = new ArrayList<>();
		List<FeedImageDto> feedImageDtoList = facebookSqlMapper.selectFeedMainImage();
		for(FeedImageDto feedImageDto : feedImageDtoList) {
			Map<String, Object> map = new HashMap<>();
			int feedId = feedImageDto.getFeed_id();
			FeedDto feedDto = facebookSqlMapper.selectFeedMainTitle(feedId);
			int count = facebookSqlMapper.feedLikesAll(feedId);
			map.put("feedImageDto", feedImageDto);
			map.put("feedDto", feedDto);
			map.put("count", count);
			list.add(map);
		}
		return list;
	}
	public Map<String, Object> selectFeedDetail(int id) {
			Map<String, Object> map = new HashMap<>();
			FeedImageDto feedImageDto = facebookSqlMapper.selectFeedDetailMain(id);
			FeedDto feedDto = facebookSqlMapper.selectFeedDetailContent(id);
			String enterContent = feedDto.getFeed_content().replaceAll("\n", "<br>");
			feedDto.setFeed_content(enterContent);
			UserDto userDto = facebookSqlMapper.selectFeedDetailInfo(id);
			map.put("feedImageDto", feedImageDto);
			map.put("feedDto", feedDto);
			map.put("userDto", userDto);
		return map;
	}
	public List<Map<String, Object>> selectFeedImageAll(int id) {
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<FeedImageDto> feedImageDtoList = facebookSqlMapper.selectFeedImgAll(id);
		for(FeedImageDto feedImageDto : feedImageDtoList) {
			Map<String, Object> map = new HashMap<>();
			
			map.put("feedImageDto", feedImageDto);
			list.add(map);
		}
		return list;
	}
	public void insertFeedComment(FeedCommentDto feedCommentDto) {
		facebookSqlMapper.selectFeedUserId(0);
		facebookSqlMapper.insertFeedComment(feedCommentDto);
	}
	public List<Map<String, Object>> selectFeedComment(int id) {
		List<Map<String, Object>> list = new ArrayList<>();
		List<FeedCommentDto> feedCommentDtoList = facebookSqlMapper.selectFeedComment(id);
		for(FeedCommentDto feedCommentDto : feedCommentDtoList) {
			Map<String, Object> mapo = new HashMap<>();
			mapo.put("feedCommentDto", feedCommentDto);
			list.add(mapo);
		}
		return list;
	}
	public List<Map<String, Object>> selectFeedUsers(int id) {
		List<Map<String, Object>> list = new ArrayList<>();
		List<UserDto> userDtoList = facebookSqlMapper.selectFeedCommentUser(id);
		for(UserDto userDto : userDtoList) {
			Map<String, Object> mapo = new HashMap<>();
			mapo.put("userDto", userDto);
			list.add(mapo);
		}
		return list;
	}
	public void insertLikes(FeedLikesDto feedLikesDto) {
		int id = feedLikesDto.getUser_id();
		if(facebookSqlMapper.feedLikesGo(id) == null) {
			facebookSqlMapper.insertFeedLikes(feedLikesDto);
		} else if(facebookSqlMapper.feedLikesCount(id) == 1){
			facebookSqlMapper.feedLikesDown(id);
		} else if(facebookSqlMapper.feedLikesCount(id) == 0) {
			facebookSqlMapper.feedLikesUp(id);
		}
	}
	public int feedLikesShow() {
		return facebookSqlMapper.feedLikesShow();
	}
	public void insertHates(FeedLikesDto feedLikesDto) {
		int id = feedLikesDto.getUser_id();
		if(facebookSqlMapper.feedHatesGo(id) == null) {
			facebookSqlMapper.insertFeedHates(feedLikesDto);
		} else if(facebookSqlMapper.feedHatesCount(id) == 1) {
			facebookSqlMapper.feedHatesDown(id);
		} else if(facebookSqlMapper.feedHatesCount(id) == 0) {
			facebookSqlMapper.feedHatesUp(id);
		}
	}
	public int feedHatesShow() {
		return facebookSqlMapper.feedHatesShow();
	}
	public int feedLikesAll(int id) {
		return facebookSqlMapper.feedLikesAll(id);
	}
	public void makeReelsRegistration(ReelsDto reelsDto) {
		facebookSqlMapper.insertReels(reelsDto);
	}
	public List<Map<String, Object>> selectReels(ReelsDto reelsDto) {
		List<Map<String, Object>> list = new ArrayList<>();
		List<ReelsDto> reelsDtoList = facebookSqlMapper.selectReels(reelsDto);

		for(ReelsDto reels : reelsDtoList) {
			Map<String, Object> map = new HashMap<>();
			int userId = reels.getUser_id();
			int reelsId = reels.getId();
			UserDto userDto = facebookSqlMapper.selectReelsUserInfo(userId);
			map.put("reelsDto", reels);
			map.put("userDto", userDto);
			map.put("datef", facebookSqlMapper.selectReelsDate(reelsId));
			list.add(map);
		}
		return list;
	}
	public void updateUserImg(UserDto userDto) {
		facebookSqlMapper.updateUserImg(userDto);
	}
	public Map<String, Object> selectUserImgDefault(int userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("userDto", facebookSqlMapper.selectUserImgDefault(userId));
		return map;
	}
	public Map<String, Object> selectUserImage(int userId) {
		Map<String, Object> map = new HashMap<>();
		UserDto userDto = new UserDto();
		userDto.setId(userId);
		map.put("userDto", facebookSqlMapper.selectUserImgDefault(userId));
		return map;
	}
	public int selectMyFeedCount(int userId) {
		return facebookSqlMapper.selectMyFeedCount(userId);
	}
	public List<Map<String, Object>> selectMyFeed(int userId) {
		List<Map<String, Object>> list = new ArrayList<>();
		List<FeedImageDto> feedImageDtoList = facebookSqlMapper.selectMyFeed(userId);
		List<FeedDto> feedDto = facebookSqlMapper.selectMyFeedId(userId);
		for(FeedImageDto feedImageDto : feedImageDtoList) {
			Map<String, Object> map = new HashMap<>();
			map.put("feedImageDto", feedImageDto);
			map.put("feedDto", feedDto);
			list.add(map);
		}
		return list;
	}
	public String selectFeedDate(int feedId) {
		return facebookSqlMapper.selectFeedDate(feedId);
	}
	//js 시작을 알린다.
	public void toggleLike(FeedLikesDto feedLikesDto) {
		if(facebookSqlMapper.countMyLike(feedLikesDto) > 0) {
			facebookSqlMapper.deleteLike(feedLikesDto);
		} else if(facebookSqlMapper.countMyHate(feedLikesDto) > 0) {
			facebookSqlMapper.insertFeedLike(feedLikesDto);
			facebookSqlMapper.deleteHate(feedLikesDto);
		} else {
			facebookSqlMapper.insertFeedLike(feedLikesDto);
		}
	}
	//여러 개의 코드를 하나로 합쳐보자
	public void toggleHate(FeedLikesDto feedLikesDto) {
		if(facebookSqlMapper.countMyHate(feedLikesDto) > 0) {
			facebookSqlMapper.deleteHate(feedLikesDto);
		} else if(facebookSqlMapper.countMyLike(feedLikesDto) > 0) {
			facebookSqlMapper.insertFeedHate(feedLikesDto);
			facebookSqlMapper.deleteLike(feedLikesDto);
		}
		else {
			facebookSqlMapper.insertFeedHate(feedLikesDto);
		}
	}
	public boolean isLiked(FeedLikesDto feedLikesDto) {
		if(facebookSqlMapper.countMyTotal(feedLikesDto) > 0) {
			return true;
		}
		else {
			return false;
		}
	}
	public boolean isHated(FeedLikesDto feedLikesDto) {
		if(facebookSqlMapper.countMyTotal(feedLikesDto) > 0) {
			return true;
		} else {
			return false;
		}
	}
	public int getTotalLike(int feedId) {
		return facebookSqlMapper.countLikeByUserId(feedId);
	}
	public int getTotalHate(int feedId) {
		return facebookSqlMapper.countHateByUserId(feedId);
	}
	public void registerComment(FeedCommentDto feedCommentDto) {
		facebookSqlMapper.insertComment(feedCommentDto);
	}
	public void deleteComment(int id) {
		facebookSqlMapper.deleteComment(id);
	}
	public void updateComment(FeedCommentDto feedCommentDto) {
		facebookSqlMapper.updateComment(feedCommentDto);
	}
	public List<Map<String, Object>> getCommentList(int feedId) {
		List<Map<String, Object>> list = new ArrayList<>();
		List<FeedCommentDto> feedCommentDtoList = facebookSqlMapper.selectCommentAll(feedId);
		for(FeedCommentDto feedCommentDto : feedCommentDtoList) {
			Map<String, Object> map = new HashMap<>();
			UserDto userDto = facebookSqlMapper.selectById(feedCommentDto.getUser_comment_id());
			map.put("feedCommentDto", feedCommentDto);
			map.put("userDto", userDto);
			list.add(map);
		}
		return list;
	}
	public List<Map<String, Object>> getReelsList() {
		List<Map<String, Object>> list = new ArrayList<>();
		List<ReelsDto> reelsDtoList = facebookSqlMapper.getReelsList();
		for(ReelsDto reelsDto : reelsDtoList) {
			Map<String, Object> map = new HashMap<>();
			int userId = reelsDto.getUser_id();
			int reelsId = reelsDto.getId();
			UserDto userDto = facebookSqlMapper.selectReelsUserInfo(userId);
			map.put("reelsDto", reelsDto);
			map.put("userDto", userDto);
			map.put("datef", facebookSqlMapper.selectReelsDate(reelsId));
			list.add(map);
		}
		return list;
	}
	public void insertFollow(FollowDto followDto) {
		facebookSqlMapper.insertFollow(followDto);
		
	}
	public int selectFollow(int userId) {
		return facebookSqlMapper.selectFollow(userId);
	}
	public int selectFollower(int userId) {
		return facebookSqlMapper.selectFollower(userId);
	}
}