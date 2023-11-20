package com.rm.roaming.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class JoinConfirmDto {

	private int id;
	private int post_id;
	private int create_id;
	private int user_id;
	private String welcome_ment;
	private String status;
	private String confirm_image;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date reg_date;
	
	 public JoinConfirmDto() {
		// TODO Auto-generated constructor stub
	}

	public JoinConfirmDto(int id, int post_id, int create_id, int user_id, String welcome_ment, String status,
			String confirm_image, Date reg_date) {
		super();
		this.id = id;
		this.post_id = post_id;
		this.create_id = create_id;
		this.user_id = user_id;
		this.welcome_ment = welcome_ment;
		this.status = status;
		this.confirm_image = confirm_image;
		this.reg_date = reg_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public int getCreate_id() {
		return create_id;
	}

	public void setCreate_id(int create_id) {
		this.create_id = create_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getWelcome_ment() {
		return welcome_ment;
	}

	public void setWelcome_ment(String welcome_ment) {
		this.welcome_ment = welcome_ment;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getConfirm_image() {
		return confirm_image;
	}

	public void setConfirm_image(String confirm_image) {
		this.confirm_image = confirm_image;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "JoinConfirmDto [id=" + id + ", post_id=" + post_id + ", create_id=" + create_id + ", user_id=" + user_id
				+ ", welcome_ment=" + welcome_ment + ", status=" + status + ", confirm_image=" + confirm_image
				+ ", reg_date=" + reg_date + "]";
	}

	
}
