package com.rm.roaming.dto;

import java.util.Date;

public class PointDto {

	private int id;
	private int user_id;
	private int point;
	private String status;
	private String context;
	private Date reg_date;
	
	public PointDto() {
		super();
	}

	public PointDto(int id, int user_id, int point, String status, String context, Date reg_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.point = point;
		this.status = status;
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

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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
	
	
}
