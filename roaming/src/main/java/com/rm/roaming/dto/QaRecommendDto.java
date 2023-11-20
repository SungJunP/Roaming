package com.rm.roaming.dto;

public class QaRecommendDto {
	private int id;
	private int user_id;
	private int qa_board_id;
	private String qa_recommend;
	
	public QaRecommendDto() {
		super();
	}

	public QaRecommendDto(int id, int user_id, int qa_board_id, String qa_recommend) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.qa_board_id = qa_board_id;
		this.qa_recommend = qa_recommend;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getQa_board_id() {
		return qa_board_id;
	}

	public void setQa_board_id(int qa_board_id) {
		this.qa_board_id = qa_board_id;
	}

	public String getQa_recommend() {
		return qa_recommend;
	}

	public void setQa_recommend(String qa_recommend) {
		this.qa_recommend = qa_recommend;
	}
	
	
}
