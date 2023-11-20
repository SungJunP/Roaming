package com.rm.roaming.dto;

public class OptionReserveDto {
	private int id;
	private int reserve_id;
	private int option_id;
	public OptionReserveDto() {
		super();
	}
	public OptionReserveDto(int id, int reserve_id, int option_id) {
		super();
		this.id = id;
		this.reserve_id = reserve_id;
		this.option_id = option_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getReserve_id() {
		return reserve_id;
	}
	public void setReserve_id(int reserve_id) {
		this.reserve_id = reserve_id;
	}
	public int getOption_id() {
		return option_id;
	}
	public void setOption_id(int option_id) {
		this.option_id = option_id;
	}
	
	
}
