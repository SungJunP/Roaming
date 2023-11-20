package com.rm.roaming.user.mapper;


import com.rm.roaming.dto.PointDto;
import com.rm.roaming.dto.UserDto;

public interface UserSqlMapper {
	
	// PK생성 회원가입하면 동시에 기본그룹 insert
	public int createPk();
	// 회원가입
	public void insertUser(UserDto userDto);
	// 로그인
	public UserDto selectByUserIdAndPw(UserDto userDto);
	// 유저 고유ID 
	public UserDto selectByUserId(int id);
	// 유저 user_name
	public UserDto selectByUserName(String user_name);
	// send_id인 user
	public UserDto selectBySendId(int id);
	// receive_id인 user
	public UserDto selectByReceiveId(int id);
	// 로그인 하면 포인트 획득
	public void insertLoginPoint(PointDto pointDto);

}
