package com.rm.roaming.dto;

import java.util.Date;

public class QaBoardDto {

	private int id;
	private int user_id;
	private int admin_id;
	private int qa_category_id;
	private String qa_title;
	private String qa_content;
	private int qa_read_count;
	private String qa_secret;
	private Date qa_reg_date;
	private int qa_recommend_count;
	private String qa_comment_content;
	private Date qa_comment_reg_date;
	
	public QaBoardDto() {
		super();
	}
	
	public QaBoardDto(int id, int user_id, int admin_id, int qa_category_id, String qa_title, String qa_content,
			int qa_read_count, String qa_secret, Date qa_reg_date, String qa_comment_content, Date qa_comment_reg_date,
			int qa_recommend_count) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.admin_id = admin_id;
		this.qa_category_id = qa_category_id;
		this.qa_title = qa_title;
		this.qa_content = qa_content;
		this.qa_read_count = qa_read_count;
		this.qa_secret = qa_secret;
		this.qa_reg_date = qa_reg_date;
		this.qa_comment_content = qa_comment_content;
		this.qa_comment_reg_date = qa_comment_reg_date;
		this.qa_recommend_count = qa_recommend_count;
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
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}
	public int getQa_category_id() {
		return qa_category_id;
	}
	public void setQa_category_id(int qa_category_id) {
		this.qa_category_id = qa_category_id;
	}
	public String getQa_title() {
		return qa_title;
	}
	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}
	public String getQa_content() {
		return qa_content;
	}
	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}
	public int getQa_read_count() {
		return qa_read_count;
	}
	public void setQa_read_count(int qa_read_count) {
		this.qa_read_count = qa_read_count;
	}
	public String getQa_secret() {
		return qa_secret;
	}
	public void setQa_secret(String qa_secret) {
		this.qa_secret = qa_secret;
	}
	public Date getQa_reg_date() {
		return qa_reg_date;
	}
	public void setQa_reg_date(Date qa_reg_date) {
		this.qa_reg_date = qa_reg_date;
	}
	public String getQa_comment_content() {
		return qa_comment_content;
	}
	public void setQa_comment_content(String qa_comment_content) {
		this.qa_comment_content = qa_comment_content;
	}
	public Date getQa_comment_reg_date() {
		return qa_comment_reg_date;
	}
	public void setQa_comment_reg_date(Date qa_comment_reg_date) {
		this.qa_comment_reg_date = qa_comment_reg_date;
	}
	public int getQa_recommend_count() {
		return qa_recommend_count;
	}
	public void setQa_recommend_count(int qa_recommend_count) {
		this.qa_recommend_count = qa_recommend_count;
	}
	
	
}
