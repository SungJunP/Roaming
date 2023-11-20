package com.rm.roaming.dto;

public class CustomCategoryDto {
	private int id;
    private int room_group_id;
    private String category_name;
	public CustomCategoryDto() {
		super();
	}
	public CustomCategoryDto(int id, int room_group_id, String category_name) {
		super();
		this.id = id;
		this.room_group_id = room_group_id;
		this.category_name = category_name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRoom_group_id() {
		return room_group_id;
	}
	public void setRoom_group_id(int room_group_id) {
		this.room_group_id = room_group_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
    
    
}
