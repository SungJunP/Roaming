package com.rm.roaming.dto;

import java.util.Date;

public class SellerDto {
	 private int id;
	 private String seller_name;
	 private String seller_id;
	 private String seller_pw;
	 private String email;
	 private String phone;
	 private Date reg_date;
	public SellerDto() {
		super();
	}
	public SellerDto(int id, String seller_name, String seller_id, String seller_pw, String email, String phone,
			Date reg_date) {
		super();
		this.id = id;
		this.seller_name = seller_name;
		this.seller_id = seller_id;
		this.seller_pw = seller_pw;
		this.email = email;
		this.phone = phone;
		this.reg_date = reg_date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSeller_name() {
		return seller_name;
	}
	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getSeller_pw() {
		return seller_pw;
	}
	public void setSeller_pw(String seller_pw) {
		this.seller_pw = seller_pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	 
	 
}
