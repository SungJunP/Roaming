package com.rm.roaming.seller.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rm.roaming.dto.SellerDto;
import com.rm.roaming.seller.service.SellerServiceImpl;

@RestController
@RequestMapping("seller/*")
public class RestSellerController {
	@Autowired
	private SellerServiceImpl sellerServiceImpl;
	@RequestMapping("sellerRegisterProcess")
	public Map<String, Object> sellerRegisterProcess(SellerDto sellerDto){
		Map<String, Object> map = new HashMap<>();
		sellerServiceImpl.registerSeller(sellerDto);
		map.put("result","success");
		return map;
	}
	

}
