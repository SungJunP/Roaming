package com.rm.roaming.sellerboard.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.rm.roaming.dto.CustomCategoryDto;
import com.rm.roaming.dto.GroupPlusOptionDto;
import com.rm.roaming.dto.HotelCategoryDto;
import com.rm.roaming.dto.HotelDocuDto;
import com.rm.roaming.dto.HotelDto;
import com.rm.roaming.dto.HotelLinkSyscategoryDto;
import com.rm.roaming.dto.HotelSyscategoryDto;
import com.rm.roaming.dto.ReserveDto;
import com.rm.roaming.dto.RoomDto;
import com.rm.roaming.dto.RoomGroupDto;
import com.rm.roaming.dto.RoomGroupImgDto;
import com.rm.roaming.dto.RoomViewDto;
import com.rm.roaming.sellerboard.mapper.SellerBoardSqlMapper;
import com.rm.roaming.userboard.mapper.UserBoardSqlMapper;

@Service
public class SellerBoardServiceImpl {
	@Autowired
	private SellerBoardSqlMapper sellerBoardSqlMapper;
	@Autowired
	private UserBoardSqlMapper userBoardSqlMapper;
	
	public List<HotelCategoryDto> getHotelCategoriList(){ // 호텔카테고리
		return sellerBoardSqlMapper.selectHotelCategoryList();
	}
	public List<HotelSyscategoryDto> getHotelSysCateList(){
		return sellerBoardSqlMapper.selectHotelSyscategory();
	}
	public void registerHotel(HotelDto hotelDto,MultipartFile file, MultipartFile[] files,int[] syscategory_id) { //호텔등록
		List<HotelDocuDto> list = new ArrayList<>();
		int hotelId = sellerBoardSqlMapper.createHotelPk();
		hotelDto.setId(hotelId);
		if (files != null) {
			for (MultipartFile multipartFile : files) {
				if (multipartFile.isEmpty()) {
					continue;
				}
				String rootFolder =  "C:/uploadFiles/";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String today = sdf.format(new Date());

				File targetFolder = new File(rootFolder + today);
				if (!targetFolder.exists()) {
					targetFolder.mkdirs();
				}

				String fileName = UUID.randomUUID().toString();
				fileName += "_" + System.currentTimeMillis();

				String originalFileName = multipartFile.getOriginalFilename();
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));

				String savaFileName = today + "/" + fileName + ext;

				try {
					multipartFile.transferTo(new File(rootFolder + savaFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}
				HotelDocuDto hotelDocuDto = new HotelDocuDto();
				hotelDocuDto.setHotel_id(hotelId);
				hotelDocuDto.setDocu_link(savaFileName);
				list.add(hotelDocuDto);
			}
		}
		if (file != null) {
			String rootFolder =  "C:/uploadFiles/";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String today = sdf.format(new Date());

			File targetFolder = new File(rootFolder + today);
			if (!targetFolder.exists()) {
				targetFolder.mkdirs();
			}

			String fileName = UUID.randomUUID().toString();
			fileName += "_" + System.currentTimeMillis();

			String originalFileName = file.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));

			String savaFileName = today + "/" + fileName + ext;

			try {
				file.transferTo(new File(rootFolder + savaFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			hotelDto.setHotel_img(savaFileName);
		}
		sellerBoardSqlMapper.insertHotel(hotelDto);
		for(HotelDocuDto hotelDocuDto : list) {
			sellerBoardSqlMapper.insertDocu(hotelDocuDto);
		}
		HotelLinkSyscategoryDto hotelLinkSyscategory = new HotelLinkSyscategoryDto();
		for(int cateid : syscategory_id) {
			hotelLinkSyscategory.setHotel_id(hotelId);
			hotelLinkSyscategory.setSyscategory_id(cateid);
			sellerBoardSqlMapper.insertHotelSyscategory(hotelLinkSyscategory);

		}
		
	}
	public List<Map<String, Object>> getHotelListBySellerId(int seller_id){
		List<HotelDto> hotelList =  sellerBoardSqlMapper.selectMyHotelList(seller_id);
		List<Map<String, Object>> list = new ArrayList<>();
		for(HotelDto hotelDto : hotelList) {
			Map<String, Object> map = new HashMap<>();
			int categoryId = hotelDto.getHotel_category_id();
			map.put("hotelDto", hotelDto);
			map.put("category", userBoardSqlMapper.selectHotelCategoryByHotelCategoryId(categoryId));
			list.add(map);
		}
		return list;
	}
	public Map<String, Object> getHotelInfo(int hotel_id){
		Map<String, Object> map = new HashMap<>();
		HotelDto hotelDto =sellerBoardSqlMapper.selectMyHotelById(hotel_id)	;
		map.put("hotelDto", hotelDto);
		map.put("category", userBoardSqlMapper.selectHotelCategoryByHotelCategoryId(hotelDto.getHotel_category_id()));
		return map;
	}

	public HotelDto getMyHotel(int id) { // 내 호텔정보 갖고오기
		return sellerBoardSqlMapper.selectMyHotelById(id);
	}
	
	public int getMyFirstHotel(int seller_id) {
		if(sellerBoardSqlMapper.selectMyFirstHotel(seller_id) != null) {
		HotelDto hotelDto = sellerBoardSqlMapper.selectMyFirstHotel(seller_id);		
		return hotelDto.getId();
		}else return 0;
	}
	
	public void registerGroup(RoomGroupDto roomGroupDto,MultipartFile file,  MultipartFile[] files,
			String[] cateList,Integer[] priceList,String[] optionList) { //그룹등록
		System.out.println(roomGroupDto.getRoom_group_name());
		List<RoomGroupImgDto> list = new ArrayList<>();
		int groupId = sellerBoardSqlMapper.createGroupPk();
		roomGroupDto.setId(groupId);
		if (files != null) {
			for (MultipartFile multipartFile : files) {
				if (multipartFile.isEmpty()) {
					continue;
				}
				String rootFolder = "/Users/proxy/uploadFiles/";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String today = sdf.format(new Date());

				File targetFolder = new File(rootFolder + today);
				if (!targetFolder.exists()) {
					targetFolder.mkdirs();
				}

				String fileName = UUID.randomUUID().toString();
				fileName += "_" + System.currentTimeMillis();

				String originalFileName = multipartFile.getOriginalFilename();
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));

				String savaFileName = today + "/" + fileName + ext;

				try {
					multipartFile.transferTo(new File(rootFolder + savaFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}
				RoomGroupImgDto roomGroupImgDto = new RoomGroupImgDto();
				roomGroupImgDto.setRoom_group_id(groupId);
				roomGroupImgDto.setDetail_img(savaFileName);
				list.add(roomGroupImgDto);
			}
		}
		if (file != null) {
			String rootFolder = "/Users/proxy/uploadFiles/";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String today = sdf.format(new Date());

			File targetFolder = new File(rootFolder + today);
			if (!targetFolder.exists()) {
				targetFolder.mkdirs();
			}

			String fileName = UUID.randomUUID().toString();
			fileName += "_" + System.currentTimeMillis();

			String originalFileName = file.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));

			String savaFileName = today + "/" + fileName + ext;

			try {
				file.transferTo(new File(rootFolder + savaFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			roomGroupDto.setRoom_group_img(savaFileName);
		}
		sellerBoardSqlMapper.insertRoomGroup(roomGroupDto);
		for(RoomGroupImgDto roomGroupImgDto : list) {
			sellerBoardSqlMapper.insertRoomGroupImg(roomGroupImgDto);
		}
		GroupPlusOptionDto groupPlusOptionDto = new GroupPlusOptionDto();
		for (int i = 0; i < optionList.length; i++) {
			  groupPlusOptionDto.setPlus_option(optionList[i]);
			  groupPlusOptionDto.setRoom_group_id(groupId);
			  groupPlusOptionDto.setPrice(priceList[i]);
			  sellerBoardSqlMapper.insertGroupPlusOption(groupPlusOptionDto);
			}
		CustomCategoryDto customCategoryDto = new CustomCategoryDto();
		for(String catename : cateList) {
			customCategoryDto.setRoom_group_id(groupId);
			customCategoryDto.setCategory_name(catename);
			sellerBoardSqlMapper.insertCustomCategory(customCategoryDto);
		}
		
	}
	
	public List<RoomGroupDto> getGroupListByHotelId(int hotel_id){ //그룹리스트 갖고오기
		return sellerBoardSqlMapper.selectGroupListByHotelId(hotel_id);
	}
	public RoomGroupDto getGroupInfo(int id) {//그룹정보갖고오기
		return sellerBoardSqlMapper.selectGroupById(id);
	}
	public List<RoomGroupImgDto> getGroupImg(int room_group_id){//그룹상세이미지
		return sellerBoardSqlMapper.selectGroupImgByRoomGroupId(room_group_id);
	}
	public RoomGroupDto getFirstGroup(int hotel_id) { // 첫번째그룹
		return sellerBoardSqlMapper.selectFirstGroup(hotel_id);
	}
	public List<RoomViewDto> getViewList(){ // 뷰 리스트셀렉트
		return sellerBoardSqlMapper.selectRoomViewList();
	}
	public void registerRoom(RoomDto roomDto) { // 룸등록
		sellerBoardSqlMapper.insertRoom(roomDto);
	}
	public Map<String, Object> getGroupDetailInfo(int room_group_id){ //그룹상세정보
		Map<String, Object> map = new HashMap<>();
		map.put("plusOption", sellerBoardSqlMapper.selectGroupPlusOptionByRoomGroupId(room_group_id));
		map.put("custom", sellerBoardSqlMapper.selectCustomCategoryByRoomGroupId(room_group_id));
		map.put("room", sellerBoardSqlMapper.selectRoomByRoomGroupId(room_group_id)); //호실
		RoomGroupDto roomGroupDto = sellerBoardSqlMapper.selectGroupById(room_group_id);
		map.put("view", sellerBoardSqlMapper.selectViewNameByRoomViewId(roomGroupDto.getView_id())); //뷰
		return map;
	}
	public List<RoomGroupDto> getCurrentWeekSellPrice(int hotel_id){
		return sellerBoardSqlMapper.selectCurrentWeekSellPrice(hotel_id);
	}
	public List<Map<String, Object>> getTodayRoomCount(int hotel_id){
		List<ReserveDto> getList = sellerBoardSqlMapper.selectCountTodayReserve(hotel_id);
		List<Map<String, Object>> list = new ArrayList<>();
		for(ReserveDto reserveDto :getList) {
			Map<String, Object> map = new HashMap<>();
			int reserve = reserveDto.getFinal_price();
			System.out.println(reserve);
			int room = sellerBoardSqlMapper.selectRoomCountByGroupId(reserveDto.getRoom_group_id());
			System.out.println(room);
			int per =  (int)((double)reserve/room * 100);
			System.out.println(per);
			map.put("roomGroupDto",sellerBoardSqlMapper.selectGroupById(reserveDto.getRoom_group_id()));
			map.put("per",per);
			list.add(map);
		}
		return list;
	}

}
