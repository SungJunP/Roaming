package com.rm.roaming.post.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.rm.roaming.dto.DayDto;
import com.rm.roaming.dto.JoinConfirmDto;
import com.rm.roaming.dto.JoinUserDto;
import com.rm.roaming.dto.PostDto;
import com.rm.roaming.dto.PostImageDto;
import com.rm.roaming.dto.ReportDto;
import com.rm.roaming.dto.ScheduleDto;
import com.rm.roaming.dto.ScheduleRequestDto;
import com.rm.roaming.dto.UserDto;
import com.rm.roaming.post.service.PostService;


@RequestMapping("/post/*")
@Controller
public class PostController {

	@Autowired
	private PostService postService;
	
	@RequestMapping("registerPage")
	public String registerPage() {
		
		return "post/registerPage";
	}
	
	@RequestMapping("postListPage")
	public String postListPage(HttpSession session, Model model) {
		
		UserDto userDto = (UserDto)session.getAttribute("sessionUser");
		
		List<Map<String, Object>> list = postService.getPostList();

		
		model.addAttribute("list", list);
		
		return "post/postListPage";
	}
	
	@RequestMapping("postDetailPage")
	public String postDetailPage(HttpSession session, Model model, int id) {
		// 파라미터 post_id로 바꾸기, service에서 조인해서 뿌려주기.
		PostDto postDto = postService.getPostById(id);
		List<PostImageDto> postImageDto = postService.getPostImageByPostId(id);
		UserDto userDto = postService.getPostByCreateId(postDto.getCreate_id());
		List<Map<String, Object>> list = postService.getJoinUserByPostId(id);
		
			
		
		
		// 댓글
		List<Map<String, Object>> commentList = postService.getPostComment(id);
		model.addAttribute("commentList", postService.getPostComment(id));
		
		
		
		
		
		model.addAttribute("list", list);
		model.addAttribute("count", postService.joinUserCount(id));
		// 동행 꽉차면 모달 띄워주기
		

		model.addAttribute("userDto", userDto);
		model.addAttribute("postImageDto", postImageDto);
		model.addAttribute("postDto", postDto);
		model.addAttribute("sessionUser", session.getAttribute("sessionUser"));
		postService.viewsUpdate(id);
		return "post/postDetailPage";
	}
	
	
	@RequestMapping("postJoinPage")
	public String postJoinPage(HttpSession session, Model model, int id) {
		PostDto postDto = postService.getPostById(id);
		
		model.addAttribute("postDto", postDto);

		return "post/postJoinPage";
	}
	
	@RequestMapping("participationPage")
	public String participationPage() {
		// 파티참가리스트
		
		
		return "post/participationPage";
	}
	
	// 참가신청리스트
	@RequestMapping("joinConfirmPage")
	public String joinConfirmPage(HttpSession session, Model model) {
		// 참가신청 리스트
		UserDto userDto = (UserDto)session.getAttribute("sessionUser");
		System.out.println(userDto.toString());
		List<JoinConfirmDto> list = postService.selectJoinConfirm(userDto.getId());
		for (JoinConfirmDto joinConfirmDto : list) {
			System.out.println(joinConfirmDto.toString());
		}

		model.addAttribute("joinConfirmDto", list);
		
		return "post/joinConfirmPage";
	}
	
	// 게시물 신고페이지
	@RequestMapping("reportPage")
	public String reportPage(HttpSession session, Model model, ReportDto reportDto) {
		UserDto userDto = (UserDto)session.getAttribute("sessionUser");
		reportDto.setUser_id(userDto.getId());
		
		model.addAttribute("reportDto", reportDto);
		return "post/reportPage";
	}
	
	
	@RequestMapping("addSchedulePage")
	public String addSchedulePage(Model model, int id) {
		PostDto postDto = postService.getPostById(id);
		
//		날짜 변환
		Date start = postDto.getDay_start();
		Date end = postDto.getDay_end();
		long difference = Math.abs(end.getTime() - start.getTime());
		long days = TimeUnit.DAYS.convert(difference, TimeUnit.MILLISECONDS);
//		날짜변환
		
		model.addAttribute("postDto", postDto);
		model.addAttribute("days", days);
		
		return "post/addSchedulePage";
	}
	
	@RequestMapping("correctionPage")
	public String correctionPage(Model model, int id) {
		PostDto postDto = postService.getPostById(id);
		
		model.addAttribute("postDto", postDto);
		
		return "post/correctionPage";
	}
	
	
	@RequestMapping("postAddSchedultPage")
	public String postAddSchedultPage(Model model, int id) {
		PostDto postDto = postService.getPostById(id);
		
//		날짜 변환
		Date start = postDto.getDay_start();
		Date end = postDto.getDay_end();
		long difference = Math.abs(end.getTime() - start.getTime());
		long days = TimeUnit.DAYS.convert(difference, TimeUnit.MILLISECONDS);
//		날짜변환
		
		model.addAttribute("postDto", postDto);
		model.addAttribute("days", days);
		return "post/postAddSchedultPage";
	}
	
	@RequestMapping("textPlan")
	public String textPlan(Model model, int id) {
		
		List<DayDto> dayDto = postService.selectNewDay(id);
		List<Map<String, Object>> list = postService.selectScheduleDay_id(id);
		
		model.addAttribute("postId", id);
		model.addAttribute("list", list);
		model.addAttribute("dayDto", dayDto);
		return "post/textPlan";
	}
	
	@RequestMapping("testPost")
	public String testPost(int id) {
		
	
		return "post/testPost";
	}
	
	
	// Process
	
	
	
	@RequestMapping("insertProcess")
	public String insertProcess(HttpSession session, PostDto postDto, JoinUserDto joinUserDto,
			@RequestParam("post_image") MultipartFile[] post_image
			) {
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser != null) {
			postDto.setCreate_id(sessionUser.getId());
		}else {
			return "redirect:../user/loginPage";
		}
		
		if (post_image != null && post_image.length > 0) {
	        List<PostImageDto> postImageDtoList = new ArrayList<>();

	        for (MultipartFile multipartFile : post_image) {
	            if (multipartFile.isEmpty()) {
	                continue;
	            }

	            System.out.println("파일명 : " + multipartFile.getOriginalFilename());
	            String rootFolder = "/Users/su/Desktop/uploadFiles/";
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	            String today = sdf.format(new Date());
	            File targetFolder = new File(rootFolder + today);

	            if (!targetFolder.exists()) {
	                targetFolder.mkdirs();
	            }

	            String fileName = UUID.randomUUID().toString();
	            fileName += "_" + System.currentTimeMillis();
	            String originalFileName = multipartFile.getOriginalFilename();
	            String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
	            String saveFileName = today + "/" + fileName + ext;

	            try {
	                multipartFile.transferTo(new File(rootFolder + saveFileName));
	            } catch (Exception e) {
	                e.printStackTrace();
	            }

	            PostImageDto postImageDto = new PostImageDto();
	            postImageDto.setPost_image(saveFileName);
	            postImageDtoList.add(postImageDto);
	            
	        }
	       
	        
	     // 방장 파티 참가 쿼리
			
			joinUserDto.setUser_id(postDto.getCreate_id());

	        // 게시글 작성
	        postService.insertPost(postDto, postImageDtoList, joinUserDto);
		}
		return "redirect:../post/postListPage";
	}

	@RequestMapping("joinProcess")
	public String joinProcess(HttpSession session, JoinConfirmDto joinConfirmDto,
			@RequestParam("confirm_image1") MultipartFile confirm_image
			) {
		// 동행참가 구현 - sessionUser가 게시글 작성자면 예외 처리 어떻게할지?
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		System.out.println(joinConfirmDto.toString());
		joinConfirmDto.setUser_id(sessionUser.getId());
		
		if (confirm_image != null && !confirm_image.isEmpty()) {
	        System.out.println("파일명 : " + confirm_image.getOriginalFilename());
	        String rootFolder = "/Users/su/Desktop/uploadFiles/";
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	        String today = sdf.format(new Date());
	        File targetFolder = new File(rootFolder + today);

	        if (!targetFolder.exists()) {
	            targetFolder.mkdirs();
	        }

	        String fileName = UUID.randomUUID().toString();
	        fileName += "_" + System.currentTimeMillis();
	        String originalFileName = confirm_image.getOriginalFilename();
	        String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
	        String saveFileName = today + "/" + fileName + ext;

	        try {
	        	confirm_image.transferTo(new File(rootFolder + saveFileName));
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        joinConfirmDto.setConfirm_image(saveFileName);
	    }
		
		postService.insertJoinConfirm(joinConfirmDto);
		
		return "redirect:../post/postDetailPage?id=" + joinConfirmDto.getPost_id();
	}
	
	@RequestMapping("updateJoinConfirmProcess")
	public String updateJoinConfirmProcess(JoinConfirmDto joinConfirmDto) {
		postService.updatePostStatus(joinConfirmDto);
		// 중복 유저 인서트 금지 구현
		return "redirect:../post/joinConfirmPage";
	}
	
	
	
	@RequestMapping("reportProcess")
	public String reportProcess(HttpSession session, ReportDto reportDto) {
		// 신고하기 구현
		postService.insertReport(reportDto);
		return "redirect:../post/postDetailPage?id=" + reportDto.getPost_id();
	}

	
	@RequestMapping("postDayProcess")
	public String postDayProcess(PostDto postDto) {
	
		postService.updatePost(postDto);
		
		return "redirect:../post/postDetailPage?id=" + postDto.getId();
	}
	
	
	
	
	
	
//	@RequestMapping("postDayProcess")
//	public String postDayProcess(ScheduleRequestDto scheduleRequestDto) {
//		
//		
//			
//		
//		Integer[] tripDay = scheduleRequestDto.getTrip_day();
//	    
//
//	    List<Integer> orderIds = new ArrayList<>();
//	    int order_id = 1;
//
//	    for (int i = 0; i < tripDay.length; i++) {
//	        if (i > 0 && !tripDay[i].equals(tripDay[i-1])) {
//	            order_id = 1;
//	        }
//
//	        orderIds.add(order_id);
//	        order_id++;
//	        
//	    }
//
//	    scheduleRequestDto.setOrder_id(orderIds.toArray(new Integer[orderIds.size()]));
//	    System.out.println(scheduleRequestDto.toString());
//		List<ScheduleDto> scheduleList = new ArrayList<ScheduleDto>();
//				
//		for(int i = 0 ; i < scheduleRequestDto.getPost_id().length ; i++) {
//			String tripLocation = scheduleRequestDto.getTrip_location()[i];
//	        String tripMemo = scheduleRequestDto.getTrip_memo()[i];
//
//	        // trip_location과 trip_memo가 모두 null이 아닌 경우에만 저장
//	        if (tripLocation != null && tripMemo != null) {
//			
//			ScheduleDto sd = new ScheduleDto();
//			sd.setPost_id(scheduleRequestDto.getPost_id()[i]);
//			sd.setOrder_id(scheduleRequestDto.getOrder_id()[i]);
//			sd.setTrip_day(scheduleRequestDto.getTrip_day()[i]);
//			sd.setTrip_location(scheduleRequestDto.getTrip_location()[i]);
//			sd.setTrip_memo(scheduleRequestDto.getTrip_memo()[i]);
//
//			System.out.println("값 확인 : " + scheduleRequestDto.toString());
//			scheduleList.add(sd);
//		}	    
//	}
//	    postService.insertSchedule(scheduleList);
//	    
//	    
//		
//		
//		
//	    System.out.println("order_id : " + scheduleRequestDto.getOrder_id());
//	    System.out.println(scheduleRequestDto.toString());
//				
//
//			
//		
//		return "userboard/mainPage";
//			
//	}
	
//	@RequestMapping("planProcess")
//	public String planProcess(int post_id) {
//		// Rest
//		
//		postService.insertNewDay(post_id);
//		return "redirect:../post/textPlan?id=" + post_id;
//	}
	
	@RequestMapping("scheduleProcess")
	public String scheduleProcess(ScheduleDto scheduleDto, @RequestParam("post_id") int post_id) {
		System.out.println("scheduleDto : " + scheduleDto.toString());
		System.out.println("post_id = " + post_id);
		
		postService.insertSchedule(scheduleDto);
		return "redirect:../post/textPlan?id=" + post_id+ "&day_id=" + scheduleDto.getDay_id();
	}
	
	@RequestMapping("scheduleUpdateProcess")
	public String scheduleUpdateProcess(ScheduleDto scheduleDto, int post_id) {
		postService.updateSchedule(scheduleDto);
		return "redirect:../post/textPlan?id=" + post_id;
	}
	
	@RequestMapping("scheduleDeleteProcess")
	public String scheduleDeleteProcess(int id, int post_id) {
		postService.deleteSchedule(id);
		return "redirect:../post/textPlan?id=" + post_id;
	}
	
	@RequestMapping("dayDeleteProcess")
	public String dayDeleteProcess(int id, int post_id) {
		postService.deleteDayId(id);
		return "redirect:../post/textPlan?id=" + post_id;
	}
	
	
	
	
}
