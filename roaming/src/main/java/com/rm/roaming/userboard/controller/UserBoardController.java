package com.rm.roaming.userboard.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rm.roaming.dto.FriendDto;
import com.rm.roaming.dto.FriendGroupDto;
import com.rm.roaming.dto.FriendRequestDto;
import com.rm.roaming.dto.ItemBuyDto;
import com.rm.roaming.dto.ItemReviewDto;
import com.rm.roaming.dto.KakaoDto;
import com.rm.roaming.dto.PointDto;
import com.rm.roaming.dto.UserAddressDto;
import com.rm.roaming.dto.UserCouponDto;
import com.rm.roaming.dto.UserDto;
import com.rm.roaming.userboard.service.UserBoardServiceImpl;


@Controller
@RequestMapping("/userboard/*")
public class UserBoardController {
	@Autowired
	private UserBoardServiceImpl userBoardService;
	@RequestMapping("mainPage")
	public String mainPage() {
		return "userboard/mainPage";
	}
	@RequestMapping("myPage")
	public String myPage(HttpSession session) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) return "user/loginPage";
		return "userboard/myPage";
	}
	// 쿠폰 리스트 페이지
		@RequestMapping("couponListPage")
		public String couponListPage(Model model, HttpSession session) {
			
			UserDto userDto = (UserDto) session.getAttribute("sessionUser");
			
			int userId = userDto.getId();
			
			List<Map<String, Object>> couponList = userBoardService.getCouponList(userId);
			
			model.addAttribute("couponList", couponList);
			
			return "userboard/couponListPage";
		}
		
		// 쿠폰 리스트 프로세스
		@RequestMapping("couponListProcess")
		public String couponListProcess(UserCouponDto userCouponDto) {
			
			userBoardService.userCouponAdd(userCouponDto);
			
			return "redirect:./couponListPage";
		}
		

		// 내 쿠폰함 페이지
		@RequestMapping("userCouponPage")
		public String userCouponPage(Model model, HttpSession session, @RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
			
			UserDto userDto = (UserDto)session.getAttribute("sessionUser");
			
			int userId = userDto.getId();
			
			List<Map<String, Object>> userCouponList = userBoardService.getUserCouponList(userId,page);
			
			int userCouponCount = userBoardService.userCouponCount(userId);
			int totalPage = (int)Math.ceil(userCouponCount/3.0);
			
			int startPage = ((page - 1) / 3) * 3 + 1;
			int endPage = ((page - 1) / 3 + 1) * 3;
			
			if(endPage > totalPage) {
				endPage = totalPage;
			}
			
			model.addAttribute("userCouponList", userCouponList);
			model.addAttribute("totalPage", totalPage);
			model.addAttribute("currentPage", page);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			
			
			List<Map<String, Object>> notExistUserCouponList = userBoardService.getNotExistUserCouponList(userId,pageNum);
			
			int notExistUserCouponCount = userBoardService.notExistUserCouponCount(userId);
			int totalPage2 = (int)Math.ceil(notExistUserCouponCount/3.0);
			
			int startPage2 = ((pageNum - 1) / 3) * 3 + 1;
			int endPage2 = ((pageNum - 1)/ 3 + 1) * 3;
			
			if(endPage2 > totalPage2) {
				endPage2 = totalPage2;
			}
			
			model.addAttribute("notExistUserCouponList", notExistUserCouponList);
			model.addAttribute("totalPage2", totalPage2);
			model.addAttribute("currentPage2", pageNum);
			model.addAttribute("startPage2", startPage2);
			model.addAttribute("endPage2", endPage2);
			
			return "userboard/userCouponPage";
		}
		
		// 그룹 페이지
		@RequestMapping("friendGroupPage")
		public String friendGroupPage(Model model, HttpSession session) {
			
			UserDto userDto = (UserDto)session.getAttribute("sessionUser");
			
			int userId = userDto.getId();
			
			List<Map<String, Object>> friendGroupList = userBoardService.getFriendGroupList(userId);
			List<Map<String, Object>> friendList = userBoardService.friendList(userId);
			
			
			model.addAttribute("friendGroupList", friendGroupList);
			model.addAttribute("friendList", friendList);			
			
			return "userboard/friendGroupPage";
		}
		
		// 그룹 등록 페이지
		@RequestMapping("teamAddPage")
		public String teamAddPage() {
			
			return "userboard/teamAddPage";
		
		}
		
		// 그룹 등록 프로세스
		@RequestMapping("teammAddProcess")
		public String teammAddProcess(HttpSession session, FriendGroupDto friendGroupDto) {
			UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
			
			int userId = sessionUser.getId();
			
			friendGroupDto.setUser_id(userId);
			
			userBoardService.insertFriendGroup(friendGroupDto);
			
			return "redirect:./friendGroupPage";
		
		}
		
		// 그룹 삭제 프로세스
		@RequestMapping("deleteFriendGroupProcess")
		public String deleteFriendGroupProcess(int id) {
			
			userBoardService.deleteFriendGroup(id);
			
			return "redirect:./friendGroupPage";
			
		}
		
		// 그룹명 수정 페이지 
		@RequestMapping("updateFriendGroupPage")
		public String updateFriendGroupPage(Model model, int id) {
			
			Map<String, Object> updateFriendGroup = userBoardService.getFriendGroup(id);
			
			model.addAttribute("updateFriendGroup", updateFriendGroup);
			
			return "userboard/updateFriendGroupPage";
			
		}
		
		// 그룹명 수정 프로세스
		@RequestMapping("updateFriendGroupProcess")
		public String updateFriendGroupProcess(FriendGroupDto friendGroupDto) {
			
			userBoardService.updateFriendGroup(friendGroupDto);
			
			return "redirect:./friendGroupPage";
		}
		
		// 친구 요청 등록 페이지
		@RequestMapping("friendAddPage")
		public String friendAddPage() {
			
			return "userboard/friendAddPage";
			
		}
		
		// 친구 요청 등록 프로세스
		@RequestMapping("friendAddProcess")
		public String friendAddProcess(HttpSession session, FriendRequestDto friendRequestDto, @RequestParam("user_name") String user_name) {
			
			UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
			
			int sendId = sessionUser.getId();
			
			friendRequestDto.setSend_id(sendId);
			
			userBoardService.insertFriendRequest(friendRequestDto, user_name);
			
			return "redirect:./friendGroupPage";
		}
		
		// 알림 페이지
		@RequestMapping("alarmPage")
		public String alarmPage(Model model, HttpSession session) {
			
			UserDto userDto = (UserDto)session.getAttribute("sessionUser");
			
			int userId = userDto.getId();
			
			List<Map<String, Object>> friendRequestList = userBoardService.getFriendRequestList(userId);
			
			model.addAttribute("friendRequestList", friendRequestList);
			
			return "userboard/alarmPage";
		}

		// 친구 요청 프로세스
		@RequestMapping("updateFriendRequestProcess")
		public String updateFriendRequestProcess(FriendRequestDto friendRequestDto, FriendDto friendDto) {
			
			userBoardService.updateFriendStatus(friendRequestDto, friendDto);
			userBoardService.updateFriendStatus2(friendRequestDto, friendDto);
			
			return"redirect:./alarmPage";
		}
		
		
		// 친구 그룹내 이동 페이지 
		@RequestMapping("updateFriendMovePage")
		public String updateFriendMovePage(Model model, int id) {
			
			Map<String, Object> updateFriendMove = userBoardService.getFriend(id);
			
			model.addAttribute("updateFriendMove", updateFriendMove);
			
			return "userboard/updateFriendMovePage";
			
		}
		
		// 친구 그룹내 이동 프로세스
		@RequestMapping("updateFriendMoveProcess")
		public String updateFriendMoveProcess(FriendDto friendDto, @RequestParam("group_name") String group_name) {
			
			userBoardService.updateFriendMove(friendDto, group_name);
			
			return "redirect:./friendGroupPage";
		}
		
		
		// 그룹 페이지 특정 친구 삭제
		@RequestMapping("deleteFriendProcess")
		public String deleteFriendProcess(FriendDto friendDto) {
			
			userBoardService.deleteFriend(friendDto);
			
			return "redirect:./friendGroupPage";
		}
		
		// 상품 리스트 페이지
		@RequestMapping("itemListPage")
		public String itemListPage(Model model, HttpSession session) {
			
			UserDto userDto = (UserDto) session.getAttribute("sessionUser");
			
			int userId = userDto.getId();
			
			List<Map<String, Object>> itemList = userBoardService.getItemList(userId);
			
			model.addAttribute("itemList",itemList);
			
			return "userboard/itemListPage";
		}
		
		// 상품 상세 페이지
		@RequestMapping("itemDetailPage")
		public String itemDetailPage(Model model, int id) {
			
	
			Map<String, Object> itemDetail = userBoardService.getItemDetail(id);
			
			
			
			model.addAttribute("itemDetail", itemDetail);
			model.addAttribute("itemReview", userBoardService.getItemReviewList(id));
			
			return "userboard/itemDetailPage";
		}
		
		
		// 상품 구매 페이지
		@RequestMapping("itemBuyPage")
		public String itemBuyPage(Model model, int id) {
			
			
			Map<String, Object> itemBuy = userBoardService.getItemBuy(id);
			
			model.addAttribute("itemBuy",itemBuy);
			
			return "userboard/itemBuyPage";
		}
		
		// 상품 구매 프로세스
		@RequestMapping("insertItemBuyProcess")
		public String insertItemBuyProcess(HttpSession session, UserAddressDto userAddressDto, int id, ItemBuyDto itemBuyDto, PointDto pointDto) {
			
			UserDto userDto = (UserDto)session.getAttribute("sessionUser");
			
			userAddressDto.setUser_id(userDto.getId());
			
			int addressPk = userBoardService.createAddressPk();
			userAddressDto.setId(addressPk);
			
			itemBuyDto.setItem_id(id);
			itemBuyDto.setAddress_id(addressPk);
			
			pointDto.setUser_id(userDto.getId());
			
			userBoardService.insertUserAddress(userAddressDto);
			userBoardService.insertItemBuy(itemBuyDto);
			userBoardService.insertPointStatus(pointDto);
			
			return "userboard/itemBuyCompletePage";
		}
		
		
		// 상품 구매 완료 페이지
		@RequestMapping("itemBuyCompletePage")
		public String itemBuyCompletePage() {
			
			return "userboard/itemBuyCompletePage";
		}
		
		// 주문 내역 조회
		@RequestMapping("orderHistoryPage")
		public String orderHistoryPage(Model model, HttpSession session) {
			
			UserDto userDto = (UserDto)session.getAttribute("sessionUser");
			
			int userId = userDto.getId();
			
			List<Map<String, Object>> orderHistoryList = userBoardService.getOrderHistoryList(userId);
			
			model.addAttribute("orderHistoryList",orderHistoryList);
			
			return "userboard/orderHistoryPage";
		}
		
		// 상품 리뷰 등록
		@RequestMapping("insertItemReviewProcess")
		public String insertItemReviewProcess(ItemReviewDto itemReviewDto) {
						
			
			userBoardService.insertItemReview(itemReviewDto);
			
			return "redirect:./orderHistoryPage";
		}
		
		// 상품 리뷰 등록 페이지
		@RequestMapping("writeReviewPage")
		public String writeReviewPage(Model model, int id) {
			
			model.addAttribute("id", id);
			
			return "userboard/writeReviewPage";
		}
		
		
		
		
		
		@RequestMapping("hotelPage")
		public String hotelPage() {
			return "userboard/hotelPage";
		}
		@RequestMapping("hotelInfoPage")
		public String hotelInfoPage(int id,String startDate,String endDate,int people,Model model) {
			
			model.addAttribute("startDate", startDate);
			model.addAttribute("endDate", endDate);
			model.addAttribute("people", people);
			
			return "userboard/hotelInfoPage";
		}
		
		@RequestMapping("hotelReservePage")
		public String hotelReservePage(int groupId,String startDate,String endDate,Model model) {
			model.addAttribute("info", userBoardService.getReserveInfo(groupId));
			model.addAttribute("startDate",startDate);
			model.addAttribute("endDate",endDate);
			
			return "userboard/hotelReservePage";
		}
		
		
		@RequestMapping("reserveSuccessPage")
		public String reserveSuccessPage() {

			return "userboard/reserveSuccessPage";
		}
		
		@RequestMapping("reserveCancelPage")
		public String reserveCancelPage(int hotel_id,Model model) {
			model.addAttribute("id", hotel_id);
			return "userboard/reserveCancelPage";

		}
		@RequestMapping("reserveFailPage")
		public String reserveFailPage(int hotel_id,Model model) {
			model.addAttribute("id", hotel_id);
			return "userboard/reserveCancelPage";
		}
		
		@RequestMapping("userMyPage")
		public String userMyPage() {
			return "userboard/userMyPage";
		}
		
		@RequestMapping("successReserveInfoPage")
		public String successReserveInfoPage(HttpSession session,Model model) {
			KakaoDto kakaoDto =  (KakaoDto) session.getAttribute("kakaoDto");
			String tid = kakaoDto.getTid();
			model.addAttribute("info", userBoardService.getBeforeReserve(tid));
			model.addAttribute("startDate", kakaoDto.getStartDate());
			model.addAttribute("endDate", kakaoDto.getEndDate());
			session.removeAttribute("kakaoDto");
			return "userboard/successReserveInfoPage";
		}
}
