package com.misoot.lar.lecture.model.vo;

public class LectureHistory {

	private int history_user_index;
	private int history_lecture_index;
	private String history_status;

	public LectureHistory() {
		super();
	}

	public LectureHistory(int history_user_index, int history_lecture_index, String history_status) {
		super();
		this.history_user_index = history_user_index;
		this.history_lecture_index = history_lecture_index;
		this.history_status = history_status;
	}

	public int getHistory_user_index() {
		return history_user_index;
	}

	public void setHistory_user_index(int history_user_index) {
		this.history_user_index = history_user_index;
	}

	public int getHistory_lecture_index() {
		return history_lecture_index;
	}

	public void setHistory_lecture_index(int history_lecture_index) {
		this.history_lecture_index = history_lecture_index;
	}

	public String getHistory_status() {
		return history_status;
	}

	public void setHistory_status(String history_status) {
		this.history_status = history_status;
	}

	@Override
	public String toString() {
		return "LectureHistory [history_user_index=" + history_user_index + ", history_lecture_index="
				+ history_lecture_index + ", history_status=" + history_status + "]";
	}
}
