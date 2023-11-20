package com.rm.roaming.usercsboard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rm.roaming.dto.AdminDto;
import com.rm.roaming.dto.QaBoardDto;
import com.rm.roaming.dto.QaBoardImageDto;
import com.rm.roaming.dto.QaCategoryDto;
import com.rm.roaming.dto.QaRecommendDto;
import com.rm.roaming.dto.UserDto;
import com.rm.roaming.user.mapper.UserSqlMapper;
import com.rm.roaming.usercsboard.mapper.UserCsSqlMapper;

@Service
public class UserCsServiceImpl {
	
	@Autowired
	private UserSqlMapper userSqlMapper;

	@Autowired
	private UserCsSqlMapper userCsSqlMapper;
	
	// page범위 QA게시글목록 조회
	public List<Map<String, Object>> getQaBoardList(int page, String searchType, String searchWord) {

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		// page 범위 QA게시글 조회해서 List에 담기
		List<QaBoardDto> qaBoardDtoList = userCsSqlMapper.selectAllQaBoard(page, searchType, searchWord);

		for (QaBoardDto qaBoard : qaBoardDtoList) {
			Map<String, Object> map = new HashMap<>();

			int category_id = qaBoard.getQa_category_id();
			QaCategoryDto category = userCsSqlMapper.selectCategoryById(category_id);

			int user_id = qaBoard.getUser_id();
			UserDto user = userSqlMapper.selectByUserId(user_id);

			// 최신(날짜차이 계산)
			int id = qaBoard.getId();
			int isRecent = userCsSqlMapper.recentQaBoardById(id);

			map.put("qaBoard", qaBoard);
			map.put("category", category);
			map.put("user", user);
			map.put("isRecent", isRecent);
			list.add(map);
		}
		return list;
	}

	// QA 게시글 페이징 갯수 조회
	public int getQaBoardCount(String searchType, String searchWord) {
		return userCsSqlMapper.getQaBoardCount(searchType, searchWord);
	}

	// QA 게시글 내용 조회
	public Map<String, Object> getQaBoard(int id) {
		Map<String, Object> qaContent = new HashMap<>();

		QaBoardDto qaBoard = userCsSqlMapper.selectQaBoardByID(id);
		List<QaBoardImageDto> images = userCsSqlMapper.selectImagesById(id);

		int category_id = qaBoard.getQa_category_id();
		QaCategoryDto category = userCsSqlMapper.selectCategoryById(category_id);

		int user_id = qaBoard.getUser_id();
		UserDto user = userSqlMapper.selectByUserId(user_id);

		int adminId = qaBoard.getAdmin_id();
		AdminDto admin = userCsSqlMapper.selectAdminByid(adminId);

		qaContent.put("qaBoard", qaBoard);
		qaContent.put("images", images);
		qaContent.put("category", category);
		qaContent.put("user", user);
		qaContent.put("admin", admin);

		return qaContent;
	}

	// QA게시글 쓰기
	public void writeQaBoard(QaBoardDto params, List<QaBoardImageDto> images) {

		// 게시글 image 동시 입력위한 기본키 생성
		int QaBoardPk = userCsSqlMapper.createQaBoardPk();

		params.setId(QaBoardPk);
		userCsSqlMapper.insertQaContent(params);

		for (QaBoardImageDto image : images) {
			image.setQa_board_id(QaBoardPk);
			userCsSqlMapper.insertQaBoardImage(image);
		}
	}

	// QA게시글 전체 카테고리 조회
	public List<QaCategoryDto> getAllCategory() {
		List<QaCategoryDto> category = userCsSqlMapper.selectAllCategory();
		return category;
	}

	// QA게시글 조회수 증가
	public void increaseQaReadCount(int id) {
		userCsSqlMapper.increaseQaReadCount(id);
	}
	
	// 사용자 QA게시글 추천 조회
	public QaRecommendDto getQaRecommendById(QaRecommendDto params) {
		return userCsSqlMapper.selectQaRecommendById(params);
	}
	
	// 사용자 QA게시글 추천
	public void doQaRecommend(QaRecommendDto params) {
		userCsSqlMapper.insertQaRecommend(params);
	}
	
	// QA게시글 추천수 증가
	public void increaseQaRecommendCount(int id) {
		userCsSqlMapper.increaseQaRecommendCount(id);
	}
	
	// QA게시글 BEST 5
	public List<Map<String, Object>> getBestFiveQa(){
		
		List<Map<String, Object>> bestFiveList = new ArrayList<Map<String, Object>>();

		List<QaBoardDto> bestFive = userCsSqlMapper.selectBestFive();

		for (QaBoardDto best : bestFive) {
			Map<String, Object> map = new HashMap<>();

			int category_id = best.getQa_category_id();
			QaCategoryDto category = userCsSqlMapper.selectCategoryById(category_id);

			int user_id = best.getUser_id();
			UserDto user = userSqlMapper.selectByUserId(user_id);
			
			int id = best.getId();
			int isRecent = userCsSqlMapper.recentQaBoardById(id);
			
			map.put("best", best);
			map.put("category", category);
			map.put("user", user);
			map.put("isRecent", isRecent);
			bestFiveList.add(map);
		
		}
	    return bestFiveList;
	}

	// QA게시글 수정
	public void updateQaBoardById(QaBoardDto params) {
		userCsSqlMapper.updateQaBoardById(params);
	}

	// QA 게시글 삭제
	public void deleteQaBoardById(int id) {
		userCsSqlMapper.deleteQaBoardById(id);
	}
}
