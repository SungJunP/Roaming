package com.rm.roaming.dto;

import java.util.Date;

public class FeedDto {
	
	private int id;
	private int user_id;
	private String feed_title;
	private String feed_content;
	private String feed_link;
	private String feed_status;
	private String location;
	private Date reg_date;
	
	public FeedDto() {
		super();
	}
	
	public FeedDto(int id, int user_id, String feed_title, String feed_content, String feed_link, String feed_status, String location,
			Date reg_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.feed_title = feed_title;
		this.feed_content = feed_content;
		this.feed_link = feed_link;
		this.feed_status = feed_status;
		this.location = location;
		this.reg_date = reg_date;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getFeed_title() {
		return feed_title;
	}
	public void setFeed_title(String feed_title) {
		this.feed_title = feed_title;
	}
	public String getFeed_content() {
		return feed_content;
	}
	public void setFeed_content(String feed_content) {
		this.feed_content = feed_content;
	}
	public String getFeed_link() {
		return feed_link;
	}
	public void setFeed_link(String feed_link) {
		this.feed_link = feed_link;
	}
	public String getFeed_status() {
		return feed_status;
	}
	public void setFeed_status(String feed_status) {
		this.feed_status = feed_status;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
}
