package com.rm.roaming.dto;

import java.util.Date;

public class PostImageDto {

	private int id;
	private int post_id;
	private String post_image;
	private Date reg_date;
	
	public PostImageDto() {
		// TODO Auto-generated constructor stub
	}

	public PostImageDto(int id, int post_id, String post_image, Date reg_date) {
		super();
		this.id = id;
		this.post_id = post_id;
		this.post_image = post_image;
		this.reg_date = reg_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public String getPost_image() {
		return post_image;
	}

	public void setPost_image(String post_image) {
		this.post_image = post_image;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "PostImageDto [id=" + id + ", post_id=" + post_id + ", post_image=" + post_image + ", reg_date="
				+ reg_date + "]";
	}
	
	
}
	