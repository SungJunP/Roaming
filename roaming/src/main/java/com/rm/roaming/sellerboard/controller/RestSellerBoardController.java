package com.rm.roaming.sellerboard.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.rm.roaming.dto.HotelDto;
import com.rm.roaming.dto.RoomDto;
import com.rm.roaming.dto.RoomGroupDto;
import com.rm.roaming.dto.RoomViewDto;
import com.rm.roaming.dto.SellerDto;
import com.rm.roaming.sellerboard.service.SellerBoardServiceImpl;

@RestController
@RequestMapping("sellerboard/*")
public class RestSellerBoardController {
	@Autowired
	private SellerBoardServiceImpl sellerBoardServiceImpl;
	
	@RequestMapping("getMyID")
	public Map<String, Object> getMyID(HttpSession session){
		Map<String, Object> map = new HashMap<>();
		if(session.getAttribute("sessionSeller") != null) {
		SellerDto SellerSession = (SellerDto) session.getAttribute("sessionSeller");
		map.put("result", "success");
		map.put("id", SellerSession.getId());
		}else
		map.put("result", "fail");
		return map;
	}
	
	@RequestMapping("getHotelCategory")
	public Map<String, Object> getHotelCategory(){
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		map.put("cateList", sellerBoardServiceImpl.getHotelCategoriList());
		map.put("syscateList", sellerBoardServiceImpl.getHotelSysCateList());
		return map;
	}
	
	@RequestMapping("registerHotel")
	public Map<String, Object> registerHotel(HotelDto hotelDto, MultipartFile file,  MultipartFile[] files,int[] checkList){
		System.out.println(hotelDto.getHotel_name());
		for(int i=0; i<checkList.length; i++) {
			System.out.println(checkList[i]);
		}
		Map<String, Object> map = new HashMap<>();
		sellerBoardServiceImpl.registerHotel(hotelDto, file, files,checkList);
		return map;
	}
	@RequestMapping("getHotelList")
	public Map<String, Object> getHotelList(int seller_id){	
		Map<String, Object> map = new HashMap<>();
		if(!sellerBoardServiceImpl.getHotelListBySellerId(seller_id).isEmpty() && sellerBoardServiceImpl.getHotelListBySellerId(seller_id)!=null) {
			map.put("result", "success");
			map.put("hotelInfo", sellerBoardServiceImpl.getHotelListBySellerId(seller_id));
			return map;
		}else map.put("result", "fail");
		
		
		return map;
		
	}
	
	

	@RequestMapping("getMyHotel")
	public Map<String, Object> getMyHotel(int id){
		System.out.println(id);
		Map<String, Object> map = new HashMap<>();
		if(sellerBoardServiceImpl.getMyHotel(id) != null) {
			map.put("result", "success");
			map.put("hotelInfo", sellerBoardServiceImpl.getMyHotel(id));
			map.put("groupList",sellerBoardServiceImpl.getGroupListByHotelId(id)); // getmyhotel 할때 아래 그룹리스트도 받아오기
			return map;
		}else {
			map.put("result", "fail");
			map.put("reason", "호텔을 등록하지 않았습니다.");
			return map;
		}
		
	}
	
	@RequestMapping("getMyFirstHotel")
	public Map<String, Object> getMyFirstHotel(int seller_id){
		Map<String, Object> map = new HashMap<>();
		if(sellerBoardServiceImpl.getMyFirstHotel(seller_id)>0) {
		map.put("result", "success");
		map.put("id", sellerBoardServiceImpl.getMyFirstHotel(seller_id));
		return map;
		}else
		map.put("result", "fail");
		return map;

	}
	@RequestMapping("registerGroup")
	public Map<String, Object> registerGroup(RoomGroupDto roomGroupDto,MultipartFile file,  MultipartFile[] files,
			String[] cateList,Integer[] priceList,String[] optionList){
		
		Map<String, Object> map = new HashMap<>();
		sellerBoardServiceImpl.registerGroup(roomGroupDto, file, files, cateList, priceList, optionList);
		map.put("result", "success");
		return map;
	}
	@RequestMapping("getGroupInfo")
	public Map<String, Object> getGroupInfo(int id){
		Map<String, Object> map = new HashMap<>();
		if(sellerBoardServiceImpl.getGroupInfo(id)!= null) {
		map.put("result", "success");
		map.put("groupInfo", sellerBoardServiceImpl.getGroupInfo(id));
		return map;
		}else
		map.put("result", "fail");
		return map;
	}
	@RequestMapping("getFirstGroup")
	public Map<String, Object> getFirstGroup(int hotel_id){
		Map<String, Object> map = new HashMap<>();
		if(sellerBoardServiceImpl.getFirstGroup(hotel_id) != null) {
			map.put("result", "success");
			RoomGroupDto roomGroupDto = sellerBoardServiceImpl.getFirstGroup(hotel_id);
			map.put("groupId", roomGroupDto.getId());
			return map;
		}else {
			map.put("result", "fail");
			return map;
		}
		
	}
	@RequestMapping("getGroupDetailImage")
	public Map<String, Object> getGroupDetailImage(int room_group_id){
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		map.put("image", sellerBoardServiceImpl.getGroupImg(room_group_id));
		return map;
	}
	@RequestMapping("getViewList")
	public Map<String, Object> getViewList(){
		Map<String, Object> map = new HashMap<>();
		map.put("viewList", sellerBoardServiceImpl.getViewList());
		return map;
	}
	@RequestMapping("roomRegister")
	public Map<String, Object> roomRegister(RoomDto roomDto){
		Map<String, Object> map = new HashMap<>();
		sellerBoardServiceImpl.registerRoom(roomDto);
		map.put("result", "success");
		return map;
	}
	@RequestMapping("getGroupDetailInfo")
	public Map<String, Object> getGroupDetailInfo(int room_group_id){
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		map.put("info", sellerBoardServiceImpl.getGroupDetailInfo(room_group_id));
		return map;
	}
	@RequestMapping("getCurrentWeekSellPrice")
	public Map<String, Object> getCurrentWeekSellPrice(int hotel_id){
		Map<String, Object> map = new HashMap<>();
		if(!sellerBoardServiceImpl.getCurrentWeekSellPrice(hotel_id).isEmpty() && sellerBoardServiceImpl.getCurrentWeekSellPrice(hotel_id)!=null) {
			map.put("result", "success");
			map.put("info", sellerBoardServiceImpl.getCurrentWeekSellPrice(hotel_id));
			return map;
		}else
			map.put("result", "fail");
			return map;
	}

	@RequestMapping("getRoomPercent")
	public Map<String, Object> getRoomPercent(int hotel_id){
		Map<String, Object> map = new HashMap<>();
		map.put("info", sellerBoardServiceImpl.getTodayRoomCount(hotel_id));
		return map;
	}
	
}
