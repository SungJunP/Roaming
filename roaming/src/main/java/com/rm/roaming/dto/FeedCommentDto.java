package com.rm.roaming.dto;

import java.util.Date;

public class FeedCommentDto {
	
	private int id;
	private int feed_id;
	private int user_id;
	private int user_comment_id;
	private String feed_comment;
	private Date reg_date;
	public FeedCommentDto() {
		super();
	}
	public FeedCommentDto(int id, int feed_id, int user_id, String feed_comment, int user_comment_id, Date reg_date) {
		super();
		this.id = id;
		this.feed_id = feed_id;
		this.user_id = user_id;
		this.user_comment_id = user_comment_id;
		this.feed_comment = feed_comment;
		this.reg_date = reg_date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getFeed_id() {
		return feed_id;
	}
	public void setFeed_id(int feed_id) {
		this.feed_id = feed_id;
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
	public String getFeed_comment() {
		return feed_comment;
	}
	public void setFeed_comment(String feed_comment) {
		this.feed_comment = feed_comment;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
}
