package com.rm.roaming.facebook.controller;

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

import com.rm.roaming.dto.FeedCommentDto;
import com.rm.roaming.dto.FeedDto;
import com.rm.roaming.dto.FeedImageDto;
import com.rm.roaming.dto.FeedLikesDto;
import com.rm.roaming.dto.ReelsDto;
import com.rm.roaming.dto.UserDto;
import com.rm.roaming.facebook.service.FacebookServiceImpl;

@Controller
@RequestMapping("/facebook/*")
public class FacebookController {
	@Autowired
	private FacebookServiceImpl facebookService;
	
	@RequestMapping("facebookMain")
	public String facebookMainPage(Model model, ReelsDto reelsDto) {
		
		
		return "facebook/facebookMain";
	}
	@RequestMapping("makeFeedPage")
	public String makeFeed(HttpSession session) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) return "redirect:../user/loginPage";
		return "facebook/makeFeedPage";
	}
	@RequestMapping("feedRegisterComplete")
	public String feedRegisterComplete(HttpSession session, FeedDto feedDto,
			FeedImageDto feedImageDto, MultipartFile[] feedImageFiles
			) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) return "redirect:../user/loginPage";
		List<FeedImageDto> feedImageDtoList = new ArrayList<>();
		if(feedImageFiles != null) {
			for(MultipartFile multipartFile : feedImageFiles) {
				if(multipartFile.isEmpty()) {
					continue;
				}
				String rootFolder = "/Users/proxy/uploadFiles/";
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
				} catch(Exception e) {
					e.printStackTrace();
				}
				FeedImageDto feedImageDtoo = new FeedImageDto();
				feedImageDtoo.setFeed_image(saveFileName);
				feedImageDtoList.add(feedImageDtoo);
			}
			int userId = sessionUser.getId();
			feedDto.setUser_id(userId);
			facebookService.makeFeedRegistration(feedDto, feedImageDtoList);
			
		}
		return "facebook/feedRegisterComplete";
	}
	@RequestMapping("feedMain")
	public String feedMainPage(Model model) {
		//model에 두가지 담기	
		model.addAttribute("list", facebookService.selectFeedMain());
		return "facebook/feedMain";
	}
	@RequestMapping("feedMainPu")
	public String feedMainPagePu(Model model) {
		//model에 두가지 담기	
		model.addAttribute("list", facebookService.selectFeedMain());
		return "facebook/feedMainPu";
	}
	@RequestMapping("feedDetailPage")
	public String feedDetailPage(HttpSession session, int id, Model model) {
		//피드 작성자, 시간, 위치, 상세 사진들, 좋아요, 댓글
		model.addAttribute("mapt", facebookService.selectFeedImageAll(id));
		model.addAttribute("map", facebookService.selectFeedDetail(id));
		List<Map<String, Object>> list = facebookService.selectFeedComment(id);
		model.addAttribute("list", list);
		model.addAttribute("listu", facebookService.selectFeedUsers(id));
		model.addAttribute("count", facebookService.feedLikesShow());
		model.addAttribute("hates", facebookService.feedHatesShow());
		model.addAttribute("string", facebookService.selectFeedDate(id));
		model.addAttribute("id", id);
		return "facebook/feedDetailPage";
	}
	@RequestMapping("feedLikes")
	public String feedLikes(FeedLikesDto feedLikesDto, HttpSession session, int id, Model model) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) return "user/loginPage";
		feedLikesDto.setUser_id(sessionUser.getId());
		feedLikesDto.setFeed_id(id);
		facebookService.insertLikes(feedLikesDto);
		model.addAttribute("id", id);
		return "redirect:./feedDetailPage";
	}
	@RequestMapping("feedHates")
	public String feedHates(FeedLikesDto feedLikesDto, HttpSession session, int id, Model model) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) return "user/loginPage";
		feedLikesDto.setUser_id(sessionUser.getId());
		feedLikesDto.setFeed_id(id);
		facebookService.insertHates(feedLikesDto);
		model.addAttribute("id", id);
		return "redirect:./feedDetailPage";
	}
	@RequestMapping("feedWritePage")
	public String feedWritePage(HttpSession session, int id, Model model) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) return "user/loginPage";
		model.addAttribute("id", id);
		return "facebook/feedWritePage";
	}
	@RequestMapping("feedWriteComplete")
	public String feedWriteComplete(HttpSession session, int id, FeedCommentDto feedCommentDto, Model model, FeedDto feedDto) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		int userId = sessionUser.getId();
		feedCommentDto.setUser_comment_id(userId);
		feedCommentDto.setFeed_id(id);
		facebookService.insertFeedComment(feedCommentDto);
		model.addAttribute("id", id);
		return "facebook/feedWriteComplete";
	}
	@RequestMapping("makeReelsPage")
	public String makeReels(HttpSession session) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) return "redirect:../user/loginPage";
		return "facebook/makeReelsPage";
	}
	@RequestMapping("reelsRegisterComplete")
	public String reelsRegisterComplete(HttpSession session, ReelsDto reelsDto, MultipartFile reelsFile) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) return "user/loginPage";

		if(reelsFile != null) {
			String rootFolder = "/Users/proxy/uploadFiles/";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String today = sdf.format(new Date());
			File targetFolder = new File(rootFolder + today);
			if(!targetFolder.exists()) {
				targetFolder.mkdirs();
			}
			String fileName = UUID.randomUUID().toString();
			fileName += "_" + System.currentTimeMillis();
			String originalFileName = reelsFile.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			String saveFileName = today + "/" + fileName + ext;
			try {
				reelsFile.transferTo(new File(rootFolder + saveFileName));
			} catch(Exception e) {
				e.printStackTrace();
			}
			reelsDto.setReels_video(saveFileName);
		}
		int userId = sessionUser.getId();
		reelsDto.setUser_id(userId);
		facebookService.makeReelsRegistration(reelsDto);
		return "facebook/reelsRegisterComplete";
	}
	@RequestMapping("reelsMainPage")
	public String reelsMainPage(Model model, ReelsDto reelsDto) {
		model.addAttribute("list", facebookService.selectReels(reelsDto));

		return "facebook/reelsMainPage";
	}
	@RequestMapping("myPage")
	public String facebookMyPage(HttpSession session, Model model) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) return "user/loginPage";
		int userId = sessionUser.getId();
		model.addAttribute("map", facebookService.selectUserImgDefault(userId));
		model.addAttribute("count", facebookService.selectMyFeedCount(userId));
		model.addAttribute("list", facebookService.selectMyFeed(userId));
		return "facebook/myPage";
	}
	@RequestMapping("myPageChange")
	public String myPageChange(HttpSession session, Model model) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) return "user/loginPage";
		model.addAttribute("map", facebookService.selectUserImgDefault(sessionUser.getId()));
		return "facebook/myPageChange";
	}
	@RequestMapping("myPageChangeComplete")
	public String myPageChangeComplete(HttpSession session, UserDto userDto, @RequestParam("userFile")MultipartFile userFile) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) return "user/loginPage";
		if(!userFile.isEmpty()) {
			String rootFolder = "/Users/proxy/uploadFiles/";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String today = sdf.format(new Date());
			File targetFolder = new File(rootFolder + today);
			if(!targetFolder.exists()) {
				targetFolder.mkdirs();
			}
			String fileName = UUID.randomUUID().toString();
			fileName += "_" + System.currentTimeMillis();
			String originalFileName = userFile.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			String saveFileName = today + "/" + fileName + ext;
			try {
				userFile.transferTo(new File(rootFolder + saveFileName));
			} catch(Exception e) {
				e.printStackTrace();
			}
			userDto.setProfile_img(saveFileName);
		}
		userDto.setId(sessionUser.getId());
		facebookService.updateUserImg(userDto);
		return "redirect:../facebook/myPageChange";
	}
	@RequestMapping("myPageUser")
	public String myPageUser(int userId, Model model) {
		model.addAttribute("map", facebookService.selectUserImage(userId));
		model.addAttribute("list", facebookService.selectMyFeed(userId));
		model.addAttribute("count", facebookService.selectMyFeedCount(userId));
		model.addAttribute("userId", userId);
		model.addAttribute("follow", facebookService.selectFollow(userId));
		model.addAttribute("follower", facebookService.selectFollower(userId));
		return "facebook/myPageUser";
	}
}