package com.rm.roaming.dto;

import java.util.Date;

public class ReelsCommentDto {
	
	private int id;
	private int reels_id;
	private int user_id;
	private int user_comment_id;
	private String reels_comment;
	private Date reg_date;
	public ReelsCommentDto() {
		super();
	}
	public ReelsCommentDto(int id, int reels_id, int user_id, int user_comment_id, String reels_comment, Date reg_date) {
		super();
		this.id = id;
		this.reels_id = reels_id;
		this.user_id = user_id;
		this.user_comment_id = user_comment_id;
		this.reels_comment = reels_comment;
		this.reg_date = reg_date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getReels_id() {
		return reels_id;
	}
	public void setReels_id(int reels_id) {
		this.reels_id = reels_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getUser_comment_id() {
		return user_comment_id;
	}
	public void setUser_comment_id(int user_comment_id) {
		this.user_comment_id = user_comment_id;
	}
	public String getReels_comment() {
		return reels_comment;
	}
	public void setReels_comment(String reels_comment) {
		this.reels_comment = reels_comment;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
}
