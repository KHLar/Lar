package com.misoot.lar.lecture.model.vo;

import java.sql.Date;

public class LectureA {

	private int lecture_a_index;
	private int lecture_a_writer_index;
	private int lecture_a_lecture_q_index;
	private String lecture_a_content;
	private Date lecture_a_upload_date;
	private Date lecture_a_update_date;
	private int lecture_a_is_deleted;
	private int lecture_a_is_readed;
	private String user_nickname;

	public LectureA() {

	}

	public LectureA(int lecture_a_index, int lecture_a_writer_index, int lecture_a_lecture_q_index,
			String lecture_a_content, Date lecture_a_upload_date, Date lecture_a_update_date, int lecture_a_is_deleted,
			int lecture_a_is_readed, String user_nickname) {
		super();
		this.lecture_a_index = lecture_a_index;
		this.lecture_a_writer_index = lecture_a_writer_index;
		this.lecture_a_lecture_q_index = lecture_a_lecture_q_index;
		this.lecture_a_content = lecture_a_content;
		this.lecture_a_upload_date = lecture_a_upload_date;
		this.lecture_a_update_date = lecture_a_update_date;
		this.lecture_a_is_deleted = lecture_a_is_deleted;
		this.lecture_a_is_readed = lecture_a_is_readed;
		this.user_nickname = user_nickname;
	}

	public int getLecture_a_index() {
		return lecture_a_index;
	}

	public void setLecture_a_index(int lecture_a_index) {
		this.lecture_a_index = lecture_a_index;
	}

	public int getLecture_a_writer_index() {
		return lecture_a_writer_index;
	}

	public void setLecture_a_writer_index(int lecture_a_writer_index) {
		this.lecture_a_writer_index = lecture_a_writer_index;
	}

	public int getLecture_a_lecture_q_index() {
		return lecture_a_lecture_q_index;
	}

	public void setLecture_a_lecture_q_index(int lecture_a_lecture_q_index) {
		this.lecture_a_lecture_q_index = lecture_a_lecture_q_index;
	}

	public String getLecture_a_content() {
		return lecture_a_content;
	}

	public void setLecture_a_content(String lecture_a_content) {
		this.lecture_a_content = lecture_a_content;
	}

	public Date getLecture_a_upload_date() {
		return lecture_a_upload_date;
	}

	public void setLecture_a_upload_date(Date lecture_a_upload_date) {
		this.lecture_a_upload_date = lecture_a_upload_date;
	}

	public Date getLecture_a_update_date() {
		return lecture_a_update_date;
	}

	public void setLecture_a_update_date(Date lecture_a_update_date) {
		this.lecture_a_update_date = lecture_a_update_date;
	}

	public int getLecture_a_is_deleted() {
		return lecture_a_is_deleted;
	}

	public void setLecture_a_is_deleted(int lecture_a_is_deleted) {
		this.lecture_a_is_deleted = lecture_a_is_deleted;
	}

	public int getLecture_a_is_readed() {
		return lecture_a_is_readed;
	}

	public void setLecture_a_is_readed(int lecture_a_is_readed) {
		this.lecture_a_is_readed = lecture_a_is_readed;
	}

	public String getuser_nickname() {
		return user_nickname;
	}

	public void setuser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	@Override
	public String toString() {
		return "LectureA [lecture_a_index=" + lecture_a_index + ", lecture_a_writer_index=" + lecture_a_writer_index
				+ ", lecture_a_lecture_q_index=" + lecture_a_lecture_q_index + ", lecture_a_content="
				+ lecture_a_content + ", lecture_a_upload_date=" + lecture_a_upload_date + ", lecture_a_update_date="
				+ lecture_a_update_date + ", lecture_a_is_deleted=" + lecture_a_is_deleted + ", lecture_a_is_readed="
				+ lecture_a_is_readed + ", user_nickname=" + user_nickname + "]";
	}

}
