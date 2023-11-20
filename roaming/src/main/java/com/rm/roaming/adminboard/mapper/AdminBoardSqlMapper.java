package com.rm.roaming.adminboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.rm.roaming.dto.CouponDto;
import com.rm.roaming.dto.ItemCategoryDto;
import com.rm.roaming.dto.ItemDto;
import com.rm.roaming.dto.ItemImageDto;

public interface AdminBoardSqlMapper {

	
	public int createPk();
	// 쿠폰 생성
	public void insertCoupon(CouponDto couponDto);
	// 사용가능한 쿠폰 조회
	public List<CouponDto> selectCouponAll(int page);
	// 사용가능한 쿠폰 조회 페이징
	public int manageCouponCount();
	// 만료된 쿠폰 조회
	public List<CouponDto> selectNotExistCouponAll(int pageNum);
	// 만료된 쿠폰 조회 페이징
	public int notExistManageCouponCount();
	// 특정 쿠폰 조회
	public CouponDto selectByCouponId(int id);
	// 쿠폰 수량 차감 
	public int decreaseCouponCount(int id);
	// 중복 쿠폰 발급 금지
	public int selectNotDuplicate(@Param("coupon_id") int coupon_id,@Param("user_id") int user_id);
	// 쿠폰 삭제
	public void deleteCoupon(CouponDto couponDto);
	// 쿠폰 수정
	public void updateCoupon(CouponDto couponDto);
	// 상품 등록
	public void insertItem(ItemDto itemDto);
	// 상품 상세이미지 등록
	public void insertItemImage(ItemImageDto itemImageDto);
	// 상품 상세이미지 조회
	public List<ItemImageDto> selectItemImageByItemId(int item_id);
	// 상품 카테고리
	public List<ItemCategoryDto> selectByCategoryId();
	// 상품관리 조회
	public List<ItemDto> selectItemAll();
	// 카테고리 ID
	public ItemCategoryDto selectByItemCategoryId(int id);
	// 상품 삭제
	public void deleteItem(int id);
	// 상품 수정
	public void updateItem(ItemDto itemDto);
	// 상품 이미지 수정
	public void updateItemImage(ItemImageDto itemImageDto);
	// 특정 상품 조회
	public ItemDto selectByItemId(int id);
}
