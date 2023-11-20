package com.rm.roaming.dto;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class ScheduleRequestDto {
	private int id;
	private Integer[] post_id;
	private Integer[] order_id;
	private Integer[] trip_day;
	private String[] trip_location;
	private String[] trip_memo;
	private Date reg_date;
	
	public ScheduleRequestDto() {
		// TODO Auto-generated constructor stub
	}

	public ScheduleRequestDto(int id, Integer[] post_id, Integer[] order_id, Integer[] trip_day, String[] trip_location,
			String[] trip_memo, Date reg_date) {
		super();
		this.id = id;
		this.post_id = post_id;
		this.order_id = order_id;
		this.trip_day = trip_day;
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

	public Integer[] getPost_id() {
		return post_id;
	}

	public void setPost_id(Integer[] post_id) {
		this.post_id = post_id;
	}

	public Integer[] getOrder_id() {
		return order_id;
	}

	public void setOrder_id(Integer[] order_id) {
		this.order_id = order_id;
	}

	public Integer[] getTrip_day() {
		return trip_day;
	}

	public void setTrip_day(Integer[] trip_day) {
		this.trip_day = trip_day;
	}

	public String[] getTrip_location() {
		return trip_location;
	}

	public void setTrip_location(String[] trip_location) {
		this.trip_location = trip_location;
	}

	public String[] getTrip_memo() {
		return trip_memo;
	}

	public void setTrip_memo(String[] trip_memo) {
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
		return "ScheduleRequestDto [id=" + id + ", post_id=" + Arrays.toString(post_id) + ", order_id="
				+ Arrays.toString(order_id) + ", trip_day=" + Arrays.toString(trip_day) + ", trip_location="
				+ Arrays.toString(trip_location) + ", trip_memo=" + Arrays.toString(trip_memo) + ", reg_date="
				+ reg_date + "]";
	}

		
}
