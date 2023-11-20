package com.rm.roaming.dto;

import java.util.Date;

public class PostLikeDto {
	private int id;
	private int post_id;
	private int user_id;
	private Date reg_date;
	
	public PostLikeDto() {
		// TODO Auto-generated constructor stub
	}

	public PostLikeDto(int id, int post_id, int user_id, Date reg_date) {
		super();
		this.id = id;
		this.post_id = post_id;
		this.user_id = user_id;
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

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "PostLikeDto [id=" + id + ", post_id=" + post_id + ", user_id=" + user_id + ", reg_date=" + reg_date
				+ "]";
	}
	
}
