package com.rm.roaming.post.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rm.roaming.dto.RequestHwangDto;
import com.rm.roaming.dto.Schedule;
import com.rm.roaming.dto.ScheduleDay;
import com.rm.roaming.post.service.PostService;

@RestController
@RequestMapping("post/*")
public class RestHwang {
	@Autowired
	private PostService postService;
	@RequestMapping("savePostSchedule")
	public Map<String, Object> savePostSchedule(String[] placeName,String[] placeAddress, String[] estimated, String[] memo,int dayNumber){
		Map<String, Object> map = new HashMap<>();
		postService.registerPostSchedule(placeName, placeAddress, estimated, memo, dayNumber);
		map.put("result", "success");
		
		
		return map;
	}
	@RequestMapping("getSaveCount")
	public Map<String, Object> getSaveCount(int post_id){
		Map<String, Object> map = new HashMap<>();
		if(postService.getFinishYesOrNo(post_id) == true) {
			map.put("result", "success");
			return map;
		}
		else map.put("result", "fail");
		return map;
	}
	
	
	@RequestMapping("saveAllPostSchedule")
	public Map<String, Object> saveAllPostSchedule(@RequestBody RequestHwangDto days){
		System.out.println("되냐");
		System.out.println(days.getDays().isEmpty());
		System.out.println(days.getDays().get(0).getDay());
		System.out.println(days.getDays().get(1).getDay());
		System.out.println(days.getDays().get(2).getDay());
		List<ScheduleDay> list = days.getDays();
		postService.registerAllPostSchedule(list);
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		return map;
	}
}
