package com.rm.roaming.dto;

import java.util.Date;

public class ReelsDto {
	private int id;
	private int user_id;
	private String reels_content;
	private String reels_video;
	private Date reg_date;
	
	public ReelsDto() {
		super();
	}

	public ReelsDto(int id, int user_id, String reels_content, String reels_video, Date reg_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.reels_content = reels_content;
		this.reels_video = reels_video;
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

	public String getReels_content() {
		return reels_content;
	}

	public void setReels_content(String reels_content) {
		this.reels_content = reels_content;
	}

	public String getReels_video() {
		return reels_video;
	}

	public void setReels_video(String reels_video) {
		this.reels_video = reels_video;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
}
