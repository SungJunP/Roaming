package com.rm.roaming.dto;

public class HotelLinkSyscategoryDto {
	private int id;
	private int syscategory_id;
	private int hotel_id;
	public HotelLinkSyscategoryDto() {
		super();
	}
	public HotelLinkSyscategoryDto(int id, int syscategory_id, int hotel_id) {
		super();
		this.id = id;
		this.syscategory_id = syscategory_id;
		this.hotel_id = hotel_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSyscategory_id() {
		return syscategory_id;
	}
	public void setSyscategory_id(int syscategory_id) {
		this.syscategory_id = syscategory_id;
	}
	public int getHotel_id() {
		return hotel_id;
	}
	public void setHotel_id(int hotel_id) {
		this.hotel_id = hotel_id;
	}
	
	
}
