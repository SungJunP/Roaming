package com.rm.roaming.dto;

import java.util.Date;

public class HotelDto {
	private int id;
	private int seller_id;
	private int hotel_category_id;
	private String hotel_name;
	private String hotel_loc;
	private String hotel_img;
	private String hotel_tel;
	private String status;
	private String content;
	private Date reg_date;

	public HotelDto(int id, int seller_id, int hotel_category_id, String hotel_name, String hotel_loc, String hotel_img,
			String hotel_tel, String status, String content, Date reg_date) {
		super();
		this.id = id;
		this.seller_id = seller_id;
		this.hotel_category_id = hotel_category_id;
		this.hotel_name = hotel_name;
		this.hotel_loc = hotel_loc;
		this.hotel_img = hotel_img;
		this.hotel_tel = hotel_tel;
		this.status = status;
		this.content = content;
		this.reg_date = reg_date;
	}
	public HotelDto() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(int seller_id) {
		this.seller_id = seller_id;
	}
	public int getHotel_category_id() {
		return hotel_category_id;
	}
	public void setHotel_category_id(int hotel_category_id) {
		this.hotel_category_id = hotel_category_id;
	}
	public String getHotel_name() {
		return hotel_name;
	}
	public void setHotel_name(String hotel_name) {
		this.hotel_name = hotel_name;
	}
	public String getHotel_loc() {
		return hotel_loc;
	}
	public void setHotel_loc(String hotel_loc) {
		this.hotel_loc = hotel_loc;
	}
	public String getHotel_img() {
		return hotel_img;
	}
	public void setHotel_img(String hotel_img) {
		this.hotel_img = hotel_img;
	}
	public String getHotel_tel() {
		return hotel_tel;
	}
	public void setHotel_tel(String hotel_tel) {
		this.hotel_tel = hotel_tel;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
