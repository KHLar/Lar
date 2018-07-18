package com.misoot.lar.lecture.model.vo;

import java.sql.Date;

public class Lecture implements java.io.Serializable {
	
	private int lecture_index;
	private String lecture_category_index;
	private int lecture_instructor_index;
	private String lecture_title;
	private String lecture_intro;
	private String lecture_level;
	private int lecture_price;
	private Date lecture_upload_date;
	private int lecture_is_deleted;
	
	public Lecture() { }

	public Lecture(int lecture_index, String lecture_category_index, int lecture_instructor_index, String lecture_title,
			String lecture_intro, String lecture_level, int lecture_price, Date lecture_upload_date,
			int lecture_is_deleted) {
		super();
		this.lecture_index = lecture_index;
		this.lecture_category_index = lecture_category_index;
		this.lecture_instructor_index = lecture_instructor_index;
		this.lecture_title = lecture_title;
		this.lecture_intro = lecture_intro;
		this.lecture_level = lecture_level;
		this.lecture_price = lecture_price;
		this.lecture_upload_date = lecture_upload_date;
		this.lecture_is_deleted = lecture_is_deleted;
	}

	public int getLecture_index() {
		return lecture_index;
	}

	public void setLecture_index(int lecture_index) {
		this.lecture_index = lecture_index;
	}

	public String getLecture_category_index() {
		return lecture_category_index;
	}

	public void setLecture_category_index(String lecture_category_index) {
		this.lecture_category_index = lecture_category_index;
	}

	public int getLecture_instructor_index() {
		return lecture_instructor_index;
	}

	public void setLecture_instructor_index(int lecture_instructor_index) {
		this.lecture_instructor_index = lecture_instructor_index;
	}

	public String getLecture_title() {
		return lecture_title;
	}

	public void setLecture_title(String lecture_title) {
		this.lecture_title = lecture_title;
	}

	public String getLecture_intro() {
		return lecture_intro;
	}

	public void setLecture_intro(String lecture_intro) {
		this.lecture_intro = lecture_intro;
	}

	public String getLecture_level() {
		return lecture_level;
	}

	public void setLecture_level(String lecture_level) {
		this.lecture_level = lecture_level;
	}

	public int getLecture_price() {
		return lecture_price;
	}

	public void setLecture_price(int lecture_price) {
		this.lecture_price = lecture_price;
	}

	public Date getLecture_upload_date() {
		return lecture_upload_date;
	}

	public void setLecture_upload_date(Date lecture_upload_date) {
		this.lecture_upload_date = lecture_upload_date;
	}

	public int getLecture_is_deleted() {
		return lecture_is_deleted;
	}

	public void setLecture_is_deleted(int lecture_is_deleted) {
		this.lecture_is_deleted = lecture_is_deleted;
	}

	@Override
	public String toString() {
		return "Lecture [lecture_index=" + lecture_index + ", lecture_category_index=" + lecture_category_index
				+ ", lecture_instructor_index=" + lecture_instructor_index + ", lecture_title=" + lecture_title
				+ ", lecture_intro=" + lecture_intro + ", lecture_level=" + lecture_level + ", lecture_price="
				+ lecture_price + ", lecture_upload_date=" + lecture_upload_date + ", lecture_is_deleted="
				+ lecture_is_deleted + "]";
	}
	
}
