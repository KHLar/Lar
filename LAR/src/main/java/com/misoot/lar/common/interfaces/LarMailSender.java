package com.misoot.lar.common.interfaces;

public interface LarMailSender {
	public boolean emailSender(String to, String subject, String content);
}