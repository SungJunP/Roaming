package com.rm.roaming.admincsboard.mapper;

import java.util.List;

import com.rm.roaming.dto.QaBoardDto;

public interface AdminCsSqlMapper {
	//QA 관리자 답변 업데이트. 
	public void updateQaBoardAdminById(QaBoardDto qaBoardDto);
	
	//QA 처리중 답변 목록
	public List<QaBoardDto> selectAdminQaBoardProgress(int page);
	public int getProgressCount();
	
	//QA 처리완료 답변 목록
	public List<QaBoardDto> selectAdminQaBoardComplete(int page);
	public int getCompleteCount();
}
