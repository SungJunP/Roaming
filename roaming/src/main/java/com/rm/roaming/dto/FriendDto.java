package com.rm.roaming.dto;

import java.util.Date;

public class FriendDto {
	
	private int id;
	private int group_id;
	private int user_id;
	private int friend_id;
	private Date reg_date;
	
	public FriendDto() {
		super();
	}

	public FriendDto(int id, int group_id, int user_id, int friend_id, Date reg_date) {
		super();
		this.id = id;
		this.group_id = group_id;
		this.user_id = user_id;
		this.friend_id = friend_id;
		this.reg_date = reg_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getGroup_id() {
		return group_id;
	}

	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getFriend_id() {
		return friend_id;
	}

	public void setFriend_id(int friend_id) {
		this.friend_id = friend_id;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	
}
