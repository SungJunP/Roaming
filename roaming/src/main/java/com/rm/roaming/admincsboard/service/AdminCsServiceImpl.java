package com.rm.roaming.admincsboard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rm.roaming.admincsboard.mapper.AdminCsSqlMapper;
import com.rm.roaming.dto.QaBoardDto;
import com.rm.roaming.dto.QaCategoryDto;
import com.rm.roaming.dto.UserDto;
import com.rm.roaming.user.mapper.UserSqlMapper;
import com.rm.roaming.usercsboard.mapper.UserCsSqlMapper;

@Service
public class AdminCsServiceImpl {
	
	@Autowired
	private AdminCsSqlMapper adminCsSqlMapper;
	
	@Autowired
	private UserCsSqlMapper userCsSqlMapper;
	
	@Autowired
	private UserSqlMapper userSqlMapper;
	
	//QA 게시판 답변 쓰기.
	public void writeComment(QaBoardDto qaBoardDto) {
		adminCsSqlMapper.updateQaBoardAdminById(qaBoardDto);
	}
	
	//QA 처리중 답변 목록
	public List<Map<String, Object>> getAdminQaBoardProgress(int page) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		//page 범위 QA 처리중 게시글 조회해서 List에 담기
		List<QaBoardDto> AdminQaBoardProgressList = adminCsSqlMapper.selectAdminQaBoardProgress(page);
		
		for(QaBoardDto qaProgress : AdminQaBoardProgressList) {
			Map<String, Object> map = new HashMap<>();
			
			int category_id = qaProgress.getQa_category_id();
			QaCategoryDto category = userCsSqlMapper.selectCategoryById(category_id);
			
			int user_id = qaProgress.getUser_id();
			UserDto user = userSqlMapper.selectByUserId(user_id);
			
			//최신(날짜차이 계산)
			int id = qaProgress.getId();
			int isRecent = userCsSqlMapper.recentQaBoardById(id);
			
			map.put("qaProgress", qaProgress);
			map.put("category", category);
			map.put("user", user);
			map.put("isRecent", isRecent);
			list.add(map);
		}
		
		return list;
	}
	
	// QA 처리중 게시글 페이징 갯수 조회
	public int getProgressCount() {
		return adminCsSqlMapper.getProgressCount();
	}
	
	
	//QA 처리완료 답변 목록
	public List<Map<String, Object>> getAdminQaBoardComplete(int page) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		//page 범위 QA 처리중 게시글 조회해서 List에 담기
		List<QaBoardDto> AdminQaBoardCompleteList = adminCsSqlMapper.selectAdminQaBoardComplete(page);
		
		for(QaBoardDto qaComplete : AdminQaBoardCompleteList) {
			Map<String, Object> map = new HashMap<>();
			
			int category_id = qaComplete.getQa_category_id();
			QaCategoryDto category = userCsSqlMapper.selectCategoryById(category_id);
			
			int user_id = qaComplete.getUser_id();
			UserDto user = userSqlMapper.selectByUserId(user_id);
			
			//최신(날짜차이 계산)
			int id = qaComplete.getId();
			int isRecent = userCsSqlMapper.recentQaBoardById(id);
			
			map.put("qaComplete", qaComplete);
			map.put("category", category);
			map.put("user", user);
			map.put("isRecent", isRecent);
			list.add(map);
		}
		
		return list;
	}
	
	// QA 처리완료 게시글 페이징 갯수 조회
	public int getCompleteCount() {
		return adminCsSqlMapper.getCompleteCount();
	}
	
}
