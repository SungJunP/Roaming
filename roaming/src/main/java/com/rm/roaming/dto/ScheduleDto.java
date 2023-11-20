package com.rm.roaming.dto;

import java.util.Date;

public class ScheduleDto {
	private int id;
	private int day_id;
	private int order_no;
	private String trip_location;
	private String trip_memo;
	private Date reg_date;
	
	public ScheduleDto() {
		// TODO Auto-generated constructor stub
	}

	public ScheduleDto(int id, int day_id, int order_no, String trip_location, String trip_memo, Date reg_date) {
		super();
		this.id = id;
		this.day_id = day_id;
		this.order_no = order_no;
		this.trip_location = trip_location;
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

	public String getTrip_location() {
		return trip_location;
	}

	public void setTrip_location(String trip_location) {
		this.trip_location = trip_location;
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

	@Override
	public String toString() {
		return "ScheduleDto [id=" + id + ", day_id=" + day_id + ", order_no=" + order_no + ", trip_location="
				+ trip_location + ", trip_memo=" + trip_memo + ", reg_date=" + reg_date + "]";
	}

		
	
}
