package com.rm.roaming.dto;

import java.util.Date;

public class ItemBuyDto {

	private int id;
	private int item_id;
	private int address_id;
	private int count;
	private String progress;
	private Date reg_date;
	
	public ItemBuyDto() {
		super();
	}

	public ItemBuyDto(int id, int item_id, int address_id, int count, String progress, Date reg_date) {
		super();
		this.id = id;
		this.item_id = item_id;
		this.address_id = address_id;
		this.count = count;
		this.progress = progress;
		this.reg_date = reg_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getItem_id() {
		return item_id;
	}

	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}

	public int getAddress_id() {
		return address_id;
	}

	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	
	
}
