package com.rm.roaming.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReCommentDto {
	private int id;
	private int comment_id;
	private int user_id;
	private int re_user_id;
	private String re_comment;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd HH:mm")
	private Date reg_date;
	
	public ReCommentDto() {
		// TODO Auto-generated constructor stub
	}

	public ReCommentDto(int id, int comment_id, int user_id, int re_user_id, String re_comment, Date reg_date) {
		super();
		this.id = id;
		this.comment_id = comment_id;
		this.user_id = user_id;
		this.re_user_id = re_user_id;
		this.re_comment = re_comment;
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

	public int getRe_user_id() {
		return re_user_id;
	}

	public void setRe_user_id(int re_user_id) {
		this.re_user_id = re_user_id;
	}

	public String getRe_comment() {
		return re_comment;
	}

	public void setRe_comment(String re_comment) {
		this.re_comment = re_comment;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "ReCommentDto [id=" + id + ", comment_id=" + comment_id + ", user_id=" + user_id + ", re_user_id="
				+ re_user_id + ", re_comment=" + re_comment + ", reg_date=" + reg_date + "]";
	}

		
	
}
