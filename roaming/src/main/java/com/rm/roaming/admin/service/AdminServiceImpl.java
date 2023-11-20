package com.rm.roaming.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rm.roaming.admin.mapper.AdminSqlMapper;
import com.rm.roaming.dto.AdminDto;

@Service
public class AdminServiceImpl {
	
	@Autowired
	private AdminSqlMapper adminSqlMapper;
	
	// 관리자 회원가입 insert
	public void adminRegister(AdminDto adminDto) {
		adminSqlMapper.insertAdmin(adminDto);
	}

	// 관리자 ID,PW select 
	public AdminDto getAdminInfo(AdminDto adminDto) {
		return adminSqlMapper.selectByAdminIdAndPw(adminDto);
	}
}
