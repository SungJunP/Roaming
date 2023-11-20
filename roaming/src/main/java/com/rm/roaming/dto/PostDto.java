package com.rm.roaming.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PostDto {

	private int id;
	private int create_id;
	private String title;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date day_start;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date day_end;
	private int person_count;
	private int pay;
	private int hit;
	private String public_yn;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date reg_date;
	
	public PostDto() {
		// TODO Auto-generated constructor stub
	}

	
	
	
	public PostDto(int id, int create_id, String title, String content, Date day_start, Date day_end, int person_count,
			int pay, int hit, String public_yn, Date reg_date) {
		super();
		this.id = id;
		this.create_id = create_id;
		this.title = title;
		this.content = content;
		this.day_start = day_start;
		this.day_end = day_end;
		this.person_count = person_count;
		this.pay = pay;
		this.hit = hit;
		this.public_yn = public_yn;
		this.reg_date = reg_date;
	}




	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCreate_id() {
		return create_id;
	}

	public void setCreate_id(int create_id) {
		this.create_id = create_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDay_start() {
		return day_start;
	}

	public void setDay_start(Date day_start) {
		this.day_start = day_start;
	}

	public Date getDay_end() {
		return day_end;
	}

	public void setDay_end(Date day_end) {
		this.day_end = day_end;
	}

	public int getPerson_count() {
		return person_count;
	}

	public void setPerson_count(int person_count) {
		this.person_count = person_count;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getPublic_yn() {
		return public_yn;
	}

	public void setPublic_yn(String public_yn) {
		this.public_yn = public_yn;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "PostDto [id=" + id + ", create_id=" + create_id + ", title=" + title + ", content=" + content
				+ ", day_start=" + day_start + ", day_end=" + day_end + ", person_count=" + person_count + ", pay="
				+ pay + ", hit=" + hit + ", public_yn=" + public_yn + ", reg_date=" + reg_date + "]";
	}
	
	
	
}
