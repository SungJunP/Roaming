package com.rm.roaming.dto;

import java.util.List;

public class ScheduleDay{
	private int day;
	private List<Schedule> schedule;
	public ScheduleDay() {
		super();
	}
	public ScheduleDay(int day, List<Schedule> schedule) {
		super();
		this.day = day;
		this.schedule = schedule;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public List<Schedule> getSchedule() {
		return schedule;
	}
	public void setSchedule(List<Schedule> schedule) {
		this.schedule = schedule;
	}
	
	
}
