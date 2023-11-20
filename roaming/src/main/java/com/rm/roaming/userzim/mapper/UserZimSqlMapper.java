package com.rm.roaming.userzim.mapper;

import com.rm.roaming.dto.ZimSignUpDto;
import com.rm.roaming.dto.ZimSignupCategoryListDto;

public interface UserZimSqlMapper {
	public void insertZimSignUp(ZimSignUpDto params);

	public void insertZimCategoryList(ZimSignupCategoryListDto params);
	
	public int createPK();
}
