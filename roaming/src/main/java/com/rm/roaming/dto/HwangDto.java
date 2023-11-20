package com.rm.roaming.dto;

import java.util.Date;

public class HwangDto {
	private int id;
	private int day_id;
	private int order_no;
	private String place_title;
	private String place_location;
	private String estimated_time;
	private String trip_memo;
	private Date reg_date;
	public HwangDto() {
		super();
	}
	public HwangDto(int id, int day_id, int order_no, String place_title, String place_location, String estimated_time,
			String trip_memo, Date reg_date) {
		super();
		this.id = id;
		this.day_id = day_id;
		this.order_no = order_no;
		this.place_title = place_title;
		this.place_location = place_location;
		this.estimated_time = estimated_time;
		this.trip_memo = trip_memo;
		this.reg_date = reg_date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDay_id() {
		return day_id;
	}
	public void setDay_id(int day_id) {
		this.day_id = day_id;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public String getPlace_title() {
		return place_title;
	}
	public void setPlace_title(String place_title) {
		this.place_title = place_title;
	}
	public String getPlace_location() {
		return place_location;
	}
	public void setPlace_location(String place_location) {
		this.place_location = place_location;
	}
	public String getEstimated_time() {
		return estimated_time;
	}
	public void setEstimated_time(String estimated_time) {
		this.estimated_time = estimated_time;
	}
	public String getTrip_memo() {
		return trip_memo;
	}
	public void setTrip_memo(String trip_memo) {
		this.trip_memo = trip_memo;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	
	
}
