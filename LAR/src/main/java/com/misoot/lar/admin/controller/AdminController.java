package com.misoot.lar.admin.controller;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.misoot.lar.admin.model.service.AdminServiceImpl;
import com.misoot.lar.admin.model.vo.Admin;
import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.common.util.PageInfo;
import com.misoot.lar.commu.model.vo.Commu;
import com.misoot.lar.commu.model.vo.CommuReply;
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
		List<Commu> writeList = ((AdminServiceImpl) adminServiceImpl).selectCommuListByUserIndex(user_index);
//		List<CommuReply> replyList = ((AdminServiceImpl) adminServiceImpl).selectCommuReplyListByCommuIndex(commu_index);
		
		List<Map<String, Object>> paymentList = ((AdminServiceImpl) adminServiceImpl).paymentList(user_index);
		
		model.addAttribute("view_user", view_user)
			.addAttribute("paymentList", paymentList)
			.addAttribute("writeList", writeList);
		/*
		 * .addAttribute("writeList", writeList);
		 * .addAttribute("replyList", replyList);
		 * 
		 * .addAttribute("lectureLaunchedList", lectureLaunchedList);
		 */
		return "admin/users/userView";
	}
	
	@RequestMapping(value="/users/modify", method=RequestMethod.POST)
	public String user_modify(Model model, User user) {
		int result = ((AdminServiceImpl)adminServiceImpl).modifyUserByAdmin(user);
		return "redirect:/admin/users/view/"+user.getUser_index();
	}
	
	/*
	 * Admin Users area End
	 */
		
	@RequestMapping(value= "/lectures/list/{page}")
	public String lectures(Model model, @PathVariable("page") int page) {
		return "admin/lectures";
	}
		
	/*
	 * community area
	 */
	
	@RequestMapping(value= "/commu/notice/list/{page}")
	public String commu_notice(Model model, @PathVariable("page") int page) {
		int content_per_page = 20;
		int paging_count = 10;

		RowBounds rowBounds = new RowBounds((page - 1) * content_per_page, content_per_page);
		
		List<Commu> commu_list;
		return "admin/commu/notice";
	}
		
	@RequestMapping(value= "/commu/board/list/{page}")
	public String commu_board(Model model, @PathVariable("page") int page) {
		int content_per_page = 5;
		int paging_count = 10;

		RowBounds rowBounds = new RowBounds((page - 1) * content_per_page, content_per_page);
		
		List<Commu> commu_list = ((AdminServiceImpl) adminServiceImpl).selectCommuBoardList(rowBounds);
		int max_list_count = ((AdminServiceImpl) adminServiceImpl).selectCommuBoardListCount(); 
		
		PageInfo pi = new PageInfo(page, content_per_page, max_list_count, paging_count);
		
		model.addAttribute("commu_board_list", commu_list).addAttribute("pi", pi);
		
		return "admin/commu/board";
	}
		
	@RequestMapping(value= "/commu/qa/list/{page}")
	public String commu_qa(Model model, @PathVariable("page") int page) {
		int content_per_page = 20;
		int paging_count = 10;

		RowBounds rowBounds = new RowBounds((page - 1) * content_per_page, content_per_page);
		
		List<Commu> commu_list;
		
		return "admin/commu/qa";
	}
		
	@RequestMapping(value= "/commu/news/list/{page}")
	public String commu_news(Model model, @PathVariable("page") int page) {
		int content_per_page = 20;
		int paging_count = 10;

		RowBounds rowBounds = new RowBounds((page - 1) * content_per_page, content_per_page);
		
		List<Commu> commu_list;
		
		return "admin/commu/news";
	}
	
	@RequestMapping(value= "/commu/view/{commu_index}")
	public String commu_View(Model model, @PathVariable("commu_index") int commu_index) {
		Commu commu = ((AdminServiceImpl)adminServiceImpl).selectCommuByCommuIndex(commu_index);
		List<CommuReply> reply_list = ((AdminServiceImpl)adminServiceImpl).selectCommuReplyListByCommuIndex(commu_index);
		model.addAttribute("view_commu", commu)
			.addAttribute("view_commu_reply", reply_list);
		
		return "admin/commu/commuView";
	}
	
	@RequestMapping(value= "/commu/trash/list/{page}")
	public String commu_trash(Model model, @PathVariable("page") int page) {
		int content_per_page = 20;
		int paging_count = 10;

		RowBounds rowBounds = new RowBounds((page - 1) * content_per_page, content_per_page);
		
		List<Commu> commu_list;
		
		return "admin/commu/trash";
	}
	
	@RequestMapping(value= "/commu/trash/view/{index}")
	public String commu_trash_View(Model model, @PathVariable("index") int index) {
		return "admin/commu/commuView";
	}
	
	/*
	 * community area end
	 */
	
}