package com.misoot.lar.admin.model.vo;

public class Admin extends com.misoot.lar.user.model.vo.User implements java.io.Serializable {

	@Override
	public String toString() {
		return "Admin [getUser_index()=" + getUser_index() + ", getUser_id()=" + getUser_id() + ", getUser_password()="
				+ getUser_password() + ", getUser_nickname()=" + getUser_nickname() + ", getUser_enrolled_date()="
				+ getUser_enrolled_date() + ", getUser_phone()=" + getUser_phone() + ", getUser_level()="
				+ getUser_level() + ", isUser_is_secession()=" + isUser_is_secession() + ", getUser_try_signin_count()="
				+ getUser_try_signin_count() + ", toString()=" + super.toString() + ", hashCode()=" + hashCode() + "]";
	}

	@Override
	public int hashCode() {
		return super.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		return super.equals(obj);
	}	
}