package com.rm.roaming.usercsboard.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.rm.roaming.dto.QaBoardDto;
import com.rm.roaming.dto.QaBoardImageDto;
import com.rm.roaming.dto.QaCategoryDto;
import com.rm.roaming.dto.QaRecommendDto;
import com.rm.roaming.dto.UserDto;
import com.rm.roaming.usercsboard.service.UserCsServiceImpl;

@Controller
@RequestMapping("/usercsboard/*")
public class UserCsController {
	
	@Autowired
	private UserCsServiceImpl userCsService;	
	
	//사용자 메인 페이지
	@RequestMapping("mainPage")
	public String mainPage() {
		return "usercsboard/mainPage";
	}
	
	//사용자 page범위 QA 게시판목록 
	@RequestMapping("qaBoardPage")				
	public String qaBoardPage(Model model, 
			@RequestParam(value = "page", defaultValue = "1") int page,
			String searchType, String searchWord) {
		//변수명이랑 파라미터 명이 동일할필요x 매핑, 외부에서 aa라는 변수 보낸것을 page로 바꿔서 넣어주겠다. 파라메터가 안날라오는 경우에는 1로 세팅해준다.
		List<Map<String,Object>> qaList = userCsService.getQaBoardList(page,searchType, searchWord);
		List<Map<String, Object>> bestFive = userCsService.getBestFiveQa();
		
		//html escape & enter
		for(Map<String,Object> qaBoards : qaList) {
			QaBoardDto qaBoard = (QaBoardDto) qaBoards.get("qaBoard");
			String qa_title = qaBoard.getQa_title();
			
			qa_title = StringEscapeUtils.escapeHtml4(qa_title);
			
			qaBoard.setQa_title(qa_title);
		}
		
		//페이징
		int qaBoardCount = userCsService.getQaBoardCount(searchType, searchWord);
		int totalPage = (int) Math.ceil(qaBoardCount/5.0);
		
		int startPage = ((page-1)/5)*5 + 1;
		int endPage = ((page-1)/5)*5 + 5;
		
		if(endPage>totalPage) {
			endPage = totalPage;
		}
		
		//카테고리
		List<QaCategoryDto> category = userCsService.getAllCategory();
		
		model.addAttribute("qaList", qaList);
		model.addAttribute("bestFive", bestFive);
		model.addAttribute("category", category);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		String searchQueryString = "";
		if(searchType != null && searchWord != null) {
			searchQueryString += "&searchType=" + searchType;
			searchQueryString += "&searchWord=" + searchWord;
		}
		
		model.addAttribute("searchQueryString", searchQueryString);
		
		return "usercsboard/qaBoardPage";
	}
	
	//사용자 QA 게시글내용 읽기 Page
	@RequestMapping("readQaBoardPage")
	public String readQaBoardPage(Model model, HttpSession session, int id) {
		userCsService.increaseQaReadCount(id);
		
		Map<String,Object> qaContent = userCsService.getQaBoard(id);
		
		//html escape & enter
		QaBoardDto qaBoard = (QaBoardDto) qaContent.get("qaBoard");
		String qa_content = qaBoard.getQa_content();
		String qa_title = qaBoard.getQa_title();
		
		qa_content = StringEscapeUtils.escapeHtml4(qa_content);
		qa_title = StringEscapeUtils.escapeHtml4(qa_title);
		if(qa_content !=null) {
		qa_content = qa_content.replaceAll("\n", "<br>");
		}
		qaBoard.setQa_content(qa_content);
		qaBoard.setQa_title(qa_title);
		
		// 추천 테이블 조회
		
		UserDto userDto = (UserDto) session.getAttribute("sessionUser");
		if(userDto != null) {
		QaRecommendDto params = new QaRecommendDto();
		params.setUser_id(userDto.getId());
		params.setQa_board_id(id);
		QaRecommendDto qaRecommend =userCsService.getQaRecommendById(params);
		
		model.addAttribute("qaRecommend", qaRecommend);
		}
		model.addAttribute("qaContent", qaContent);
		return "usercsboard/readQaBoardPage";
	}
	
	//사용자 QA 게시글 추천Process
	@RequestMapping("increaseRecommendProcess")
	public String increaseRecommendProcess(HttpSession session, int id) {
			UserDto userDto = (UserDto) session.getAttribute("sessionUser");
			
			QaRecommendDto params = new QaRecommendDto();
			params.setUser_id(userDto.getId());
			params.setQa_board_id(id);
			
			userCsService.doQaRecommend(params);
			userCsService.increaseQaRecommendCount(id);
		return "redirect:../usercsboard/readQaBoardPage?id=" + id;
	}
	
	//사용자 QA 게시글 쓰기Page
	@RequestMapping("writeQaBoardPage")
	public String writeQaBoardPage(Model model) {
		List<QaCategoryDto> category = userCsService.getAllCategory();
		model.addAttribute("category", category);
		return "usercsboard/writeQaBoardPage";
	}
	
	//사용자 QA 게시글 쓰기Process (내용,image업로드)
	@RequestMapping("writeQaBoardProcess")
	public String writeQaBoardProcess(QaBoardDto params, MultipartFile[] image_link) {
		
		List<QaBoardImageDto> images = new ArrayList<>();

		// 상세 파일 저장 로직
		if(image_link !=null) {

			for(MultipartFile multipartFile : image_link) {
				
				if(multipartFile.isEmpty()) {
					continue;
				}
					
				System.out.println("파일명 : " + multipartFile.getOriginalFilename());
				
				String rootFolder = "/Users/proxy/uploadFiles/";
				
				// 상세 날짜별 폴더 생성 로직
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String today= sdf.format(new Date());
				
				File targetFolder = new File(rootFolder+today); // C:/uploadImageFiles/2023/06/02
				
				if(!targetFolder.exists()) {
					targetFolder.mkdirs();
				}
							
				// 상세 파일 저장 파일명 만들기.
				String fileName = UUID.randomUUID().toString();
				fileName += "_" + System.currentTimeMillis();
				
				// 확장자 추출
				String originalFileName = multipartFile.getOriginalFilename();
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
				
				String saveFileName = today + "/" + fileName + ext;
				
				try {
					multipartFile.transferTo(new File(rootFolder + saveFileName));
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				QaBoardImageDto qaBoardImageDto = new QaBoardImageDto();
				qaBoardImageDto.setImage_link(saveFileName);
				
				images.add(qaBoardImageDto);
			}
		}
		
		userCsService.writeQaBoard(params, images);
		return "redirect:../usercsboard/qaBoardPage";
	}
	
	//사용자 QA 게시글 수정Page
	@RequestMapping("updateQaBoardPage")
	public String updateQaBoardPage(Model model, int id) {
		Map<String,Object> qaContent = userCsService.getQaBoard(id);
		model.addAttribute("qaContent", qaContent);
		return "usercsboard/updateQaBoardPage";
	}
	
	//사용자 QA 게시글 수정Process
	@RequestMapping("updateQaBoardProcess")
	public String updateQaBoardProcess(QaBoardDto params) {
		
			userCsService.updateQaBoardById(params);
			
		return "redirect:../usercsboard/qaBoardPage";
	}
	
	//사용자 QA 게시글 삭제Process 
	@RequestMapping("deleteQaBoardProcess")
	public String deleteQaBoardProcess(int id) {
			userCsService.deleteQaBoardById(id);
		return "redirect:../usercsboard/qaBoardPage";
	}
}
