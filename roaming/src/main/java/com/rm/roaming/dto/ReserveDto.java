package com.rm.roaming.dto;

import java.util.Date;

public class ReserveDto {
	 private int id;
	 private int user_id;
	 private int room_group_id;
	 private int final_price;
	 private Date start_date;
	 private Date end_date;
	 private Integer mycoupon_id;
	 private String tid;
	 private Date reserve_date;
	public ReserveDto() {
		super();
	}
	public ReserveDto(int id, int user_id, int room_group_id, int final_price, Date start_date, Date end_date,
			Integer mycoupon_id, String tid, Date reserve_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.room_group_id = room_group_id;
		this.final_price = final_price;
		this.start_date = start_date;
		this.end_date = end_date;
		this.mycoupon_id = mycoupon_id;
		this.tid = tid;
		this.reserve_date = reserve_date;
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
	public int getRoom_group_id() {
		return room_group_id;
	}
	public void setRoom_group_id(int room_group_id) {
		this.room_group_id = room_group_id;
	}
	public int getFinal_price() {
		return final_price;
	}
	public void setFinal_price(int final_price) {
		this.final_price = final_price;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public Integer getMycoupon_id() {
		return mycoupon_id;
	}
	public void setMycoupon_id(Integer mycoupon_id) {
		this.mycoupon_id = mycoupon_id;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public Date getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(Date reserve_date) {
		this.reserve_date = reserve_date;
	}
	
	 
}
