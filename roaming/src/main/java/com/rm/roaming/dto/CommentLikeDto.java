package com.rm.roaming.dto;

import java.util.Date;

public class CommentLikeDto {
	private int id;
	private int comment_id;
	private int user_id;
	private Date reg_date;
	
	public CommentLikeDto() {
		// TODO Auto-generated constructor stub
	}

	public CommentLikeDto(int id, int comment_id, int user_id, Date reg_date) {
		super();
		this.id = id;
		this.comment_id = comment_id;
		this.user_id = user_id;
		this.reg_date = reg_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getComment_id() {
		return comment_id;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
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
		return "CommentLikeDto [id=" + id + ", comment_id=" + comment_id + ", user_id=" + user_id + ", reg_date="
				+ reg_date + "]";
	}

	
}
