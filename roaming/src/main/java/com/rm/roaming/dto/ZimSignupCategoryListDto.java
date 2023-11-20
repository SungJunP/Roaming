package com.rm.roaming.dto;

public class ZimSignupCategoryListDto {
	private int id;
	private int zim_category_id;
	private int zim_signup_id;
	private int zim_amount;
	
	public ZimSignupCategoryListDto() {
		super();
	}
	
	public ZimSignupCategoryListDto(int id, int zim_category_id, int zim_signup_id, int zim_amount) {
		super();
		this.id = id;
		this.zim_category_id = zim_category_id;
		this.zim_signup_id = zim_signup_id;
		this.zim_amount = zim_amount;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getZim_category_id() {
		return zim_category_id;
	}

	public void setZim_category_id(int zim_category_id) {
		this.zim_category_id = zim_category_id;
	}

	public int getZim_signup_id() {
		return zim_signup_id;
	}

	public void setZim_signup_id(int zim_signup_id) {
		this.zim_signup_id = zim_signup_id;
	}

	public int getZim_amount() {
		return zim_amount;
	}

	public void setZim_amount(int zim_amount) {
		this.zim_amount = zim_amount;
	}
	
}
