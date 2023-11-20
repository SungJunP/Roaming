package com.rm.roaming.dto;

import java.util.Date;

public class ItemReviewDto {
	
	private int id;
	private int item_buy_id;
	private String context;
	private Date reg_date;
	
	public ItemReviewDto() {
		super();
	}

	public ItemReviewDto(int id, int item_buy_id, String context, Date reg_date) {
		super();
		this.id = id;
		this.item_buy_id = item_buy_id;
		this.context = context;
		this.reg_date = reg_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getItem_buy_id() {
		return item_buy_id;
	}

	public void setItem_buy_id(int item_buy_id) {
		this.item_buy_id = item_buy_id;
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
