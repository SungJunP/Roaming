package com.rm.roaming.dto;

public class AdminDto {

	private int id;
	private String admin_id;
	private String admin_pw;
	
	public AdminDto() {
		super();
	}

	public AdminDto(int id, String admin_id, String admin_pw) {
		super();
		this.id = id;
		this.admin_id = admin_id;
		this.admin_pw = admin_pw;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_pw() {
		return admin_pw;
	}

	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}
	
	
}
