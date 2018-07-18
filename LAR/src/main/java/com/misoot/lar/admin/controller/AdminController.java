package com.misoot.lar.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.misoot.lar.admin.model.vo.Admin;
import com.misoot.lar.common.interfaces.LarService;

@Controller
public class AdminController {
	@Autowired
	LarService<Admin> adminServiceImpl;
}