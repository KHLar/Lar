package com.misoot.lar.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.community.model.vo.Community;

@Controller
public class CommunityController {
	@Autowired
	LarService<Community> communityServiceImpl;
	
	
}
