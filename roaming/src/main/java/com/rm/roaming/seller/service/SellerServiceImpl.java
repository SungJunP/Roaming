package com.rm.roaming.seller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rm.roaming.dto.SellerDto;
import com.rm.roaming.seller.mapper.SellerSqlMapper;

@Service
public class SellerServiceImpl {
	@Autowired
	private SellerSqlMapper sellerSqlMapper;
	
	// seller 가입
	public void registerSeller(SellerDto sellerDto) {
		sellerSqlMapper.insertSeller(sellerDto);
	}
	
	//seller 로그인
	public SellerDto sellerLogin(SellerDto sellerDto) {
		return sellerSqlMapper.selectSellerByIdAndPw(sellerDto);
	}
}
