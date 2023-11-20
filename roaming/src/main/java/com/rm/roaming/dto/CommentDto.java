package com.rm.roaming.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CommentDto {
	private int id;
	private int post_id;
	private int user_id;
	private String post_comment;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd HH:mm")
	private Date reg_date;
	
	public CommentDto() {
		// TODO Auto-generated constructor stub
	}

	public CommentDto(int id, int post_id, int user_id, String post_comment, Date reg_date) {
		super();
		this.id = id;
		this.post_id = post_id;
		this.user_id = user_id;
		this.post_comment = post_comment;
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

	public String getPost_comment() {
		return post_comment;
	}

	public void setPost_comment(String post_comment) {
		this.post_comment = post_comment;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "CommentDto [id=" + id + ", post_id=" + post_id + ", user_id=" + user_id + ", post_comment="
				+ post_comment + ", reg_date=" + reg_date + "]";
	}

	

	
	
}
