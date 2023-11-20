package com.rm.roaming.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rm.roaming.admin.service.AdminServiceImpl;
import com.rm.roaming.dto.AdminDto;


@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminServiceImpl adminServiceImpl;
	
	// 관리자 회원가입 페이지
	@RequestMapping("adminRegisterPage")
	public String adminRegisterPage() {
		return "admin/adminRegisterPage";
	}
	
	// 관리자 회원가입 프로세스
	@RequestMapping("adminRegisterProcess")
	public String adminRegisterProcess(AdminDto adminDto) {
		adminServiceImpl.adminRegister(adminDto);
		return "redirect:../adminboard/adminMainPage";
	}
	
	// 관리자 로그인 페이지
	@RequestMapping("adminLoginPage")
	public String adminLoginPage() {
		return "admin/adminLoginPage";
	}
	
	// 관리자 로그인 프로세스
	@RequestMapping("adminLoginProcess")
	public String adminLoginProcess(HttpSession session, AdminDto adminDto) {
		session.setAttribute("sessionAdmin", adminServiceImpl.getAdminInfo(adminDto));
		return "redirect:../adminboard/adminMainPage";
	}
	
	// 관리자 로그아웃 프로세스
	@RequestMapping("adminLogoutProcess")
	public String adminLogoutProcess(HttpSession session) {
		session.invalidate();
		return "redirect:../adminboard/adminMainPage";
	}
	
}
