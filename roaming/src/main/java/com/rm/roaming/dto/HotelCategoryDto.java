package com.rm.roaming.dto;

public class HotelCategoryDto {
	private int id;
	private String category;
	public HotelCategoryDto() {
		super();
	}
	public HotelCategoryDto(int id, String category) {
		super();
		this.id = id;
		this.category = category;
	}
	public int getId() {
		return id;
	}
	public String getCategory() {
		return category;
	}
	
}
