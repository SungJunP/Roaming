package com.rm.roaming.seller.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rm.roaming.dto.SellerDto;
import com.rm.roaming.seller.service.SellerServiceImpl;

@Controller
@RequestMapping("seller/*")
public class SellerController {
	@Autowired
	private SellerServiceImpl sellerServiceImpl;
	@RequestMapping("sellerLoginPage")
	public String SellerLoginPage() {
		return "seller/sellerLoginPage"; 
	}
	
	@RequestMapping("sellerLoginProcess")
	public String sellerLoginProcess(SellerDto sellerDto,HttpSession session) {
		SellerDto sessionSeller = sellerServiceImpl.sellerLogin(sellerDto);
		session.setAttribute("sessionSeller", sessionSeller);
		return "redirect:../sellerboard/sellerHotelListPage";
	}
	@RequestMapping("sellerLogoutProcess")
	public String sellerLogoutProcess(HttpSession session) {
		session.invalidate();
		return "redirect:./sellerLoginPage";
	}
}
