package com.rm.roaming.sellerboard.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rm.roaming.dto.SellerDto;
import com.rm.roaming.sellerboard.service.SellerBoardServiceImpl;

@Controller
@RequestMapping("sellerboard/*")
public class SellerBoardController {
	@Autowired
	private SellerBoardServiceImpl sellerBoardServiceImpl;
	
	@RequestMapping("sellerHotelListPage")
	public String sellerHotelListPage() {
		return "sellerboard/sellerHotelListPage";
	}
	@RequestMapping("sellerMainPage")
	public String sellerMainPage(int id,Model model) {
		model.addAttribute("hotelInfo", sellerBoardServiceImpl.getHotelInfo(id));
		return "sellerboard/sellerMainPage";
	}
	
	@RequestMapping("hotelManagementPage")
	public String hotelManagementPage() {
		return "sellerboard/hotelManagementPage";
	}
}
