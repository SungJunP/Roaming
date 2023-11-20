package com.rm.roaming.dto;

import java.util.Date;

public class ReelsLikesDto {
	
	private int id;
	private int reels_id;
	private int user_id;
	private Date reg_date;
	public ReelsLikesDto() {
		super();
	}
	public ReelsLikesDto(int id, int reels_id, int user_id, Date reg_date) {
		super();
		this.id = id;
		this.reels_id = reels_id;
		this.user_id = user_id;
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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
}
