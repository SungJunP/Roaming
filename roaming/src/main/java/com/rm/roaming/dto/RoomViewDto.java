package com.rm.roaming.dto;

public class RoomViewDto {
	private int id;
	private String room_view;
	public RoomViewDto() {
		super();
	}
	public RoomViewDto(int id, String room_view) {
		super();
		this.id = id;
		this.room_view = room_view;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRoom_view() {
		return room_view;
	}
	public void setRoom_view(String room_view) {
		this.room_view = room_view;
	}
	
	
}
