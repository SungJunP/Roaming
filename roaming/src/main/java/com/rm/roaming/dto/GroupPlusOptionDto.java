package com.rm.roaming.dto;

public class GroupPlusOptionDto {
	   private int id;
	   private int room_group_id;
	   private String plus_option;
	   private int price;
	public GroupPlusOptionDto() {
		super();
	}
	public GroupPlusOptionDto(int id, int room_group_id, String plus_option, int price) {
		super();
		this.id = id;
		this.room_group_id = room_group_id;
		this.plus_option = plus_option;
		this.price = price;
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
	public String getPlus_option() {
		return plus_option;
	}
	public void setPlus_option(String plus_option) {
		this.plus_option = plus_option;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	   
	   
}
