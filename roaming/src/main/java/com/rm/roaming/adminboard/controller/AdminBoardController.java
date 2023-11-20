package com.rm.roaming.adminboard.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.rm.roaming.adminboard.service.AdminBoardServiceImpl;
import com.rm.roaming.dto.AdminDto;
import com.rm.roaming.dto.CouponDto;
import com.rm.roaming.dto.ItemCategoryDto;
import com.rm.roaming.dto.ItemDto;
import com.rm.roaming.dto.ItemImageDto;

@Controller
@RequestMapping("/adminboard/*")
public class AdminBoardController {

	@Autowired
	private AdminBoardServiceImpl adminBoardService;
	
	// 관리자 메인페이지
	@RequestMapping("adminMainPage")
	public String adminMainPage() {
		
		return "adminboard/adminMainPage";
	}
	// 관리자 쿠폰관리 페이지
	@RequestMapping("manageCouponPage")
	public String manageCouponPage(Model model, @RequestParam(value = "page", defaultValue = "1") int page,  @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
		
		List<Map<String, Object>> couponList = adminBoardService.getCouponList(page);
		int manageCouponCount = adminBoardService.manageCouponCount();
		int totalPage = (int)Math.ceil(manageCouponCount/3.0);
		
		int startPage = ((page-1)/3)*3 + 1;
		int endPage = ((page-1)/3+1)*3;
		
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		model.addAttribute("couponList", couponList);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		
		List<Map<String, Object>> notExistcouponList = adminBoardService.getNotExistCouponList(pageNum);
		int notExistManageCouponCount = adminBoardService.notExistManageCouponCount();
		int totalPage2 = (int)Math.ceil(notExistManageCouponCount/3.0);
		
		int startPage2 = ((pageNum-1)/3)*3 + 1;
		int endPage2 = ((pageNum-1)/3+1)*3;
		
		if(endPage2 > totalPage2) {
			endPage2 = totalPage2;
		}
		
		model.addAttribute("notExistcouponList", notExistcouponList);
		model.addAttribute("totalPage2", totalPage2);
		model.addAttribute("currentPage2", pageNum);
		model.addAttribute("startPage2", startPage2);
		model.addAttribute("endPage2", endPage2);
		
		return "adminboard/manageCouponPage";
	}
	
	// 쿠폰생성 페이지
	@RequestMapping("produceCouponPage")
	public String produceCouponPage() {
		
		return "adminboard/produceCouponPage";
	}
	
	// 쿠폰생성 프로세스
	@RequestMapping("produceCouponProcess")
	public String produceCouponProcess(HttpSession session, CouponDto couponDto, MultipartFile[] image) {
		
		if(image != null) {
			
			for(MultipartFile multipartFile : image) {
				
				if(multipartFile.isEmpty()) {
					continue;
				}
				
				String rootFolder = "/Users/sungjun/uploadFiles/";
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String today = sdf.format(new Date());
				
				File targetFolder = new File(rootFolder + today);
				
				if(!targetFolder.exists()) {
					targetFolder.mkdirs();
				}
				
				String fileName = UUID.randomUUID().toString();
				fileName += "_" + System.currentTimeMillis();
				
				String originalFileName = multipartFile.getOriginalFilename();
				
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
				
				String saveFileName = today + "/" + fileName + ext;
				
				try {
					multipartFile.transferTo(new File(rootFolder + saveFileName));
					
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				couponDto.setCoupon_image(saveFileName);
			}
		}
		
		
		AdminDto sessionAdmin = (AdminDto)session.getAttribute("sessionAdmin");
		
		int adminId = sessionAdmin.getId();
		couponDto.setAdmin_id(adminId);
		
		adminBoardService.produceCoupon(couponDto);
		
		return "redirect:./manageCouponPage";	
	}
	
	// 쿠폰 삭제 프로세스
	@RequestMapping("deleteCouponProcess")
	public String deleteCouponProcess(CouponDto couponDto) {
		
		adminBoardService.deleteCoupon(couponDto);
		
		return "redirect:./manageCouponPage";
	}
	
	// 쿠폰 수정 페이지
	@RequestMapping("updateCouponPage")
	public String updateCouponPage(Model model, int id) {
		
		Map<String, Object> map = adminBoardService.getCoupon(id);
		model.addAttribute("data", map);
		
		return "adminboard/updateCouponPage";
	}
	
	// 쿠폰 수정 프로세스
	@RequestMapping("updateCouponProcess")
	public String updateCouponProcess(CouponDto couponDto, MultipartFile[] image) {
		
		if(image != null) {
			
			for(MultipartFile multipartFile : image) {
				
				if(multipartFile.isEmpty()) {
					continue;
				}
				
				String rootFolder = "/Users/sungjun/uploadFiles/";
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String today = sdf.format(new Date());
				
				File targetFolder = new File(rootFolder + today);
				
				if(!targetFolder.exists()) {
					targetFolder.mkdirs();
				}
				
				String fileName = UUID.randomUUID().toString();
				fileName += "_" + System.currentTimeMillis();
				
				String originalFileName = multipartFile.getOriginalFilename();
				
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
				
				String saveFileName = today + "/" + fileName + ext;
				
				try {
					multipartFile.transferTo(new File(rootFolder + saveFileName));
					
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				couponDto.setCoupon_image(saveFileName);
			}
		}
		
		adminBoardService.updateCoupon(couponDto);
		
		return "redirect:./manageCouponPage";
	}
	
	
	// 상품등록 페이지
	@RequestMapping("itemRegisterPage")
	public String itemRegisterPage(Model model) {
		List<ItemCategoryDto> category = adminBoardService.getCategory();
		
		model.addAttribute("category", category);
		
		
		return "adminboard/itemRegisterPage";
	}
	
	// 상품등록 프로세스
	@RequestMapping("itemRegisterProcess")
	public String itemRegisterProcess(HttpSession session, ItemDto itemDto, @RequestParam("images") MultipartFile[] image, @RequestParam("item_thumbnails") MultipartFile[] item_thumbnail) {
		
		List<ItemImageDto> itemImageDtoList = new ArrayList<>();
		
		if(image != null) {
			
			for(MultipartFile multipartFile : image) {
				
				if(multipartFile.isEmpty()) {
					continue;
				}
				
				String rootFolder = "/Users/sungjun/uploadFiles/";
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String today = sdf.format(new Date());
				
				File targetFolder = new File(rootFolder + today);
				
				if(!targetFolder.exists()) {
					targetFolder.mkdirs();
				}
				
				String fileName = UUID.randomUUID().toString();
				fileName += "_" + System.currentTimeMillis();
				
				String originalFileName = multipartFile.getOriginalFilename();
				
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
				
				String saveFileName = today + "/" + fileName + ext;
				
				try {
					multipartFile.transferTo(new File(rootFolder + saveFileName));
					
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				ItemImageDto itemImageDto = new ItemImageDto();
				itemImageDto.setImage(saveFileName);
				
				itemImageDtoList.add(itemImageDto);
			}
		}
		
		
		if(item_thumbnail != null) {
			
			for(MultipartFile multipartFile : item_thumbnail) {
				
				if(multipartFile.isEmpty()) {
					continue;
				}
				
				String rootFolder = "/Users/sungjun/uploadFiles/";
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String today = sdf.format(new Date());
				
				File targetFolder = new File(rootFolder + today);
				
				if(!targetFolder.exists()) {
					targetFolder.mkdirs();
				}
				
				String fileName = UUID.randomUUID().toString();
				fileName += "_" + System.currentTimeMillis();
				
				String originalFileName = multipartFile.getOriginalFilename();
				
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
				
				String saveFileName = today + "/" + fileName + ext;
				
				try {
					multipartFile.transferTo(new File(rootFolder + saveFileName));
					
				}catch(Exception e) {
					e.printStackTrace();
				}
		
				
				itemDto.setItem_thumbnail(saveFileName);
				
			}
		

		}
			
			AdminDto sessionAdmin = (AdminDto)session.getAttribute("sessionAdmin");
			
			int adminId = sessionAdmin.getId();
			itemDto.setAdmin_id(adminId);
			
			adminBoardService.itemRegister(itemDto, itemImageDtoList);
			
			
			return "redirect:./manageItemPage";
	}
	
	// 상품관리 조회
		@RequestMapping("manageItemPage")
		public String manageItemPage(Model model) {
			
			List<Map<String, Object>> itemList = adminBoardService.getItemList();
			
			model.addAttribute("itemList", itemList);
			
			return "adminboard/manageItemPage";
		}
	
	// 상품삭제
		@RequestMapping("deleteItemProcess")
		public String deleteItemProcess(int id) {
			
			adminBoardService.deleteItem(id);
			
			return "redirect:./manageItemPage";
		}
		
	// 상품수정 페이지
		@RequestMapping("updateItemPage")
		public String updateItemPage(Model model, int id) {
			
			List<ItemCategoryDto> category = adminBoardService.getCategory();
			
			Map<String, Object> map = adminBoardService.getItem(id);
			
			model.addAttribute("data", map);
			model.addAttribute("category", category);
			
			return "adminboard/updateItemPage";
		}
		
	// 상품수정 프로세스
		@RequestMapping("updateItemProcess")
		public String updateItemProcess(ItemDto itemDto, ItemImageDto itemImageDto, @RequestParam("images") MultipartFile[] image, @RequestParam("item_thumbnails") MultipartFile[] item_thumbnail ) {
			
			if(image != null) {
				
				for(MultipartFile multipartFile : image) {
					
					if(multipartFile.isEmpty()) {
						continue;
					}
					
					String rootFolder = "/Users/sungjun/uploadFiles/";
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
					String today = sdf.format(new Date());
					
					File targetFolder = new File(rootFolder + today);
					
					if(!targetFolder.exists()) {
						targetFolder.mkdirs();
					}
					
					String fileName = UUID.randomUUID().toString();
					fileName += "_" + System.currentTimeMillis();
					
					String originalFileName = multipartFile.getOriginalFilename();
					
					String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
					
					String saveFileName = today + "/" + fileName + ext;
					
					try {
						multipartFile.transferTo(new File(rootFolder + saveFileName));
						
					}catch(Exception e) {
						e.printStackTrace();
					}
					
					
					itemImageDto.setImage(saveFileName);
					
				}
			}
			
			
			if(item_thumbnail != null) {
				
				for(MultipartFile multipartFile : item_thumbnail) {
					
					if(multipartFile.isEmpty()) {
						continue;
					}
					
					String rootFolder = "/Users/sungjun/uploadFiles/";
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
					String today = sdf.format(new Date());
					
					File targetFolder = new File(rootFolder + today);
					
					if(!targetFolder.exists()) {
						targetFolder.mkdirs();
					}
					
					String fileName = UUID.randomUUID().toString();
					fileName += "_" + System.currentTimeMillis();
					
					String originalFileName = multipartFile.getOriginalFilename();
					
					String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
					
					String saveFileName = today + "/" + fileName + ext;
					
					try {
						multipartFile.transferTo(new File(rootFolder + saveFileName));
						
					}catch(Exception e) {
						e.printStackTrace();
					}
			
					
					itemDto.setItem_thumbnail(saveFileName);
					
				}
			}
			
			adminBoardService.updateItem(itemDto);
			adminBoardService.updateItemImage(itemImageDto);
			
			return "redirect:./manageItemPage";
		}
	
	
}
