package com.rm.roaming.dto;

import java.util.Date;

public class UserCouponDto {

	private int id;
	private int user_id;
	private int coupon_id;
	private String status;
	private Date reg_date;
	
	public UserCouponDto() {
		super();
	}

	public UserCouponDto(int id, int user_id, int coupon_id, String status, Date reg_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.coupon_id = coupon_id;
		this.status = status;
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

	public int getCoupon_id() {
		return coupon_id;
	}

	public void setCoupon_id(int coupon_id) {
		this.coupon_id = coupon_id;
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
