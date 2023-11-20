package com.rm.roaming.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rm.roaming.dto.FriendGroupDto;
import com.rm.roaming.dto.PointDto;
import com.rm.roaming.dto.UserDto;
import com.rm.roaming.user.mapper.UserSqlMapper;
import com.rm.roaming.userboard.mapper.UserBoardSqlMapper;

@Service
public class UserServiceImpl {
	@Autowired
	private UserSqlMapper userSqlMapper;
	@Autowired
	private UserBoardSqlMapper userBoardSqlMapper;
	
	public void userRegister(UserDto userDto) {
		
		int userPk = userSqlMapper.createPk();
		
		userDto.setId(userPk);
		userSqlMapper.insertUser(userDto);
	
		FriendGroupDto friendGroupDto = new FriendGroupDto();
		friendGroupDto.setUser_id(userPk);
		
		userBoardSqlMapper.insertFriendGroupBasic(friendGroupDto);
		
	}
	
	public UserDto getUserInfo(UserDto userDto) {
		UserDto user = userSqlMapper.selectByUserIdAndPw(userDto);
		
		PointDto pointDto = new PointDto();
		pointDto.setUser_id(user.getId());
		
		userSqlMapper.insertLoginPoint(pointDto);
		
		return user; 
	}
	
	
}
