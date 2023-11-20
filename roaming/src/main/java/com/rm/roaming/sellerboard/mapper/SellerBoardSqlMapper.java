package com.rm.roaming.sellerboard.mapper;

import java.util.List;

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

public interface SellerBoardSqlMapper {
	//카테고리불러오기
	public List<HotelCategoryDto> selectHotelCategoryList();
	// 호텔 pk생성
	public int createHotelPk();
	// 호텔 시스카테 리스트
	public List<HotelSyscategoryDto> selectHotelSyscategory();
	// 호텔 시스카테 등록
	public void insertHotelSyscategory(HotelLinkSyscategoryDto hotelLinkSyscategory);
	// 호텔등록
	public void insertHotel(HotelDto hotelDto);
	// 호텔등록시 서류등록
	public void insertDocu(HotelDocuDto hotelDocuDto);
	// 호텔리스트 갖고오기
	public List<HotelDto> selectMyHotelList(int seller_id);
	// 호텔 갖고오기
	public HotelDto selectMyHotelById(int id);
	// 첫번쨰(디폴트) 호텔
	public HotelDto selectMyFirstHotel(int seller_id);
	//그룹pk생성
	public int createGroupPk();
	// 그룹등록
	public void insertRoomGroup(RoomGroupDto roomGroupDto);
	//그룹상세이미지
	public void insertRoomGroupImg(RoomGroupImgDto roomGroupImgDto);
	//그룹 추가옵션
	public void insertGroupPlusOption(GroupPlusOptionDto groupPlusOptionDto);
	//그룹 커스텀옵션
	public void insertCustomCategory(CustomCategoryDto customCategoryDto);
	// 그룹 리스트 가져오기
	public List<RoomGroupDto> selectGroupListByHotelId(int hotel_id);
	// 그룹 정보 갖고오기
	public RoomGroupDto selectGroupById(int id);
	// 그룹 상세이미지
	public List<RoomGroupImgDto> selectGroupImgByRoomGroupId(int room_group_id);
	// 첫번째 그룹
	public RoomGroupDto selectFirstGroup(int hotel_id);
	// 뷰 리스트 셀렉트
	public List<RoomViewDto> selectRoomViewList();
	// 룸등록
	public void insertRoom(RoomDto roomDto);
	// 그룹정보 추가옵션 커스텀 방번호 뷰
	public List<GroupPlusOptionDto> selectGroupPlusOptionByRoomGroupId(int room_group_id);
	public List<CustomCategoryDto> selectCustomCategoryByRoomGroupId(int room_group_id);
	public List<RoomDto> selectRoomByRoomGroupId(int room_group_id);
	public RoomViewDto selectViewNameByRoomViewId(int id);

	//이번주 판매액 그룹별
	public List<RoomGroupDto> selectCurrentWeekSellPrice(int hotel_id);
	// 방점유율
	public List<ReserveDto> selectCountTodayReserve(int hotel_id);
	public int selectRoomCountByGroupId(int room_group_id);
}
