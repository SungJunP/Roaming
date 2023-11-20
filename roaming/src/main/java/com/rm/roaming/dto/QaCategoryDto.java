package com.rm.roaming.dto;

public class QaCategoryDto {
	private int id;
	private String qa_category_name;
	
	public QaCategoryDto() {
		super();
	}

	public QaCategoryDto(int id, String qa_category_name) {
		super();
		this.id = id;
		this.qa_category_name = qa_category_name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getQa_category_name() {
		return qa_category_name;
	}

	public void setQa_category_name(String qa_category_name) {
		this.qa_category_name = qa_category_name;
	}
	
	
}
