package com.rm.roaming.admincsboard.controller;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rm.roaming.admincsboard.service.AdminCsServiceImpl;
import com.rm.roaming.dto.AdminDto;
import com.rm.roaming.dto.QaBoardDto;
import com.rm.roaming.usercsboard.service.UserCsServiceImpl;

@Controller
@RequestMapping("/admincsboard/*")
public class AdminCsController {
	
	@Autowired
	private AdminCsServiceImpl adminCsService;
	
	@Autowired
	private UserCsServiceImpl userCsService;
	
	//관리자 메인 페이지
	@RequestMapping("adminMainPage")
	public String adminMainPage() {
		
	return "admincsboard/adminMainPage";
	}
	
	//관리자 처리중 QA게시글 목록
	@RequestMapping("adminQaBoardProgressPage")
	public String adminQaBoardProgressPage(Model model, @RequestParam(value="page", defaultValue = "1" )  int page) {
		List<Map<String,Object>> qaProgressList= adminCsService.getAdminQaBoardProgress(page);
		
		//html escape & enter
		for(Map<String,Object> qaProgressBoards : qaProgressList) {
			QaBoardDto qaProgressBoard = (QaBoardDto) qaProgressBoards.get("qaProgress");
			String qa_title = qaProgressBoard.getQa_title();
			
			qa_title = StringEscapeUtils.escapeHtml4(qa_title);
			
			qaProgressBoard.setQa_title(qa_title);
		}
		
		//페이징
		int qaProgressCount = adminCsService.getProgressCount();
		int totalPage = (int) Math.ceil(qaProgressCount/5.0);
		
		int startPage = ((page-1)/5)*5 + 1;
		int endPage = ((page-1)/5)*5 + 5;
		
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		model.addAttribute("qaProgressList", qaProgressList);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		return "admincsboard/adminQaBoardProgressPage";
		}
	
	//관리자 처리완료 QA게시글 목록
	@RequestMapping("adminQaBoardCompletePage")
	public String adminQaBoardCompletePage(Model model, @RequestParam(value="page", defaultValue = "1" ) int page) {
		List<Map<String,Object>> qaCompleteList= adminCsService.getAdminQaBoardComplete(page);
		
		//html escape & enter
		for(Map<String,Object> qaCompleteBoards : qaCompleteList) {
			QaBoardDto qaCompleteBoard = (QaBoardDto) qaCompleteBoards.get("qaComplete");
			String qa_title = qaCompleteBoard.getQa_title();
			
			qa_title = StringEscapeUtils.escapeHtml4(qa_title);
			
			qaCompleteBoard.setQa_title(qa_title);
		}
		
		//페이징
		int qaCompleteCount = adminCsService.getCompleteCount();
		int totalPage = (int) Math.ceil(qaCompleteCount/5.0);
		
		int startPage = ((page-1)/5)*5 + 1;
		int endPage = ((page-1)/5)*5 + 5;
		
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		model.addAttribute("qaCompleteList", qaCompleteList);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
	return "admincsboard/adminQaBoardCompletePage";
	}
	
	//관리자 QA게시글 답변 쓰기 Page.
	@RequestMapping("writeCommentPage")
	public String writeCommentPage(Model model, int id) {
		Map<String,Object> qaContent = userCsService.getQaBoard(id);
		
		model.addAttribute("qaContent", qaContent);
		
		return "admincsboard/writeCommentPage";
	}
	
	//관리자 QA게시글 답변 Process
	@RequestMapping("writeCommentProcess")
	public String writeCommentProcess(HttpSession session, QaBoardDto qaBoardDto) {
		AdminDto adminDto = (AdminDto) session.getAttribute("sessionAdmin");
		qaBoardDto.setAdmin_id(adminDto.getId());
		adminCsService.writeComment(qaBoardDto);
		return "redirect:../admincsboard/adminQaBoardProgressPage";
	}
	
}
