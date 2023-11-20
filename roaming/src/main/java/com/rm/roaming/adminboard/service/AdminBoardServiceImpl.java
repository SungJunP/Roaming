package com.rm.roaming.adminboard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rm.roaming.admin.mapper.AdminSqlMapper;
import com.rm.roaming.adminboard.mapper.AdminBoardSqlMapper;
import com.rm.roaming.dto.AdminDto;
import com.rm.roaming.dto.CouponDto;
import com.rm.roaming.dto.ItemCategoryDto;
import com.rm.roaming.dto.ItemDto;
import com.rm.roaming.dto.ItemImageDto;

@Service
public class AdminBoardServiceImpl {

	@Autowired
	private AdminBoardSqlMapper adminBoardSqlMapper;
	@Autowired
	private AdminSqlMapper adminSqlMapper;
	
	// 쿠폰 생성 insert
	public void produceCoupon(CouponDto couponDto) {
		
		adminBoardSqlMapper.insertCoupon(couponDto);
	}
	
	// 쿠폰관리 쿠폰현황 페이징
	public int manageCouponCount() {
		return adminBoardSqlMapper.manageCouponCount();
	}
	
	// 쿠폰관리 쿠폰현황 리스트
	public List<Map<String,Object>> getCouponList(int page) {
		
		List<Map<String, Object>> couponList = new ArrayList<>();
		
		List<CouponDto> couponDtoList = adminBoardSqlMapper.selectCouponAll(page);
		
		
		for(CouponDto couponDto : couponDtoList) {
			
			Map<String, Object> map = new HashMap<>();
			
			int adminId = couponDto.getAdmin_id();
			int useCouponCount = adminBoardSqlMapper.decreaseCouponCount(couponDto.getId());
			int quantity = couponDto.getCoupon_count() - useCouponCount;
			
			AdminDto adminDto = adminSqlMapper.selectByAdminId(adminId);
			
			map.put("adminDto", adminDto);
			map.put("couponDto", couponDto);
			map.put("quantity", quantity);
			
			couponList.add(map);
		}
		
		return couponList;
	}
	
	// 쿠폰관리 만료된 쿠폰 페이징
	public int notExistManageCouponCount() {
		return adminBoardSqlMapper.notExistManageCouponCount();
	}
	
	// 쿠폰관리 만료된 쿠폰 리스트
	public List<Map<String,Object>> getNotExistCouponList(int pageNum) {
		
		List<Map<String, Object>> notExistcouponList = new ArrayList<>();
		
		List<CouponDto> couponDtoList = adminBoardSqlMapper.selectNotExistCouponAll(pageNum);
		
		for(CouponDto couponDto : couponDtoList) {
			
			Map<String, Object> map = new HashMap<>();
			
			int adminId = couponDto.getAdmin_id();
			int useCouponCount = adminBoardSqlMapper.decreaseCouponCount(couponDto.getId());
			int quantity = couponDto.getCoupon_count() - useCouponCount;
			
			AdminDto adminDto = adminSqlMapper.selectByAdminId(adminId);
			
			map.put("adminDto", adminDto);
			map.put("couponDto", couponDto);
			map.put("quantity", quantity);
			
			notExistcouponList.add(map);
		}
		
		return notExistcouponList;
	}
	
	
	
	// 쿠폰 삭제
	public void deleteCoupon(CouponDto couponDto) {
		adminBoardSqlMapper.deleteCoupon(couponDto);
	}
	
	// 쿠폰수정
	public void updateCoupon(CouponDto couponDto) {
		adminBoardSqlMapper.updateCoupon(couponDto);
	}
	
	// 쿠폰 테이블 및 관리자ID
	public Map<String, Object> getCoupon(int id) {
		
		Map<String, Object> map = new HashMap<>();
		
		CouponDto couponDto = adminBoardSqlMapper.selectByCouponId(id);
		AdminDto adminDto = adminSqlMapper.selectByAdminId(couponDto.getAdmin_id());
		
		map.put("adminDto", adminDto);
		map.put("couponDto", couponDto);
		
		return map;
	}
	
	// 상품 등록 insert
		public void itemRegister(ItemDto itemDto, List<ItemImageDto> itemImageDtoList ) {
			
			int itemId = adminBoardSqlMapper.createPk();
			
			itemDto.setId(itemId);
			adminBoardSqlMapper.insertItem(itemDto);
			
			for(ItemImageDto itemImageDto : itemImageDtoList) {
				itemImageDto.setItem_id(itemId);
				adminBoardSqlMapper.insertItemImage(itemImageDto);
			}
		}
		
	// 상품 카테고리
		public List<ItemCategoryDto> getCategory() {
			
			return adminBoardSqlMapper.selectByCategoryId();
		}
		
	// 상품관리 조회
		public List<Map<String, Object>> getItemList() {
			
			List<Map<String, Object>> itemList = new ArrayList<>();
			
			List<ItemDto> itemDtoList = adminBoardSqlMapper.selectItemAll();
			
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
		
	// 상품삭제
		public void deleteItem(int id) {
			adminBoardSqlMapper.deleteItem(id);
		}
		
	// 상품수정
		public void updateItem(ItemDto itemDto) {
			adminBoardSqlMapper.updateItem(itemDto);
		}
		
	// 상품 이미지 수정
		public void updateItemImage(ItemImageDto itemImageDto) {
			adminBoardSqlMapper.updateItemImage(itemImageDto);
		}
		
		public Map<String, Object> getItem(int id) {
			
			Map<String, Object> map = new HashMap<>();
			
			ItemDto itemDto = adminBoardSqlMapper.selectByItemId(id);
			AdminDto adminDto = adminSqlMapper.selectByAdminId(itemDto.getAdmin_id());
			
			map.put("adminDto", adminDto);
			map.put("itemDto", itemDto);
			
			return map;
		}
}
