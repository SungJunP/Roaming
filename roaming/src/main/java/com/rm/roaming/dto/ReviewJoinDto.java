package com.rm.roaming.dto;

import java.util.Date;

public class ReviewJoinDto {

	private int id;
	private int user_id;
	private String user_name;
	private String context;
	private Date reg_date;
	
	public ReviewJoinDto() {
		// TODO Auto-generated constructor stub
	}

	public ReviewJoinDto(int id, int user_id, String user_name, String context, Date reg_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.user_name = user_name;
		this.context = context;
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

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "ReviewJoinDto [id=" + id + ", user_id=" + user_id + ", user_name=" + user_name + ", context=" + context
				+ ", reg_date=" + reg_date + "]";
	}
	
	
	
}
