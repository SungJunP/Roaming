package com.rm.roaming.dto;

import java.util.Date;

public class HotelDocuDto {
	 private int id;
	 private int hotel_id;
	 private String docu_link;
	 private String return_text;
	 private String status;
	 private Date reg_date;
	public HotelDocuDto() {
		super();
	}
	public HotelDocuDto(int id, int hotel_id, String docu_link, String return_text, String status, Date reg_date) {
		super();
		this.id = id;
		this.hotel_id = hotel_id;
		this.docu_link = docu_link;
		this.return_text = return_text;
		this.status = status;
		this.reg_date = reg_date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getHotel_id() {
		return hotel_id;
	}
	public void setHotel_id(int hotel_id) {
		this.hotel_id = hotel_id;
	}
	public String getDocu_link() {
		return docu_link;
	}
	public void setDocu_link(String docu_link) {
		this.docu_link = docu_link;
	}
	public String getReturn_text() {
		return return_text;
	}
	public void setReturn_text(String return_text) {
		this.return_text = return_text;
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
