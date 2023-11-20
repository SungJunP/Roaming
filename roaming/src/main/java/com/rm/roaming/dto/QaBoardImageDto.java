package com.rm.roaming.dto;

public class QaBoardImageDto {
	private int id;
	private int qa_board_id;
	private String image_link;
	
	public QaBoardImageDto() {
		super();
	}

	public QaBoardImageDto(int id, int qa_board_id, String image_link) {
		super();
		this.id = id;
		this.qa_board_id = qa_board_id;
		this.image_link = image_link;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQa_board_id() {
		return qa_board_id;
	}

	public void setQa_board_id(int qa_board_id) {
		this.qa_board_id = qa_board_id;
	}

	public String getImage_link() {
		return image_link;
	}

	public void setImage_link(String image_link) {
		this.image_link = image_link;
	}
	
	
}
