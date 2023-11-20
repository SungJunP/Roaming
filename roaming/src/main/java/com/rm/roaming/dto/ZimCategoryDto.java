package com.rm.roaming.dto;

public class ZimCategoryDto {
	private int id;
	private String name;
	private int zim_fee;
	
	public ZimCategoryDto() {
		super();
	}

	public ZimCategoryDto(int id, String name, int zim_fee) {
		super();
		this.id = id;
		this.name = name;
		this.zim_fee = zim_fee;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getZim_fee() {
		return zim_fee;
	}

	public void setZim_fee(int zim_fee) {
		this.zim_fee = zim_fee;
	}
	
}
