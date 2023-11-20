package com.rm.roaming.dto;

public class RoomGroupImgDto {
	private int id;
    private int room_group_id;
    private String detail_img;
	public RoomGroupImgDto() {
		super();
	}
	public RoomGroupImgDto(int id, int room_group_id, String detail_img) {
		super();
		this.id = id;
		this.room_group_id = room_group_id;
		this.detail_img = detail_img;
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
	public String getDetail_img() {
		return detail_img;
	}
	public void setDetail_img(String detail_img) {
		this.detail_img = detail_img;
	}
    
    
}
