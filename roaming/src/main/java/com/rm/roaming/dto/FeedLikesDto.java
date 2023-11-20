package com.rm.roaming.dto;

import java.util.Date;

public class FeedLikesDto {
	
	private int id;
	private int feed_id;
	private int user_id;
	private int feed_count;
	private int category_id;
	private Date reg_date;
	public FeedLikesDto() {
		super();
	}
	public FeedLikesDto(int id, int feed_id, int user_id, int feed_count, int category_id,Date reg_date) {
		super();
		this.id = id;
		this.feed_id = feed_id;
		this.user_id = user_id;
		this.feed_count = feed_count;
		this.category_id = category_id;
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
	public int getFeed_count() {
		return feed_count;
	}
	public void setFeed_count(int feed_count) {
		this.feed_count = feed_count;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
}
