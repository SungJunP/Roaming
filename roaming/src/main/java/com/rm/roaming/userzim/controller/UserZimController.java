package com.rm.roaming.userzim.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.rm.roaming.dto.UserDto;
import com.rm.roaming.dto.ZimSignUpDto;
import com.rm.roaming.dto.ZimSignupCategoryListDto;
import com.rm.roaming.userzim.service.UserZimService;

@RequestMapping("/userzim/*")
@Controller
public class UserZimController {
	
	@Autowired
	private UserZimService userZimService;
	
	// 짐 메인 페이지
	@RequestMapping("zimMainPage")
	public String mainPage() {
		
		return "userzim/zimMainPage";
	}
	
	// 날짜 장소 입력 페이지
	@RequestMapping("zimSignFirstPage")
	public String zimSignFirstPage() {
		
		return "userzim/zimSignFirstPage";
	}
	
	// 짐 종류 및 수량 입력 페이지
	@RequestMapping("zimSignSecondPage")
	public String zimSignSecondPage(int id, ZimSignupCategoryListDto params) {
		
		return "userzim/zimSignSecondPage";
	}
	
	// 예약 확인 페이지
	@RequestMapping("zimSignFinalPage")
	public String zimSignFinalPage() {
		
		return "userzim/zimSignFinalPage";
	}
	
	// 짐 날짜 및 장소 사진 DB 입력
	@RequestMapping("zimSignFirstProcess")
	public String zimSignFirstProcess(HttpSession session, ZimSignUpDto params, MultipartFile zimImage) {

		// 메인 파일 저장 로직
		if(zimImage!=null) {
			
			System.out.println("파일명 : " + zimImage.getOriginalFilename());
			
			String rootFolder = "C:/uploadMainFiles/";
			
			// 메인 날짜별 폴더 생성 로직
			
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String today= sdf.format(new Date());
				
				File targetFolder = new File(rootFolder+today); // C:/uploadMainFiles/2023/06/02
				
				if(!targetFolder.exists()) {
					targetFolder.mkdirs(); //mkdir말고 mkdirs해야 다만들어줌.
				}
				
				// 메인 파일 저장 파일명 만들기. 
				
				String fileName = UUID.randomUUID().toString();
				fileName += "_" + System.currentTimeMillis();
				
				// 확장자 추출
				String originalFileName = zimImage.getOriginalFilename();
				
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
				
				String saveFileName = today + "/" + fileName + ext;
				
						
			// 메인 파일 저장 파일명 만들기.
			try {
				zimImage.transferTo(new File(rootFolder + saveFileName)); //transfer to 어디파일로 저장하겠다.
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			params.setZim_image_link(saveFileName);
		}		
		

		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		if(sessionUser != null) {
		params.setUser_id(sessionUser.getId());
		
		int id = userZimService.createPK();
		params.setId(id);
		
		userZimService.insertZimSignUp(params);
		return "redirect:../userzim/zimSignSecondPage?";
		}else {
		return "userzim/zimMainPage";
		}
		
	}
	
	// 짐 종류 및 수량 입력 페이지.
	@RequestMapping("zimSignSecondProcess")
	public String zimSignSecondProcess(HttpSession session,ZimSignUpDto params) {
		System.out.println("signup프로세스2");
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		if(sessionUser != null) {
		params.setUser_id(sessionUser.getId());
		userZimService.insertZimSignUp(params);
		}
		return "redirect:../userzim/zimSignFinalPage";
	}
}
