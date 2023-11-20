package com.rm.roaming.dto;

public class FeedImageDto {

	private int id;
	private int feed_id;
	private String feed_image;
	public FeedImageDto() {
		super();
	}
	public FeedImageDto(int id, int feed_id, String feed_image) {
		super();
		this.id = id;
		this.feed_id = feed_id;
		this.feed_image = feed_image;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getFeed_id() {
		return feed_id;
	}
	public void setFeed_id(int feed_id) {
		this.feed_id = feed_id;
	}
	public String getFeed_image() {
		return feed_image;
	}
	public void setFeed_image(String feed_image) {
		this.feed_image = feed_image;
	}
	
}
