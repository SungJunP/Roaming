package com.rm.roaming.dto;

import java.util.Date;

public class HotelReviewDto {
	private int id;
	private int reserve_id;
	private String content;
	private int star;
	private Date review_date;
	private String review_img_link;
	public HotelReviewDto() {
		super();
	}
	public HotelReviewDto(int id, int reserve_id, String content, int star, Date review_date, String review_img_link) {
		super();
		this.id = id;
		this.reserve_id = reserve_id;
		this.content = content;
		this.star = star;
		this.review_date = review_date;
		this.review_img_link = review_img_link;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public String getReview_img_link() {
		return review_img_link;
	}
	public void setReview_img_link(String review_img_link) {
		this.review_img_link = review_img_link;
	}
	
	
	
	
	
}
