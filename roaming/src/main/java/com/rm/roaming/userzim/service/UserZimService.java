package com.rm.roaming.userzim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rm.roaming.dto.ZimSignUpDto;
import com.rm.roaming.dto.ZimSignupCategoryListDto;
import com.rm.roaming.userzim.mapper.UserZimSqlMapper;

@Service
public class UserZimService {
	
	@Autowired
	private UserZimSqlMapper userZimSqlMapper;
	
	public void insertZimSignUp(ZimSignUpDto params) {
		System.out.println("signup서비스");
		userZimSqlMapper.insertZimSignUp(params);
	}

	public void insertZimCategoryList(ZimSignupCategoryListDto params) {
		
	}
	
	public int createPK() {
		return userZimSqlMapper.createPK();
	}
}
