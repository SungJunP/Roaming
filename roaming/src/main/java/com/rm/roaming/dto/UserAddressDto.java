package com.rm.roaming.dto;

public class UserAddressDto {
	
	private int id;
	private int user_id;
	private String address;
	
	public UserAddressDto() {
		super();
	}

	public UserAddressDto(int id, int user_id, String address) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.address = address;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	

}
