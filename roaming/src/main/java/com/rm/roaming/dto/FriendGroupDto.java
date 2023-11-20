package com.rm.roaming.dto;

import java.util.Date;

public class FriendGroupDto {

	private int id;
	private int user_id;
	private String group_name;
	private Date reg_date;
	
	public FriendGroupDto() {
		super();
	}

	public FriendGroupDto(int id, int user_id, String group_name, Date reg_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.group_name = group_name;
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

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
}
