package com.rm.roaming.usercsboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rm.roaming.dto.AdminDto;
import com.rm.roaming.dto.QaBoardDto;
import com.rm.roaming.dto.QaBoardImageDto;
import com.rm.roaming.dto.QaCategoryDto;
import com.rm.roaming.dto.QaRecommendDto;

public interface UserCsSqlMapper {
	
	// QA 글쓰기
	public int createQaBoardPk(); // QA게시글, 이미지 동시 삽입을 위한 PK 생성
	public void insertQaContent(QaBoardDto params); //QA게시글 내용 DB저장
	public void insertQaBoardImage(QaBoardImageDto params); //QA게시글 이미지 DB저장
	
	// QA 목록조회
	public List<QaBoardDto> selectAllQaBoard(@Param("page") int page, @Param("searchType") String searchType, @Param("searchWord") String searchWord); //page범위 QA게시글 목록 DB조회
	public int getQaBoardCount(@Param("searchType") String searchType, @Param("searchWord") String searchWord); // QA게시글 총갯수 
	
	// QA 내용조회
	public QaBoardDto selectQaBoardByID(int id); //QA게시글 내용 DB조회
	public List<QaBoardImageDto> selectImagesById(int id); //QA게시글 이미지 DB조회
	public QaCategoryDto selectCategoryById(int category_id); //QA게시글 카테고리 DB조회
	public AdminDto selectAdminByid(int adminId);//QA게시글 admin DB조회
	
	// QA 카테고리 조회
	public List<QaCategoryDto> selectAllCategory();
	
	// QA 최신
	public int recentQaBoardById(int id);
	
	// QA 조회수
	public void increaseQaReadCount(int id);
	
	// QA 추천
	public QaRecommendDto selectQaRecommendById(QaRecommendDto params);
	public void insertQaRecommend(QaRecommendDto params);
	public void increaseQaRecommendCount(int id); // 게시글 추천수 증가
	
	// QA BEST 5
	public List<QaBoardDto> selectBestFive();
	
	// QA 수정
	public void updateQaBoardById(QaBoardDto params);
	
	// QA 삭제
	public void deleteQaBoardById(int id);

}
