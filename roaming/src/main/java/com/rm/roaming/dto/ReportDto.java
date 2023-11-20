package com.rm.roaming.dto;

import java.util.Date;

public class ReportDto {
	private int id;
	private int post_id;
	private int user_id;
	private String title;
	private String content;
	private Date reg_date;
	
	public ReportDto() {
		// TODO Auto-generated constructor stub
	}

	public ReportDto(int id, int user_id, int post_id, String title, String content, Date reg_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.post_id = post_id;
		this.title = title;
		this.content = content;
		this.reg_date = reg_date;
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

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
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

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "ReportDto [id=" + id + ", user_id=" + user_id + ", post_id=" + post_id + ", title=" + title
				+ ", content=" + content + ", reg_date=" + reg_date + "]";
	}



		
	
}
