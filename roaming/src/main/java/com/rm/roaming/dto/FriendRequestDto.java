package com.rm.roaming.dto;

import java.util.Date;

public class FriendRequestDto {

	private int id;
	private int send_id;
	private int receive_id;
	private String status;
	private Date reg_date;
	
	public FriendRequestDto() {
		super();
	}

	public FriendRequestDto(int id, int send_id, int receive_id, String status, Date reg_date) {
		super();
		this.id = id;
		this.send_id = send_id;
		this.receive_id = receive_id;
		this.status = status;
		this.reg_date = reg_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSend_id() {
		return send_id;
	}

	public void setSend_id(int send_id) {
		this.send_id = send_id;
	}

	public int getReceive_id() {
		return receive_id;
	}

	public void setReceive_id(int receive_id) {
		this.receive_id = receive_id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
