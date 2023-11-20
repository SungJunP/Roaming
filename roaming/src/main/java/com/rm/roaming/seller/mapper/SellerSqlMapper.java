package com.rm.roaming.seller.mapper;

import com.rm.roaming.dto.SellerDto;

public interface SellerSqlMapper {
	// seller 가입
	public void insertSeller(SellerDto sellerDto);
	// seller 로그인
	public SellerDto selectSellerByIdAndPw(SellerDto sellerDto);
	
}
