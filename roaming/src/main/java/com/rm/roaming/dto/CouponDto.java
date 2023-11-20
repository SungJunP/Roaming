package com.rm.roaming.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CouponDto {
	
	private int id;
	private int admin_id;
	private String coupon_name;
	private String coupon_context;
	private int coupon_discount;
	private String coupon_image;
	private int coupon_count;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date coupon_startdate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date coupon_enddate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date coupon_issue_start;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date coupon_issue_end;
	private String coupon_deleted;
	private Date reg_date;
	
	public CouponDto() {
		super();
	}

	public CouponDto(int id, int admin_id, String coupon_name, String coupon_context, int coupon_discount,
			String coupon_image, int coupon_count, Date coupon_startdate, Date coupon_enddate, Date coupon_issue_start,
			Date coupon_issue_end, String coupon_deleted, Date reg_date) {
		super();
		this.id = id;
		this.admin_id = admin_id;
		this.coupon_name = coupon_name;
		this.coupon_context = coupon_context;
		this.coupon_discount = coupon_discount;
		this.coupon_image = coupon_image;
		this.coupon_count = coupon_count;
		this.coupon_startdate = coupon_startdate;
		this.coupon_enddate = coupon_enddate;
		this.coupon_issue_start = coupon_issue_start;
		this.coupon_issue_end = coupon_issue_end;
		this.coupon_deleted = coupon_deleted;
		this.reg_date = reg_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}

	public String getCoupon_context() {
		return coupon_context;
	}

	public void setCoupon_context(String coupon_context) {
		this.coupon_context = coupon_context;
	}

	public int getCoupon_discount() {
		return coupon_discount;
	}

	public void setCoupon_discount(int coupon_discount) {
		this.coupon_discount = coupon_discount;
	}

	public String getCoupon_image() {
		return coupon_image;
	}

	public void setCoupon_image(String coupon_image) {
		this.coupon_image = coupon_image;
	}

	public int getCoupon_count() {
		return coupon_count;
	}

	public void setCoupon_count(int coupon_count) {
		this.coupon_count = coupon_count;
	}

	public Date getCoupon_startdate() {
		return coupon_startdate;
	}

	public void setCoupon_startdate(Date coupon_startdate) {
		this.coupon_startdate = coupon_startdate;
	}

	public Date getCoupon_enddate() {
		return coupon_enddate;
	}

	public void setCoupon_enddate(Date coupon_enddate) {
		this.coupon_enddate = coupon_enddate;
	}

	public Date getCoupon_issue_start() {
		return coupon_issue_start;
	}

	public void setCoupon_issue_start(Date coupon_issue_start) {
		this.coupon_issue_start = coupon_issue_start;
	}

	public Date getCoupon_issue_end() {
		return coupon_issue_end;
	}

	public void setCoupon_issue_end(Date coupon_issue_end) {
		this.coupon_issue_end = coupon_issue_end;
	}

	public String getCoupon_deleted() {
		return coupon_deleted;
	}

	public void setCoupon_deleted(String coupon_deleted) {
		this.coupon_deleted = coupon_deleted;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	
}
