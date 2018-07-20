package com.misoot.lar.common.sockJS.model.vo;

import java.sql.Date;

public class Inquire implements java.io.Serializable{
	
	private static final long serialVersionUID = 9968L;

	private int inquire_no;
	private String inquire_sender_index, inquire_receiver_index, inquire_content, inquire_attachment_file;
	private Date inquire_sendDate; // 작성일

	public Inquire() {}

	public Inquire(int inquire_no, String inquire_sender_index, String inquire_receiver_index, String inquire_content,
			String inquire_attachment_file, Date inquire_sendDate) {
		super();
		this.inquire_no = inquire_no;
		this.inquire_sender_index = inquire_sender_index;
		this.inquire_receiver_index = inquire_receiver_index;
		this.inquire_content = inquire_content;
		this.inquire_attachment_file = inquire_attachment_file;
		this.inquire_sendDate = inquire_sendDate;
	}

	public int getInquire_no() {
		return inquire_no;
	}

	public void setInquire_no(int inquire_no) {
		this.inquire_no = inquire_no;
	}

	public String getInquire_sender_index() {
		return inquire_sender_index;
	}

	public void setInquire_sender_index(String inquire_sender_index) {
		this.inquire_sender_index = inquire_sender_index;
	}

	public String getInquire_receiver_index() {
		return inquire_receiver_index;
	}

	public void setInquire_receiver_index(String inquire_receiver_index) {
		this.inquire_receiver_index = inquire_receiver_index;
	}

	public String getInquire_content() {
		return inquire_content;
	}

	public void setInquire_content(String inquire_content) {
		this.inquire_content = inquire_content;
	}

	public String getInquire_attachment_file() {
		return inquire_attachment_file;
	}

	public void setInquire_attachment_file(String inquire_attachment_file) {
		this.inquire_attachment_file = inquire_attachment_file;
	}

	public Date getInquire_sendDate() {
		return inquire_sendDate;
	}

	public void setInquire_sendDate(Date inquire_sendDate) {
		this.inquire_sendDate = inquire_sendDate;
	}

	@Override
	public String toString() {
		return "Inquire [inquire_no=" + inquire_no + ", inquire_sender_index=" + inquire_sender_index
				+ ", inquire_receiver_index=" + inquire_receiver_index + ", inquire_content=" + inquire_content
				+ ", inquire_attachment_file=" + inquire_attachment_file + ", inquire_sendDate=" + inquire_sendDate
				+ "]";
	}

}


