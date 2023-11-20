package com.rm.roaming.userboard.service;

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

import com.rm.roaming.admin.mapper.AdminSqlMapper;
import com.rm.roaming.adminboard.mapper.AdminBoardSqlMapper;
import com.rm.roaming.dto.AdminDto;
import com.rm.roaming.dto.CouponDto;
import com.rm.roaming.dto.FriendDto;
import com.rm.roaming.dto.FriendGroupDto;
import com.rm.roaming.dto.FriendRequestDto;
import com.rm.roaming.dto.GroupPlusOptionDto;
import com.rm.roaming.dto.HotelDto;
import com.rm.roaming.dto.HotelLikeDto;
import com.rm.roaming.dto.HotelLinkSyscategoryDto;
import com.rm.roaming.dto.HotelReviewDto;
import com.rm.roaming.dto.HotelSyscategoryDto;
import com.rm.roaming.dto.ItemBuyDto;
import com.rm.roaming.dto.ItemCategoryDto;
import com.rm.roaming.dto.ItemDto;
import com.rm.roaming.dto.ItemImageDto;
import com.rm.roaming.dto.ItemReviewDto;
import com.rm.roaming.dto.OptionReserveDto;
import com.rm.roaming.dto.PointDto;
import com.rm.roaming.dto.ReserveDto;
import com.rm.roaming.dto.ReviewJoinDto;
import com.rm.roaming.dto.RoomGroupDto;
import com.rm.roaming.dto.RoomGroupImgDto;
import com.rm.roaming.dto.UserAddressDto;
import com.rm.roaming.dto.UserCouponDto;
import com.rm.roaming.dto.UserDto;
import com.rm.roaming.sellerboard.mapper.SellerBoardSqlMapper;
import com.rm.roaming.user.mapper.UserSqlMapper;
import com.rm.roaming.userboard.mapper.UserBoardSqlMapper;

@Service
public class UserBoardServiceImpl { 
	
	@Autowired
	private UserBoardSqlMapper userBoardSqlMapper;
	
	@Autowired
	private UserSqlMapper userSqlMapper;
	
	@Autowired
	private AdminSqlMapper adminSqlMapper;
	
	@Autowired
	private AdminBoardSqlMapper adminBoardSqlMapper;
	
	@Autowired
	private SellerBoardSqlMapper sellerBoardSqlMapper;
	
	// 모든 쿠폰 리스트 조회
	public List<Map<String,Object>> getCouponList(int userId) {
		
		List<Map<String, Object>> couponList = new ArrayList<>();
		
		List<CouponDto> couponDtoList = userBoardSqlMapper.selectCouponList();
		
		for(CouponDto couponDto : couponDtoList) {
			
			Map<String, Object> map = new HashMap<>();
				
			int duplicate = adminBoardSqlMapper.selectNotDuplicate(couponDto.getId(), userId );
			int useCouponCount = adminBoardSqlMapper.decreaseCouponCount(couponDto.getId());
			int quantity = couponDto.getCoupon_count() - useCouponCount;
			
			map.put("duplicate", duplicate);
			map.put("couponDto", couponDto);
			map.put("quantity", quantity);
			
			couponList.add(map);
		}
		
		return couponList;
	}
	
	
	
	// 내 쿠폰함에 쿠폰 추가 
	public void userCouponAdd(UserCouponDto userCouponDto) {
		
		userBoardSqlMapper.insertUserCoupon(userCouponDto);
		
	}
	
	public int userCouponCount(int id) {
		return userBoardSqlMapper.UserCouponCount(id);
	}
	
	// 내 쿠폰함 사용가능쿠폰 리스트 조회
	public List<Map<String,Object>> getUserCouponList(int id, int page) {
		
		List<Map<String, Object>> userCouponList = new ArrayList<>();
		
		List<UserCouponDto> userCouponDtoList = userBoardSqlMapper.selectUserCouponAll(id, page);
		
		for(UserCouponDto userCouponDto : userCouponDtoList) {
			
			Map<String, Object> map = new HashMap<>();
			
			int userId = userCouponDto.getUser_id();
			int couponId = userCouponDto.getCoupon_id();
			
			UserDto userDto = userSqlMapper.selectByUserId(userId);
			CouponDto couponDto = adminBoardSqlMapper.selectByCouponId(couponId);
			
			map.put("userDto", userDto);
			map.put("couponDto", couponDto);
			
			userCouponList.add(map);
			
		}
		
		return userCouponList;
	}
	
	public int notExistUserCouponCount(int id) {
		return userBoardSqlMapper.notExistUserCouponCount(id);
	}
	
		
	// 내 쿠폰함 사용완료쿠폰 리스트 조회
		public List<Map<String,Object>> getNotExistUserCouponList(int id, int pageNum) {
			
			List<Map<String, Object>> notExistUserCouponList = new ArrayList<>();
			
			List<UserCouponDto> notExistUserCouponDtoList = userBoardSqlMapper.selectNotExistUserCouponAll(id, pageNum);
			
			for(UserCouponDto userCouponDto : notExistUserCouponDtoList) {
				
				Map<String, Object> map = new HashMap<>();
				
				int userId = userCouponDto.getUser_id();
				int couponId = userCouponDto.getCoupon_id();
				
				UserDto userDto = userSqlMapper.selectByUserId(userId);
				CouponDto couponDto = adminBoardSqlMapper.selectByCouponId(couponId);
				
				map.put("userDto", userDto);
				map.put("couponDto", couponDto);
				
				notExistUserCouponList.add(map);
				
			}
			
			return notExistUserCouponList;
		}
		
		
	// 그룹 페이지 모든 그룹 조회
		public List<Map<String, Object>> getFriendGroupList(int id) {
					
			List<Map<String, Object>> friendGroupList = new ArrayList<>();
					
			List<FriendGroupDto> friendGroupDtoList = userBoardSqlMapper.selectFriendGroupAll(id);
					
			for(FriendGroupDto friendGroupDto : friendGroupDtoList) {
						
				Map<String, Object> map = new HashMap<>();
						
				int userId = friendGroupDto.getUser_id();
						
				UserDto userDto = userSqlMapper.selectByUserId(userId);
						
				map.put("userDto", userDto);
				map.put("friendGroupDto", friendGroupDto);
						
				friendGroupList.add(map);
			}
					
			return friendGroupList;
		}
				
	// 그룹 페이지 특정 그룹 조회
		public Map<String, Object> getFriendGroup(int id) {
					
			Map<String, Object> map = new HashMap<>();
					
			FriendGroupDto friendGroupDto = userBoardSqlMapper.selectByFriendGroupId(id);
			UserDto userDto = userSqlMapper.selectByUserId(id);
					
			map.put("userDto", userDto);
			map.put("friendGroupDto", friendGroupDto);
					
			return map;
		}
				
	// 그룹 페이지 특정 그룹 삭제
		public void deleteFriendGroup(int id) {
			userBoardSqlMapper.deleteFriendGroup(id);
		}
		
	// 그룹 페이지 특정 그룹 그룹명 수정	
		public void updateFriendGroup(FriendGroupDto friendGroupDto) {
			
			userBoardSqlMapper.updateFriendGroup(friendGroupDto);
		
		}
			
	// 그룹 등록
		public void insertFriendGroup(FriendGroupDto friendGroupDto) {
					
			userBoardSqlMapper.insertFriendGroup(friendGroupDto);
					
		}
				
	// 친구 요청 등록
		public void insertFriendRequest(FriendRequestDto friendRequestDto, String user_name) {
					
			UserDto userDto = userSqlMapper.selectByUserName(user_name);
			friendRequestDto.setReceive_id(userDto.getId());
				
					
			userBoardSqlMapper.insertFriendRequest(friendRequestDto);
		}
		
		
	// status = 'R' 인 모든 친구 요청 조회
		public List<Map<String, Object>> getFriendRequestList(int id) {
			
			List<Map<String, Object>> friendRequestList = new ArrayList<>();
			
			List<FriendRequestDto> friendRequestDtoList = userBoardSqlMapper.selectFriendRequestAll(id);
			
			for(FriendRequestDto friendRequestDto : friendRequestDtoList) {
				
				Map<String, Object> map = new HashMap<>();
				
				int sendId = friendRequestDto.getSend_id();
				int receiveId = friendRequestDto.getReceive_id();
				
				UserDto sendIdDto = userSqlMapper.selectBySendId(sendId);
				UserDto receiveIdDto = userSqlMapper.selectByReceiveId(receiveId);
				
				map.put("sendIdDto", sendIdDto);
				map.put("receiveIdDto", receiveIdDto);
				map.put("friendRequestDto", friendRequestDto);
				
				friendRequestList.add(map);
			}
			
			return friendRequestList;
			
		}
		
		
		
		// 특정 친구 요청 ID에 해당하는 친구 요청 상태 업데이트 및 동시에 친구추가
		public void updateFriendStatus(FriendRequestDto friendRequestDto, FriendDto friendDto) {
			
			if(friendRequestDto.getStatus().equals("Y")) {
				userBoardSqlMapper.updateFriendRequestStatus(friendRequestDto);
				
				int group_id = userBoardSqlMapper.getDefaultFriendGroupIdByUserId(friendDto.getUser_id());
				friendDto.setGroup_id(group_id);
				
				userBoardSqlMapper.insertFriend(friendDto);
				
				
				

			} else if(friendRequestDto.getStatus().equals("N")) {
				userBoardSqlMapper.updateFriendRequestStatus(friendRequestDto);
				
			}
			
		}
		
		// 특정 친구 요청 ID에 해당하는 친구 요청 상태 업데이트 및 동시에 친구추가 리버스
		public void updateFriendStatus2(FriendRequestDto friendRequestDto, FriendDto friendDto) {
		    if (friendRequestDto.getStatus().equals("Y")) {
		        userBoardSqlMapper.updateFriendRequestStatus(friendRequestDto);

		        int group_id = userBoardSqlMapper.getDefaultFriendGroupIdByUserId(friendDto.getFriend_id());
		        friendDto.setGroup_id(group_id);
		        int user_id = friendDto.getUser_id();
		        friendDto.setUser_id(friendDto.getFriend_id());
		        friendDto.setFriend_id(user_id);

		        userBoardSqlMapper.insertFriend(friendDto);
		    } else if (friendRequestDto.getStatus().equals("N")) {
		        userBoardSqlMapper.updateFriendRequestStatus(friendRequestDto);
		    }
		}

		
		// 친구 목록 리스트
		public List<Map<String, Object>> friendList(int user_id) {
			List<Map<String, Object>> list = new ArrayList<>();
			
			List<FriendGroupDto> friendGroupDtoList = userBoardSqlMapper.selectFriendGroupUserId(user_id);
			
			for(FriendGroupDto friendGroupDto : friendGroupDtoList) {
				
				int groupId = friendGroupDto.getId();
				
				List<FriendDto> friendDtoList = userBoardSqlMapper.selectFriendGroupId(groupId);
				
				for(FriendDto friendDto : friendDtoList) {
					
					Map<String, Object> map = new HashMap<>();
					
					int friendId = friendDto.getFriend_id();
					
					UserDto userDto = userBoardSqlMapper.selectUserId(friendId);
					
					map.put("friendDto", friendDto);
					map.put("friendGroupDto", friendGroupDto);
					map.put("userDto", userDto);
					
					list.add(map);
				}
			}
			return list;
		}
		
			
		
		// 친구 페이지 특정 친구 조회
		public Map<String, Object> getFriend(int id) {
		    Map<String, Object> map = new HashMap<>();
		    
		    FriendDto friendDto = userBoardSqlMapper.selectByFriendId(id);
		    UserDto userDto = userSqlMapper.selectByUserId(id);
		    
		    map.put("userDto", userDto);
		    map.put("friendDto", friendDto);
		    
		    return map;
		}

						
				
		// 친구 페이지 특정 친구 소속그룹 수정	
			public void updateFriendMove(FriendDto friendDto, String group_name) {
				
				FriendGroupDto friendGroupDto = userBoardSqlMapper.selectByFriendGroupName(group_name);
				friendDto.setGroup_id(friendGroupDto.getId());
				
				userBoardSqlMapper.updateFriendMove(friendDto);
			
			}
		
		
		// 그룹 페이지 특정 친구 삭제
			public void deleteFriend(FriendDto friendDto) {
				
				userBoardSqlMapper.deleteFriend(friendDto);

			}

		// 모든 상품 리스트 조회
			public List<Map<String, Object>> getItemList(int userId) {
				
				List<Map<String, Object>> itemList = new ArrayList<>();
				
				List<ItemDto> itemDtoList = userBoardSqlMapper.selectItemList();
				
				for(ItemDto itemDto : itemDtoList) {
					
					Map<String, Object> map = new HashMap<>();
					
					int adminId = itemDto.getAdmin_id();
					int itemCategoryId = itemDto.getCategory_id();
					
					AdminDto adminDto = adminSqlMapper.selectByAdminId(adminId);
					ItemCategoryDto itemCategoryDto = adminBoardSqlMapper.selectByItemCategoryId(itemCategoryId);
					
					map.put("adminDto", adminDto);
					map.put("itemDto", itemDto);
					map.put("itemCategoryDto", itemCategoryDto);
					
					itemList.add(map);
				}
				
				return itemList;
			}
		
		// 특정 상품 조회
			public Map<String, Object> getItemDetail(int id) {
				
				Map<String, Object> map = new HashMap<>();
				
				
				ItemDto itemDto = userBoardSqlMapper.selectByItemId(id);
				ItemCategoryDto itemCategoryDto = adminBoardSqlMapper.selectByItemCategoryId(itemDto.getCategory_id());
				List<ItemImageDto> itemImageDto = userBoardSqlMapper.selectItemImageById(id);
				
				map.put("itemDto", itemDto);
				map.put("itemCategoryDto", itemCategoryDto);
				map.put("itemImageDto", itemImageDto);
				
				return map;
			}
		
		// 특정 상품 구매 정보 조회
			public Map<String, Object> getItemBuy(int id) {
				
				Map<String, Object> map = new HashMap<>();
				
				ItemDto itemDto = userBoardSqlMapper.selectByItemId(id);
				ItemCategoryDto itemCategoryDto = adminBoardSqlMapper.selectByItemCategoryId(itemDto.getCategory_id());
				List<ItemImageDto> itemImageDto = userBoardSqlMapper.selectItemImageById(id);
				
				
				map.put("itemDto", itemDto);
				map.put("itemCategoryDto", itemCategoryDto);
				map.put("itemImageDto", itemImageDto);
				
				
				return map;
			}
			
			
			public int createAddressPk() {
				return userBoardSqlMapper.createAddressPk();
			}
		
		// 특정 상품 구매 등록
			public void insertItemBuy (ItemBuyDto itemBuyDto) {
				
				userBoardSqlMapper.insertItemBuy(itemBuyDto);
				
				
			}
	
		// 특정 상품 구매 내역 포인트 등록
			public void insertPointStatus (PointDto pointDto) {
				
				userBoardSqlMapper.insertPointStatus(pointDto);
				
			}
			
		// 배송지 등록
			public void insertUserAddress (UserAddressDto userAddressDto) {
					
				userBoardSqlMapper.insertUserAddress(userAddressDto);
				
			}
		
		// 주문내역 조회
			public List<Map<String, Object>> getOrderHistoryList(int id) {
				
				List<Map<String, Object>> orderHistoryList = new ArrayList<>();
				
				List<ItemBuyDto> orderHistoryDtoList = userBoardSqlMapper.selectByItemBuyList(id);
				
				for(ItemBuyDto itemBuyDto : orderHistoryDtoList) {
					
					Map<String, Object> map = new HashMap<>();
					
					
					int itemId = itemBuyDto.getItem_id();
					int addressId = itemBuyDto.getAddress_id();
					
					
					ItemDto itemDto = userBoardSqlMapper.selectByItemId(itemId);
					UserAddressDto userAddressDto = userBoardSqlMapper.selectUserAddressId(addressId);
					
					
					map.put("itemDto", itemDto);
					map.put("itemBuyDto", itemBuyDto);
					map.put("userAddressDto", userAddressDto);
					
	
					orderHistoryList.add(map);
				}
				
				return orderHistoryList;
			}
			
			
			
			
		// 상품리뷰 등록
			public void insertItemReview (ItemReviewDto itemReviewDto) {
				
				userBoardSqlMapper.insertItemReview(itemReviewDto);
			}
			
		// 상품리뷰 조회
			public List<ReviewJoinDto> getItemReviewList(int id) {
				
						
				
				
				List<ReviewJoinDto> reviewJoinDtoList  = userBoardSqlMapper.selectByItemReviewList(id);
				
					

				return reviewJoinDtoList;
			}
			
			
		
			
		
		
		
		
		public List<Map<String, Object>> getHotelListByStar(int star,String category,int[] checkBoxValues,int orderByNumber,
				 String startDate,String endDate,int fixed_number, String loc
				){ // 호텔리스트
			List<Map<String, Object>> list = new ArrayList<>();
			List<HotelDto> getList = userBoardSqlMapper.selectHotelListByStar(star,category,checkBoxValues,orderByNumber,startDate,endDate,fixed_number,loc);
			for(HotelDto hotelDto : getList) {
				Map<String, Object> map = new HashMap<>();
				map.put("category", userBoardSqlMapper.selectHotelCategoryByHotelCategoryId(hotelDto.getHotel_category_id()));
				map.put("hotelDto", hotelDto);
				map.put("price", userBoardSqlMapper.selectMinPriceByHotelId(hotelDto.getId()));
				map.put("star", userBoardSqlMapper.selectStarAvgByHotelId(hotelDto.getId()));
				map.put("review", userBoardSqlMapper.selectStarCountByHotelId(hotelDto.getId()));
				list.add(map);
			}
			return list;
		}
		
		public List<HotelSyscategoryDto> getCategoryList(){
			return sellerBoardSqlMapper.selectHotelSyscategory();
		}
		
		
		public Map<String, Object> getHotelInfo(int id){
			Map<String, Object> map = new HashMap<>();
			map.put("hotelDto", userBoardSqlMapper.selectHotelInfoById(id));
			HotelDto hotelDto = userBoardSqlMapper.selectHotelInfoById(id);
			map.put("category", userBoardSqlMapper.selectHotelCategoryByHotelCategoryId(hotelDto.getHotel_category_id()));
			map.put("custom", userBoardSqlMapper.selectCustomCategoryByHotelId(id));	// 나중에 필터에 넣자
			map.put("view", userBoardSqlMapper.selectViewList());
			List<HotelLinkSyscategoryDto> getList = userBoardSqlMapper.selectHotelLinkSysCategoryByHotelId(id);
			List<HotelSyscategoryDto> list = new ArrayList<>();
			for(HotelLinkSyscategoryDto hotelLinkSyscategoryDto : getList) {
				list.add(userBoardSqlMapper.selectHotelSysCategoryById(hotelLinkSyscategoryDto.getSyscategory_id()));
			}

			map.put("system", list);
			map.put("star", userBoardSqlMapper.selectStarAvgByHotelId(hotelDto.getId()));
			map.put("review", userBoardSqlMapper.selectStarCountByHotelId(hotelDto.getId()));
			//아래는 그룹의 모든 이미지(대표,상세)
			map.put("roomGroupDto", userBoardSqlMapper.selectRoomGroupByHotelId(id));
			map.put("roomGroupImgDto", userBoardSqlMapper.selectRoomGroupImgByHotelId(id));
			map.put("like", userBoardSqlMapper.selectTotalHotelLikeCount(id));
			return map;
		}
		
		public List<Map<String, Object>> getGroupList(String startDate,String endDate,int hotel_id,int fixed_number,Integer view_id){ // 그룹리스트(호텔상세페이지)
			List<Map<String, Object>> list = new ArrayList<>();
			List<RoomGroupDto> getList= userBoardSqlMapper.selectRoomGroupBySearch(startDate,endDate,hotel_id,fixed_number,view_id);
			for(RoomGroupDto roomGroupDto : getList) {
				Map<String, Object> map = new HashMap<>();
				map.put("roomGroupDto", roomGroupDto);
				map.put("customCategory", userBoardSqlMapper.selectCustomCategoryByGroupId(roomGroupDto.getId()));
				map.put("view", userBoardSqlMapper.selectViewByviewID(roomGroupDto.getView_id()));
				list.add(map);
			}
		
			return list;
			
		}
		
		public List<RoomGroupImgDto> getGroupImages(int room_group_id){ // 그룹 상세이미지
			return userBoardSqlMapper.selectRoomGroupImgByRoomGroupId(room_group_id);
		}
		public Map<String, Object> getReserveInfo(int room_group_id){
			Map<String, Object> map = new HashMap<>();
			map.put("roomGroupDto", userBoardSqlMapper.selectRoomGroupById(room_group_id));
			map.put("plusOption", userBoardSqlMapper.selectGroupPlusOptionByGroupId(room_group_id));
			return map;
		}
		
		public void reserveHotel(ReserveDto reserveDto, int[] option_id) {  // 호텔예약
			int reserve_id = userBoardSqlMapper.createReservePk();
			if(option_id != null) { // 옵션예약 인서트 (값이 있으면 처리)
				OptionReserveDto optionReserveDto = new OptionReserveDto();
				optionReserveDto.setReserve_id(reserve_id);
				for(int optionId : option_id) {
					optionReserveDto.setOption_id(optionId);
					userBoardSqlMapper.insertOptionReserve(optionReserveDto);
				}
			}
			
			reserveDto.setId(reserve_id);
			userBoardSqlMapper.insertReserve(reserveDto);
		}
		
		public List<Map<String, Object>> getReserveListByUserId(int user_id,int filter){ //예약리스트
			List<Map<String, Object>> list = new ArrayList<>();
			List<ReserveDto> getList = userBoardSqlMapper.selectReserveListByUserId(user_id, filter);
			System.out.println(filter);
			for(ReserveDto reserveDto : getList) {
				Map<String, Object> map = new HashMap<>();
				RoomGroupDto roomgroupDto = userBoardSqlMapper.selectRoomGroupById(reserveDto.getRoom_group_id());
				map.put("hotelDto", userBoardSqlMapper.selectHotelInfoById(roomgroupDto.getHotel_id()));
				map.put("roomGroupDto", roomgroupDto);
				map.put("reserveDto", reserveDto);
				List<OptionReserveDto> optionList= userBoardSqlMapper.selectOptionReserveList(reserveDto.getId());
				List<GroupPlusOptionDto> plusList = new ArrayList<>();
				for(OptionReserveDto optionReserveDto : optionList) {
					GroupPlusOptionDto groupPlusOptionDto = userBoardSqlMapper.selectGroupPlusOptionInfo(optionReserveDto.getOption_id());
					plusList.add(groupPlusOptionDto);
				}
				
				map.put("plusList", plusList);
				map.put("reviewCount", userBoardSqlMapper.selectCountReviewByReserveId(reserveDto.getId()));
				list.add(map);
			}
			return list;
		}
		
		public void writeReview(HotelReviewDto hotelReviewDto,MultipartFile file) {
			if (file != null) {
				String rootFolder = "/uploadFiles/";
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
				hotelReviewDto.setReview_img_link(savaFileName);
			}
			userBoardSqlMapper.insertReview(hotelReviewDto);
		}
		
		public List<Map<String, Object>> getReviewList(int hotel_id){
			List<Map<String, Object>> list = new ArrayList<>();
			List<HotelReviewDto> getList = userBoardSqlMapper.selectReviewListByHotelId(hotel_id);
			for(HotelReviewDto hotelReviewDto : getList) {
				Map<String, Object> map = new HashMap<>();
				int reserveId = hotelReviewDto.getReserve_id();
				ReserveDto reserveDto = userBoardSqlMapper.selectReserveById(reserveId);
				int userID = reserveDto.getUser_id();
				int room_group_id = reserveDto.getRoom_group_id();
				map.put("reviewDto", hotelReviewDto);
				map.put("userDto", userBoardSqlMapper.selectUserById(userID));
				map.put("roomGroupDto", userBoardSqlMapper.selectRoomGroupById(room_group_id));
				
				list.add(map);
			}
			
			
			return list;
		}
		public Map<String, Object> getBeforeReserve(String tid){
			Map<String, Object> map =new HashMap<>();
			ReserveDto reserveDto = userBoardSqlMapper.selectReserveByTid(tid);
			int room_group_id = reserveDto.getRoom_group_id();
			map.put("roomGroupDto",  userBoardSqlMapper.selectRoomGroupById(room_group_id));
			map.put("reserveDto", reserveDto);
			List<OptionReserveDto> list =  userBoardSqlMapper.selectOptionReserveList(reserveDto.getId());
			List<GroupPlusOptionDto> optionList = new ArrayList<>();
			for(OptionReserveDto optionReserveDto : list) {
				int option_id = optionReserveDto.getOption_id();
				optionList.add(userBoardSqlMapper.selectGroupPlusOptionInfo(option_id));
			}
			map.put("option", optionList);
			return map;
		}
		
		//찜
		public int useLike(HotelLikeDto hotelLikeDto) {
			return userBoardSqlMapper.selectMyHotelLikeCount(hotelLikeDto);
		}
		
		public void toggleLike(HotelLikeDto hotelLikeDto) {
			if(userBoardSqlMapper.selectMyHotelLikeCount(hotelLikeDto) == 0) {
				userBoardSqlMapper.insertHotelLike(hotelLikeDto);
			}else if(userBoardSqlMapper.selectMyHotelLikeCount(hotelLikeDto) !=0) {
				userBoardSqlMapper.deleteHotelLike(hotelLikeDto);
			}
		}
		public List<Map<String, Object>> getLikeHotelList(int user_id){
			List<HotelDto> getList = userBoardSqlMapper.selectLikeHotelList(user_id);
			List<Map<String, Object>> list= new ArrayList<>();
			for(HotelDto hotelDto : getList) {
				Map<String, Object> map = new HashMap<>();
				map.put("category", userBoardSqlMapper.selectHotelCategoryByHotelCategoryId(hotelDto.getHotel_category_id()));
				map.put("hotelDto", hotelDto);
				map.put("price", userBoardSqlMapper.selectMinPriceByHotelId(hotelDto.getId()));
				map.put("star", userBoardSqlMapper.selectStarAvgByHotelId(hotelDto.getId()));
				map.put("review", userBoardSqlMapper.selectStarCountByHotelId(hotelDto.getId()));
				list.add(map);
			}
			return list;
		}
	
	
	
}