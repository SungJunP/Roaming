package com.rm.roaming.dto;

public class HotelLikeDto {
	private int id;
	private int user_id;
	private int hotel_id;
	public HotelLikeDto() {
		super();
	}
	public HotelLikeDto(int id, int user_id, int hotel_Id) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.hotel_id = hotel_Id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getHotel_id() {
		return hotel_id;
	}
	public void setHotel_id(int hotel_Id) {
		this.hotel_id = hotel_Id;
	}
	
}
