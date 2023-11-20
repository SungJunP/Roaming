package com.rm.roaming.dto;

import java.util.Date;

public class ItemDto {
	
	private int id;
	private int admin_id;
	private int category_id;
	private String item_name;
	private String item_context;
	private int item_price;
	private String item_thumbnail;
	private int item_count;
	private Date reg_date;
	
	public ItemDto() {
		super();
	}

	public ItemDto(int id, int admin_id, int category_id, String item_name, String item_context, int item_price,
			String item_thumbnail, int item_count, Date reg_date) {
		super();
		this.id = id;
		this.admin_id = admin_id;
		this.category_id = category_id;
		this.item_name = item_name;
		this.item_context = item_context;
		this.item_price = item_price;
		this.item_thumbnail = item_thumbnail;
		this.item_count = item_count;
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

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getItem_context() {
		return item_context;
	}

	public void setItem_context(String item_context) {
		this.item_context = item_context;
	}

	public int getItem_price() {
		return item_price;
	}

	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}

	public String getItem_thumbnail() {
		return item_thumbnail;
	}

	public void setItem_thumbnail(String item_thumbnail) {
		this.item_thumbnail = item_thumbnail;
	}

	public int getItem_count() {
		return item_count;
	}

	public void setItem_count(int item_count) {
		this.item_count = item_count;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	

}
