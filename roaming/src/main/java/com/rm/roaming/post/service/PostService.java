package com.rm.roaming.post.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import com.rm.roaming.dto.ScheduleDay;
import com.rm.roaming.dto.ScheduleDto;
import com.rm.roaming.dto.UserDto;
import com.rm.roaming.post.mapper.PostMapper;

@Service
public class PostService {

	@Autowired
	private PostMapper postMapper;
	
	public void insertPost(PostDto postDto, List<PostImageDto> postImageDtoList, JoinUserDto joinUserDto) {
		
		System.out.println("실행확인");
		int pkId = postMapper.createPk();
		postDto.setId(pkId);
		System.out.println(postDto.toString());
		postMapper.insertPost(postDto);
		
		// 파팉참여
		joinUserDto.setPost_id(pkId);
		postMapper.insertPartyJoin(joinUserDto);

		// 일차 인서트
		Date start = postDto.getDay_start();
		Date end = postDto.getDay_end();
		long difference = Math.abs(end.getTime() - start.getTime());
		long days = TimeUnit.DAYS.convert(difference, TimeUnit.MILLISECONDS);
		
		for(int i = 0; i < days; i++) {
			postMapper.insertNewDay(pkId);
		}
		
		
		if(postImageDtoList != null && !postImageDtoList.isEmpty()) {
			for(PostImageDto postImageDto : postImageDtoList) {
				postImageDto.setPost_id(pkId); 
				
				postMapper.insertPostImage(postImageDto);
				System.out.println(postImageDto.toString());
			}
		}
	}
	
	public void updatePost(PostDto postDto) {
		postMapper.updatePost(postDto);
		
	}
	
	
	public void insertJoinConfirm(JoinConfirmDto joinConfirmDto) {
		postMapper.insertJoinConfirm(joinConfirmDto);
	}
	
	public List<JoinConfirmDto> selectJoinConfirm(int create_id) {
		return postMapper.selectJoinConfirm(create_id);
	}
	
	
	public JoinConfirmDto selectJoinStatus(JoinConfirmDto joinConfirmDto) {
		return postMapper.selectJoinStatus();
	}
	
	public void updatePostStatus(JoinConfirmDto joinConfirmDto) {
		int post_id = joinConfirmDto.getPost_id();
		int user_id = joinConfirmDto.getUser_id();
		
		JoinUserDto joinUserDto = new JoinUserDto();
		joinUserDto.setPost_id(post_id);
		joinUserDto.setUser_id(user_id);
		
		
		if(joinConfirmDto.getStatus().equals("y")) {
			postMapper.updatePostStatus(joinConfirmDto);
			postMapper.insertPartyJoin(joinUserDto);
			System.out.println("Y실행");
			
		}else if(joinConfirmDto.getStatus().equals("n")) {
			postMapper.updatePostStatus(joinConfirmDto);
			// 거절 사유 구현
			System.out.println("N실행");
			
		}
	}
	
	
	
	
	public List<Map<String, Object>> getPostList() {
		List<Map<String, Object>> list = new ArrayList<>();
		List<PostDto> postDtoList = postMapper.getPostList();
		
		for(PostDto postDto : postDtoList) {
			Map<String, Object> map = new HashMap<>();
			int postId = postDto.getId();
			
			List<PostImageDto> postImageDtoList = postMapper.getPostImageByPostId(postId);
			
			Date start = postDto.getDay_start();
			Date end = postDto.getDay_end();
			long difference = Math.abs(end.getTime() - start.getTime());
			long days = TimeUnit.DAYS.convert(difference, TimeUnit.MILLISECONDS);
			
			map.put("days", days);
			map.put("postDto", postDto);
			map.put("postImageDto", postImageDtoList);
			map.put("count", postMapper.joinUserCount(postId));
			list.add(map);
		}
		
		return list;
	}
	
	public void viewsUpdate(int id) {
		
		System.out.println("qwrt)");
		
		postMapper.viewsUpdate(id);	
	}
	
	public PostDto getPostById(int id) {
		
		return postMapper.getPostById(id);
	}
	
	public UserDto getPostByCreateId(int create_id) {
		return postMapper.getPostByCreateId(create_id);
	}
	
	public List<PostImageDto> getPostImageByPostId(int postId) {
		return postMapper.getPostImageByPostId(postId);
	}
	
	public void insertReport(ReportDto reportDto) {
		postMapper.insertReport(reportDto);
	}
	
	public List<Map<String, Object>> getJoinUserByPostId(int id) {
		List<Map<String, Object>> list = new ArrayList<>();
		List<JoinUserDto> joinUserDtolist = postMapper.getJoinUserByPostId(id);
		
		for(JoinUserDto joinUserDto : joinUserDtolist) {
			Map<String, Object> map = new HashMap<>();
			UserDto userDto = postMapper.getUserById(joinUserDto.getUser_id());
			
			map.put("joinUserDto", joinUserDto);
			map.put("userDto", userDto);
			list.add(map);
			
		}
		return list;
	}
	
	public int joinUserCount(int id) {
		return postMapper.joinUserCount(id);
	}
	
	
	public void insertPostComment(CommentDto commentDto) {
		postMapper.insertPostComment(commentDto);
	}

	public void insertPostReComment(ReCommentDto reCommentDto) {
		postMapper.insertPostReComment(reCommentDto);
	}
	
	
	
	public List<Map<String, Object>> getPostComment(int postId) {
		List<Map<String, Object>> resultList = new ArrayList<>();
		List<CommentDto> commentDtoList = postMapper.getPostComment(postId);
		for(CommentDto commentDto : commentDtoList) {
			Map<String, Object> map1 = new HashMap<>();
			UserDto commentUserDto = postMapper.getUserById(commentDto.getUser_id());
			int comment_total = postMapper.getCommentLikeTotalCount(commentDto.getId());
			if(commentUserDto.getProfile_img() == null) {
				commentUserDto.setProfile_img("f3c96c43766c04eaa1b773eb38ef531e.jpg");
			}
			
			map1.put("comment_total", comment_total);
			map1.put("commentDto", commentDto);
			map1.put("commentUserDto", commentUserDto);
			List<ReCommentDto> reCommentDtoList = postMapper.getPostReComment(commentDto.getId());	
		
			List<Map<String, Object>> reCommentResultList = new ArrayList<>();
			for(ReCommentDto reCommentDto : reCommentDtoList) {
				Map<String, Object> map2 = new HashMap<>();
				UserDto reCommentUserDto = postMapper.getUserById(reCommentDto.getUser_id());
				UserDto reCommentReUserDto = postMapper.getUserById(reCommentDto.getRe_user_id());
				if(reCommentUserDto.getProfile_img() == null) {
					reCommentUserDto.setProfile_img("f3c96c43766c04eaa1b773eb38ef531e.jpg");
				}
				UserDto frontUserDto = postMapper.getUserById(reCommentDto.getRe_user_id());
				
				map2.put("frontUserDto", frontUserDto);
				map2.put("reCommentReUserDto", reCommentReUserDto);
				map2.put("reCommentDto", reCommentDto);
				map2.put("reCommentUserDto", reCommentUserDto);
				reCommentResultList.add(map2);			
			}
				map1.put("reCommentList", reCommentResultList);
				resultList.add(map1);
		}		
			
		return resultList;
	}
	
	
	public int getPostCommentTotalCount(int postId) {
		return postMapper.getPostCommentTotalCount(postId);
	}
	
	// 게시물 좋아요 추가
	public void insertLike(PostLikeDto postLikeDto) {
		
		if(postMapper.getLikeCount(postLikeDto) > 0) {
			postMapper.deleteLike(postLikeDto);
		}else {
			postMapper.insertLike(postLikeDto);
		}
	}
	
	// 게시물 좋아요 삭제
	public void deleteLike(PostLikeDto postLikeDto) {
		postMapper.deleteLike(postLikeDto);
	}
	
	// 게시물 좋아요 개수 가져오기
	public int getLikeCount(PostLikeDto postLikeDto) {
		return postMapper.getLikeCount(postLikeDto);
		
	}
	
	// 게시물 좋아요 총개수 가져오기
	public int getLikeTotalCount(int postId) {
		return postMapper.getLikeTotalCount(postId);
	}
	
	
	// 댓글 좋아요 추가
	public void insertCommentLike(CommentLikeDto commentLikeDto) {
		
		if(postMapper.getCommentLikeCount(commentLikeDto) > 0) {
			postMapper.deleteCommentLike(commentLikeDto);
		}else {
			postMapper.insertCommentLike(commentLikeDto);
		}
	}
	
	public void deleteCommentLike(CommentLikeDto commentLikeDto) {
		postMapper.deleteCommentLike(commentLikeDto);
	}
	
	public int getCommentLikeCount(CommentLikeDto commentLikeDto) {
		return postMapper.getCommentLikeCount(commentLikeDto);
		
	}
	
	public int getCommentLikeTotalCount(int commentId) {
		return postMapper.getCommentLikeTotalCount(commentId);
	}
	
	
	
	
	public List<Map<String, Object>> selectScheduleDay_id(int id) {
		List<Map<String, Object>> list = new ArrayList<>();
		List<DayDto> dayDtoList = postMapper.selectDayPostId(id);
		
		for(DayDto dayDto : dayDtoList) {
			Map<String, Object> map = new HashMap<>();
			List<ScheduleDto> scheduleDto = postMapper.selectScheduleDay_id(dayDto.getId());
			
			
			PostDto postDto = postMapper.getPostById(dayDto.getPost_id());
			
			map.put("postDto", postDto);
			map.put("dayDto", dayDto);
			map.put("scheduleDto", scheduleDto);
			list.add(map);
		}
		
		return list;
	}
	
	
	public void insertNewDay(int post_id) {
		postMapper.insertNewDay(post_id);
	}
	
	public List<DayDto> selectNewDay(int postId) {
		return postMapper.selectNewDay(postId);
	}
	
	public void deleteDayId(int id) {
		postMapper.deleteDayId(id);
	}
	
	public void insertSchedule(ScheduleDto scheduleDto) {
		postMapper.insertSchedule(scheduleDto);
	}
	
	public List<DayDto> selectDayPostId(int id) {
		return postMapper.selectDayPostId(id);
	}
	
	
	public void updateSchedule(ScheduleDto scheduleDto) {
		postMapper.updateSchedule(scheduleDto);
	}
	
	public void deleteSchedule(int id) {
		postMapper.deleteSchedule(id);
	}
	
	
	//황준 테스트
	public void registerPostSchedule(String[] placeName,String[] placeAddress, String[] estimated, String[] memo,int dayNumber) {
		for(int i=0; i<placeName.length; i++) {
			HwangDto hwangDto = new HwangDto();
			hwangDto.setDay_id(dayNumber);
			hwangDto.setEstimated_time(estimated[i]);
			hwangDto.setOrder_no(i+1);
			hwangDto.setPlace_location(placeAddress[i]);
			hwangDto.setPlace_title(placeName[i]);
			hwangDto.setTrip_memo(memo[i]);
			postMapper.insertPostSchedule(hwangDto);
		}
	}
	
	//황준하 여행일정 개수 같으면 페이지이동
	public Boolean getFinishYesOrNo(int post_id) {
		if(postMapper.selectPostScheduleCountByPostId(post_id) == postMapper.selectPostDayCountByPostId(post_id)) {
			return true;
		}else
			return false;
		
	}
	
	//황준 테스트 requestbody
	public void registerAllPostSchedule(List<ScheduleDay> list) {
		for(int i=0; i<list.size(); i++) {
			HwangDto hwangDto = new HwangDto();
			hwangDto.setDay_id(list.get(i).getDay());
			for(int j=0; j<list.get(i).getSchedule().size();  j++) {
				hwangDto.setPlace_location(list.get(i).getSchedule().get(j).getPlaceAddress());
				hwangDto.setPlace_title(list.get(i).getSchedule().get(j).getPlaceName());
				hwangDto.setTrip_memo(list.get(i).getSchedule().get(j).getMemo());
				hwangDto.setOrder_no(j+1);
				hwangDto.setEstimated_time(list.get(i).getSchedule().get(j).getEstimatedTime());
				postMapper.insertPostSchedule(hwangDto);
			}
		}
	}
}
