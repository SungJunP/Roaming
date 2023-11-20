package com.rm.roaming.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rm.roaming.dto.UserDto;
import com.rm.roaming.user.service.UserServiceImpl;

@RestController
@RequestMapping("user/*")
public class RestUserController {
	@Autowired
	private UserServiceImpl userService;
	@RequestMapping("getMyId")
	public Map<String, Object> getMyId(HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "로그인 안되있음..");
		} else {
			map.put("result", "success");
			map.put("id", sessionUser.getId());
		}
		return map;
	}
}
