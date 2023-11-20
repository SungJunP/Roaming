package com.rm.roaming.dto;

public class Schedule{
	private String id;
	private String placeName;
	private String placeAddress;
	private String estimatedTime;
	private String memo;
	public Schedule() {
		super();
	}
	public Schedule(String id, String placeName, String placeAddress, String estimatedTime, String memo) {
		super();
		this.id = id;
		this.placeName = placeName;
		this.placeAddress = placeAddress;
		this.estimatedTime = estimatedTime;
		this.memo = memo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public String getPlaceAddress() {
		return placeAddress;
	}
	public void setPlaceAddress(String placeAddress) {
		this.placeAddress = placeAddress;
	}
	public String getEstimatedTime() {
		return estimatedTime;
	}
	public void setEstimatedTime(String estimatedTime) {
		this.estimatedTime = estimatedTime;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
		
	
	
	
}