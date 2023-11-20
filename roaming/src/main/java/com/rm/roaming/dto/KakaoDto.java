package com.rm.roaming.dto;

import java.util.List;

public class KakaoDto {
	private String tid;
	private int partner_order_id;
	private int partner_user_id;
	private String startDate;
	private String endDate;
	private List<Integer> option_id;
	public KakaoDto() {
		super();
	}

	public KakaoDto(String tid, int partner_order_id, int partner_user_id, String startDate, String endDate,
			List<Integer> option_id) {
		super();
		this.tid = tid;
		this.partner_order_id = partner_order_id;
		this.partner_user_id = partner_user_id;
		this.startDate = startDate;
		this.endDate = endDate;
		this.option_id = option_id;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public int getPartner_order_id() {
		return partner_order_id;
	}
	public void setPartner_order_id(int partner_order_id) {
		this.partner_order_id = partner_order_id;
	}
	public int getPartner_user_id() {
		return partner_user_id;
	}
	public void setPartner_user_id(int partner_user_id) {
		this.partner_user_id = partner_user_id;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public List<Integer> getOption_id() {
		return option_id;
	}
	public void setOption_id(List<Integer> option_id) {
		this.option_id = option_id;
	}
	
	
	
	
}
