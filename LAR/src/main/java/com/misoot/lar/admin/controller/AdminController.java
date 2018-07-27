package com.misoot.lar.admin.controller;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.misoot.lar.admin.model.service.AdminServiceImpl;
import com.misoot.lar.admin.model.vo.Admin;
import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.common.util.PageInfo;
import com.misoot.lar.user.model.vo.User;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	LarService<Admin> adminServiceImpl;
	
	@RequestMapping(value = {""})
	public String home(Model model) {
		return "admin/home";
	}
	
	@RequestMapping(value= "/charts")
	public String charts(Model model) {
		return "admin/charts";
	}
	
	@RequestMapping(value= "/tables")
	public String tables(Model model) {
		return "admin/tables";
	}
	
	/*
	 * Admin Users area start
	 */
	
	@RequestMapping(value = "/users/list/{page}")
	public String users(Model model, @SessionAttribute("session_user") User session_user,
			@PathVariable("page") int page) {
		int content_per_page = 20;
		int paging_count = 10;

		RowBounds rowBounds = new RowBounds((page - 1) * content_per_page, content_per_page);
		List<User> user_list = ((AdminServiceImpl) adminServiceImpl).selectUserList(session_user.getUser_level(),
				rowBounds);
		int max_list_count = ((AdminServiceImpl) adminServiceImpl).selectUserCount(session_user.getUser_level());

		PageInfo pi = new PageInfo(page, content_per_page, max_list_count, paging_count);

		model.addAttribute("user_list", user_list).addAttribute("pi", pi);

		return "admin/users/userList";
	}
	
	@RequestMapping(value="/users/view/{user_index}")
	public String user_View(Model model, @PathVariable("user_index") int user_index) {
		User view_user = ((AdminServiceImpl) adminServiceImpl).selectUser(user_index);
		
		model.addAttribute("view_user", view_user);
		
		return "admin/users/userView";
	}
	
	/*
	 * Admin Users area End
	 */
		
	@RequestMapping(value= "/lectures")
	public String lectures(Model model) {
		return "admin/lectures";
	}
	
	@RequestMapping(value= "/commu/notice")
	public String commu_notice(Model model) {
		return "admin/commu/notice";
	}
	
	@RequestMapping(value= "/commu/board")
	public String commu_board(Model model) {
		return "admin/commu/board";
	}
	
	@RequestMapping(value= "/commu/qa")
	public String commu_qa(Model model) {
		return "admin/commu/qa";
	}
	
	@RequestMapping(value= "/commu/info")
	public String commu_info(Model model) {
		return "admin/commu/info";
	}
}