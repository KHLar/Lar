package com.misoot.lar.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.misoot.lar.admin.model.vo.Admin;
import com.misoot.lar.common.interfaces.LarService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	LarService<Admin> adminServiceImpl;
	
	@RequestMapping("/home")
	public String adminHome() {
		return "admin/home";
	}
}