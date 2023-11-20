package com.rm.roaming.dto;

import java.time.LocalDateTime;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ZimSignUpDto {
	private int id;
	private int user_id;
	private String start_address;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private LocalDateTime start_date;
	
	private String arrive_address;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private LocalDateTime arrive_date;
	
	private String zim_image_link;
	private String zim_progress;
	private Date zim_reg_date;

	public ZimSignUpDto() {
		super();
	}

	public ZimSignUpDto(int id, int user_id, String start_address, LocalDateTime start_date, String arrive_address,
			LocalDateTime arrive_date, String zim_image_link, String zim_progress, Date zim_reg_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.start_address = start_address;
		this.start_date = start_date;
		this.arrive_address = arrive_address;
		this.arrive_date = arrive_date;
		this.zim_image_link = zim_image_link;
		this.zim_progress = zim_progress;
		this.zim_reg_date = zim_reg_date;
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

	public String getStart_address() {
		return start_address;
	}

	public void setStart_address(String start_address) {
		this.start_address = start_address;
	}

	public LocalDateTime getStart_date() {
		return start_date;
	}

	public void setStart_date(LocalDateTime start_date) {
		this.start_date = start_date;
	}

	public String getArrive_address() {
		return arrive_address;
	}

	public void setArrive_address(String arrive_address) {
		this.arrive_address = arrive_address;
	}

	public LocalDateTime getArrive_date() {
		return arrive_date;
	}

	public void setArrive_date(LocalDateTime arrive_date) {
		this.arrive_date = arrive_date;
	}

	public String getZim_image_link() {
		return zim_image_link;
	}

	public void setZim_image_link(String zim_image_link) {
		this.zim_image_link = zim_image_link;
	}

	public String getZim_progress() {
		return zim_progress;
	}

	public void setZim_progress(String zim_progress) {
		this.zim_progress = zim_progress;
	}

	public Date getZim_reg_date() {
		return zim_reg_date;
	}

	public void setZim_reg_date(Date zim_reg_date) {
		this.zim_reg_date = zim_reg_date;
	}

	
	
}