package com.rm.roaming.userboard.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.rm.roaming.dto.HotelLikeDto;
import com.rm.roaming.dto.HotelReviewDto;
import com.rm.roaming.dto.KakaoDto;
import com.rm.roaming.dto.ReserveDto;
import com.rm.roaming.dto.UserDto;
import com.rm.roaming.userboard.service.UserBoardServiceImpl;

@RestController
@RequestMapping("/userboard/*")
public class RestUserBoardController {
	@Autowired
	private UserBoardServiceImpl userBoardServiceImpl;
	
	@RequestMapping("getUserId")
	public Map<String,Object> getUserId(HttpSession session){
		Map<String, Object> map = new HashMap<>();
		if(session.getAttribute("sessionUser") != null) {
			UserDto userDto = (UserDto) session.getAttribute("sessionUser");
			map.put("result", "success");
			map.put("userId", userDto.getId());
			return map;
		}
		return map;
	}
	
	
	@RequestMapping("getCategoryList")
	public Map<String,Object> getCategoryList(){
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		map.put("cateList", userBoardServiceImpl.getCategoryList());
		return map;
	}
	
	@RequestMapping("getHotelListByStar")
	public Map<String, Object> getHotelListByStar(int star,String category,int[] checkBoxValues,int orderByNumber,
			String startDay,String endDay,int fixed_number, String loc){ //호텔리스트 출력
		Map<String, Object> map = new HashMap<>();
		int startLastIndex = startDay.lastIndexOf("/");
		int endLastIndex = endDay.lastIndexOf("/");
		
		String startDate = startDay.substring(0, startLastIndex);
		String endDate = endDay.substring(0, endLastIndex);
		
		if(userBoardServiceImpl.getHotelListByStar(star, category,checkBoxValues,orderByNumber,startDate,endDate,fixed_number,loc)!=null 
				&& !userBoardServiceImpl.getHotelListByStar(star, category,checkBoxValues,orderByNumber,startDate,endDate,fixed_number,loc).isEmpty()) {
		map.put("result", "success");
		map.put("list",userBoardServiceImpl.getHotelListByStar(star, category,checkBoxValues,orderByNumber,startDate,endDate,fixed_number,loc));
		return map;
		}else {
			map.put("result", "fail");
			return map;
		}
		
	}
	@RequestMapping("getHotelInfo")
	public Map<String, Object> getHotelInfo(int id){ // 호텔 상세페이지
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		map.put("info", userBoardServiceImpl.getHotelInfo(id));
		return map;
	}
	
	@RequestMapping("getGroupList")
	public Map<String, Object> getGroupList(String startDay,String endDay,int hotel_id,int fixed_number,Integer view_id){
		Map<String, Object> map = new HashMap<>();
		
		int startLastIndex = startDay.lastIndexOf("/");
		int endLastIndex = endDay.lastIndexOf("/");
		
		String startDate = startDay.substring(0, startLastIndex);
		String endDate = endDay.substring(0, endLastIndex);
		
		System.out.println(startDate);
		
		if(!userBoardServiceImpl.getGroupList(startDate,endDate,hotel_id,fixed_number,view_id).isEmpty()) {
			map.put("group", userBoardServiceImpl.getGroupList(startDate,endDate,hotel_id,fixed_number,view_id));
			map.put("result", "success");
			return map;
		}else {
			map.put("result", "fail");
		}	
		return map;
	}
	@RequestMapping("getGroupImage")
	public Map<String, Object> getGroupImage(int room_group_id){
		Map<String, Object> map = new HashMap<>();
		map.put("images", userBoardServiceImpl.getGroupImages(room_group_id));
		return map;
	}
	@RequestMapping("goToServer")
	public Map<String, Object> goToServer(KakaoDto kakaoDto,HttpSession session){
		Map<String, Object> map = new HashMap<>();
		session.setAttribute("kakaoDto",kakaoDto);
		map.put("result", "success");
		return map;
	}
	
	
	
	@RequestMapping("insertReserve")
	public Map<String, Object> insertReserve(ReserveDto reserveDto,int[] option_id,String startDate,String endDate){
		System.out.println(reserveDto.getUser_id());
		Map<String, Object> map = new HashMap<>();
		//날짜변환
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		
		try {
			Date start_date = sdf.parse(startDate);
			Date end_date = sdf.parse(endDate);
			
			reserveDto.setStart_date(start_date);
			reserveDto.setEnd_date(end_date);
			
			userBoardServiceImpl.reserveHotel(reserveDto, option_id);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		map.put("result", "success");
		return map;
	}
	
	
	@RequestMapping("getGroupInfo")
	public Map<String, Object> getGroupInfo(int id){
		Map<String, Object> map = new HashMap<>();
		map.put("groupInfo", userBoardServiceImpl.getReserveInfo(id));
		
		return map;
	}
	
	@RequestMapping("getReserveList")
	public Map<String, Object> getReserveList(int filter,HttpSession session){
		Map<String, Object> map = new HashMap<>();
		UserDto userDto = (UserDto) session.getAttribute("sessionUser");
		map.put("list", userBoardServiceImpl.getReserveListByUserId(userDto.getId(),filter));
		return map;
	}
	
	@RequestMapping("writeReviewProcess")
	public Map<String, Object>  writeReviewProcess(HotelReviewDto hotelReviewDto,MultipartFile file){
		Map<String, Object> map = new HashMap<>();
		userBoardServiceImpl.writeReview(hotelReviewDto,file);
		map.put("result", "success");
		return map;
	}
	@RequestMapping("getReviewList")
	public Map<String, Object> getReviewList(int hotel_id){
		Map<String, Object> map = new HashMap<>();
		if(userBoardServiceImpl.getReviewList(hotel_id) != null) {
		map.put("result", "success");
		map.put("review", userBoardServiceImpl.getReviewList(hotel_id));
		return map;
		}else {
			map.put("result", "fail");
			return map;
		}
	}
	@RequestMapping("getMyUseLike")
	public Map<String, Object> getMyUseLike(HotelLikeDto hotelLikeDto){
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		map.put("useCount", userBoardServiceImpl.useLike(hotelLikeDto));
		return map;
	}
	
	@RequestMapping("toggleLike")
	public Map<String, Object> toggleLike(HotelLikeDto hotelLikeDto){
		Map<String, Object> map = new HashMap<>();
		userBoardServiceImpl.toggleLike(hotelLikeDto);
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("getFavoriteHotelList")
	public Map<String, Object> getFavoriteHotelList(int user_id){
		Map<String, Object> map = new HashMap<>();
		if(!userBoardServiceImpl.getLikeHotelList(user_id).isEmpty() && userBoardServiceImpl.getLikeHotelList(user_id)!=null) {
		map.put("result", "success");
		map.put("hotelList", userBoardServiceImpl.getLikeHotelList(user_id));
		return map;
		}else {
			map.put("result", "fail");
			return map;
		}
	}
	
}
