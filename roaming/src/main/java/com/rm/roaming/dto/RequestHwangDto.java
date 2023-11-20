package com.rm.roaming.dto;


import java.util.List;


public class RequestHwangDto {
	private List<ScheduleDay> days;

	public RequestHwangDto() {
		super();
	}

	public RequestHwangDto(List<ScheduleDay> days) {
		super();
		this.days = days;
	}

	public List<ScheduleDay> getDays() {
		return days;
	}

	public void setDays(List<ScheduleDay> days) {
		this.days = days;
	}
}



