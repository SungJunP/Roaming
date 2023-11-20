package com.rm.roaming.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rm.roaming.dto.UserDto;
import com.rm.roaming.user.service.UserServiceImpl;

@Controller
@RequestMapping("/user/*")
public class UserController {
	@Autowired
	private UserServiceImpl userServiceImpl;
	
	// 유저 회원가입 페이지
	@RequestMapping("userRegisterPage")
	public String userRegisterPage() {
		return "user/userRegisterPage";
	}
	// 유저 회원가입 프로세스
	@RequestMapping("userRegisterProcess")
	public String userRegisterProcess(UserDto userDto) {
		userServiceImpl.userRegister(userDto);
		return "redirect:../userboard/mainPage";
	}
	
	// 유저 로그인 페이지
	@RequestMapping("loginPage")
	public String loginPage() {
		return "user/loginPage";
	}
	
	// 유저 로그인 프로세스
	@RequestMapping("loginProcess")
	public String loginProcess(UserDto userDto,HttpSession session) {
		session.setAttribute("sessionUser", userServiceImpl.getUserInfo(userDto));
	
		return "redirect:../userboard/mainPage";
	}
	
	// 유저 로그아웃 프로세스
	@RequestMapping("logoutProcess")
	public String logoutProcess(HttpSession session) {
		session.invalidate();
		return "redirect:../userboard/mainPage";
	}
	
	
}
