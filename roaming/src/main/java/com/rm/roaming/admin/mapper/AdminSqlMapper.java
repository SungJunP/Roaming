package com.rm.roaming.admin.mapper;

import com.rm.roaming.dto.AdminDto;

public interface AdminSqlMapper {

	// 관리자 insert
	public void insertAdmin(AdminDto adminDto);
	// 관리자 ID,PW
	public AdminDto selectByAdminIdAndPw(AdminDto adminDto);
	// 관리자 고유 ID
	public AdminDto selectByAdminId(int id);
}
