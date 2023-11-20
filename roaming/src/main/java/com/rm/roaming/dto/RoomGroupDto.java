package com.rm.roaming.dto;

public class RoomGroupDto {
    private int id;
    private int hotel_id;
    private int view_id;
    private String room_group_name;
    private String room_group_img;
    private int price;
    private int fixed_number;
    private String content;
	public RoomGroupDto() {
		super();
	}
	public RoomGroupDto(int id, int hotel_id, int view_id, String room_group_name, String room_group_img, int price,
			int fixed_number, String content) {
		super();
		this.id = id;
		this.hotel_id = hotel_id;
		this.view_id = view_id;
		this.room_group_name = room_group_name;
		this.room_group_img = room_group_img;
		this.price = price;
		this.fixed_number = fixed_number;
		this.content = content;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getHotel_id() {
		return hotel_id;
	}
	public void setHotel_id(int hotel_id) {
		this.hotel_id = hotel_id;
	}
	public int getView_id() {
		return view_id;
	}
	public void setView_id(int view_id) {
		this.view_id = view_id;
	}
	public String getRoom_group_name() {
		return room_group_name;
	}
	public void setRoom_group_name(String room_group_name) {
		this.room_group_name = room_group_name;
	}
	public String getRoom_group_img() {
		return room_group_img;
	}
	public void setRoom_group_img(String room_group_img) {
		this.room_group_img = room_group_img;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getFixed_number() {
		return fixed_number;
	}
	public void setFixed_number(int fixed_number) {
		this.fixed_number = fixed_number;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

    
    
}
