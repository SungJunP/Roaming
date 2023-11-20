package com.rm.roaming.dto;

public class RoomDto {
	private int id;
	private int room_group_id;
	private int room_number;
	public RoomDto() {
		super();
	}
	public RoomDto(int id, int room_group_id, int room_number) {
		super();
		this.id = id;
		this.room_group_id = room_group_id;
		this.room_number = room_number;
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
	public int getRoom_number() {
		return room_number;
	}
	public void setRoom_number(int room_number) {
		this.room_number = room_number;
	}
	
	
}
