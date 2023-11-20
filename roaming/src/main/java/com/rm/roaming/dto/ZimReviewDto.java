package com.rm.roaming.dto;

import java.util.Date;

public class ZimReviewDto {
	private int id;
	private int zim_signup_id;
	private String zim_review_content;
	private int zim_star;
	private Date review_reg_date;
	
	public ZimReviewDto() {
		super();
	}

	public ZimReviewDto(int id, int zim_signup_id, String zim_review_content, int zim_star, Date review_reg_date) {
		super();
		this.id = id;
		this.zim_signup_id = zim_signup_id;
		this.zim_review_content = zim_review_content;
		this.zim_star = zim_star;
		this.review_reg_date = review_reg_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getZim_signup_id() {
		return zim_signup_id;
	}

	public void setZim_signup_id(int zim_signup_id) {
		this.zim_signup_id = zim_signup_id;
	}

	public String getZim_review_content() {
		return zim_review_content;
	}

	public void setZim_review_content(String zim_review_content) {
		this.zim_review_content = zim_review_content;
	}

	public int getZim_star() {
		return zim_star;
	}

	public void setZim_star(int zim_star) {
		this.zim_star = zim_star;
	}

	public Date getReview_reg_date() {
		return review_reg_date;
	}

	public void setReview_reg_date(Date review_reg_date) {
		this.review_reg_date = review_reg_date;
	}
	
	
}
