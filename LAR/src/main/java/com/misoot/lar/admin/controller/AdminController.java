package com.misoot.lar.admin.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.misoot.lar.admin.model.service.AdminServiceImpl;
import com.misoot.lar.admin.model.vo.Admin;
import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.common.util.PageInfo;
import com.misoot.lar.commu.model.vo.Commu;
import com.misoot.lar.commu.model.vo.CommuReply;
import com.misoot.lar.user.model.vo.Purchase;
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
	public String user_list(Model model, @SessionAttribute("session_user") User session_user,
			@PathVariable("page") int page) {
		int content_per_page = 20;
		int paging_count = 10;

		RowBounds rowBounds = new RowBounds((page - 1) * content_per_page, content_per_page);
		List<User> user_list = ((AdminServiceImpl) adminServiceImpl).selectUserList(session_user.getUser_level(),
				rowBounds);
		
		if (user_list.size() < 1 && page != 1) return "redirect:/admin/users/list/1"; 
		
		int max_list_count = ((AdminServiceImpl) adminServiceImpl).selectUserCount(session_user.getUser_level());

		PageInfo pi = new PageInfo(page, content_per_page, max_list_count, paging_count);

		model.addAttribute("user_list", user_list).addAttribute("pi", pi);

		return "admin/users/userList";
	}
	
	@RequestMapping(value="/users/view/{user_index}")
	public String user_view(Model model, @PathVariable("user_index") int user_index) {
		User view_user = ((AdminServiceImpl) adminServiceImpl).selectUser(user_index);
		List<Commu> writeList = ((AdminServiceImpl) adminServiceImpl).selectCommuListByUserIndex(user_index);
		List<CommuReply> replyList = ((AdminServiceImpl) adminServiceImpl).selectCommuReplyListByUserIndex(user_index);
		List<Purchase> paymentList = ((AdminServiceImpl) adminServiceImpl).paymentList(user_index);
		
		model.addAttribute("view_user", view_user)
			.addAttribute("writeList", writeList)
			.addAttribute("replyList", replyList)
			.addAttribute("paymentList", paymentList);

		return "admin/users/userView";
	}
	
	@RequestMapping(value="/users/modify", method=RequestMethod.POST)
	public String user_modify(Model model, User user) {
		int result = ((AdminServiceImpl)adminServiceImpl).modifyUserByAdmin(user);
		return "redirect:/admin/users/view/"+user.getUser_index();
	}
	
	@RequestMapping(value="/users/search", method={RequestMethod.POST, RequestMethod.GET})
	public String user_search(@RequestParam("filter") String filter, @RequestParam("text") String text) throws UnsupportedEncodingException {
		System.out.println(text);
		return "redirect:/admin/users/search/"+filter+"/"+URLEncoder.encode(text,"UTF-8")+"/list/1";
	}
	
	// search paging
	@RequestMapping(value="/users/search/{filter}/{text}/list/{page}")
	public String commu_search_paging(Model model, @SessionAttribute("session_user") User session_user, @PathVariable("filter") String filter, @PathVariable("text") String text, @PathVariable("page") int page) throws UnsupportedEncodingException {
		int content_per_page = 20;
		int paging_count = 10;

		RowBounds rowBounds = new RowBounds((page - 1) * content_per_page, content_per_page);
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		searchMap.put("user_level", session_user.getUser_level());
		searchMap.put("filter", filter);
		searchMap.put("text", text);
		
		List<User> user_list = ((AdminServiceImpl) adminServiceImpl).searchUserList(searchMap, rowBounds);
		
		if (user_list.size() < 1 && page != 1) return "redirect:/admin/users/search/"+filter+"/"+URLEncoder.encode(text,"UTF-8")+"/list/1";
		
		int max_list_count = ((AdminServiceImpl) adminServiceImpl).searchUserListCount(searchMap); 
		
		PageInfo pi = new PageInfo(page, content_per_page, max_list_count, paging_count);
		
		model.addAttribute("user_list", user_list).addAttribute("pi", pi);
		
		return "admin/users/userList";
	}
	
	
	/*
	 * Admin Users area End
	 */
	
	
	/*
	 * Admin Lectures area
	 */
	
	//
	@RequestMapping(value= "/lectures/{category}/list/{page}")
	public String lectures(Model model, @PathVariable("category") String category, @PathVariable("page") int page) {
		return "admin/lectures/lectureList";
	}
	
	@RequestMapping(value= "/lectures/{category}/search/{filter}/{text}/list/{page}")
	public String lectures(Model model, @PathVariable("category") String category, @PathVariable("filter") String filter,
							@PathVariable("text") String text, @PathVariable("page") int page) {
		return "admin/lectures/lectureList";
	}
	
	/*
	 * Admin Lectures area End
	 */
	
	
	/*
	 * community area start
	 */
	
	@RequestMapping(value="/commu/{category}/list/{page}")
	public String commu_list(Model model, @PathVariable("category") String category, @PathVariable("page") int page) {
		int content_per_page = 20;
		int paging_count = 10;
		
		RowBounds rowBounds = new RowBounds((page - 1) * content_per_page, content_per_page);
		List<Commu> commu_list = ((AdminServiceImpl) adminServiceImpl).selectCommuList(category, rowBounds);
		
		if (commu_list.size() < 1 && page != 1) return "redirect:/admin/commu/"+category+"/list/1";
		
		int max_list_count = ((AdminServiceImpl) adminServiceImpl).selectCommuListCount(category);
		
		PageInfo pi = new PageInfo(page, content_per_page, max_list_count, paging_count);
		
		model.addAttribute("commu_list", commu_list).addAttribute("pi", pi);
		
		return "admin/commu/"+category;
	}
		
	@RequestMapping(value="/commu/view/{commu_index}")
	public String commu_View(Model model, @PathVariable("commu_index") int commu_index) {
		Commu commu = ((AdminServiceImpl)adminServiceImpl).selectCommuByCommuIndex(commu_index);
		
		if (commu.getCommu_Is_Deleted() == 1) return "redirect:/admin/commu/trash/view/"+commu_index;
		
		List<CommuReply> reply_list = ((AdminServiceImpl)adminServiceImpl).selectCommuReplyListByCommuIndex(commu_index);
		model.addAttribute("view_commu", commu)
			.addAttribute("view_commu_reply", reply_list);
		
		return "admin/commu/commuView";
	}
	
	@RequestMapping(value="/commu/trash/view/{commu_index}")
	public String commu_trash_View(Model model, @PathVariable("commu_index") int commu_index) {
		Commu commu = ((AdminServiceImpl)adminServiceImpl).selectCommuByCommuIndex(commu_index);
		
		if (commu.getCommu_Is_Deleted() == 0) return "redirect:/admin/commu/view/"+commu_index;
		
		List<CommuReply> reply_list = ((AdminServiceImpl)adminServiceImpl).selectCommuReplyListByCommuIndex(commu_index);
		model.addAttribute("view_commu", commu)
			.addAttribute("view_commu_reply", reply_list);
		
		return "admin/commu/commuTrashView";
	}
	
	@RequestMapping(value="/commu/trash/restore/{commu_index}")
	public String commu_trash_restore(Model model, @PathVariable("commu_index") int commu_index) {
		Commu commu = ((AdminServiceImpl)adminServiceImpl).selectCommuByCommuIndex(commu_index);
		
		if (commu.getCommu_Is_Deleted() == 0) {
			String message = "삭제되지 않은 게시글이라 복원할 수 없습니다.";
			String href = "admin/commu/trash/list/1";
			String location = "common/_message";
			model.addAttribute("message", message).addAttribute("href", href);
			
			return location;
		}
		
		boolean result = ((AdminServiceImpl)adminServiceImpl).commuTrashRestore(commu_index);
		
		if (!result) {
			String message = "알 수 없는 오류로 게시글 복원에 실패했습니다.";
			String href = "admin/commu/trash/view/"+commu_index;
			String location = "common/_message";
			model.addAttribute("message", message).addAttribute("href", href);
			
			return location;
		}
		
		return "redirect:/admin/commu/view/"+commu_index;
	}

	
	@RequestMapping(value="/commu/{category}/search", method={RequestMethod.POST, RequestMethod.GET})
	public String commu_search(@PathVariable("category") String category, @RequestParam("filter") String filter, @RequestParam("text") String text) throws UnsupportedEncodingException {
		return "redirect:/admin/commu/"+category+"/search/"+filter+"/"+URLEncoder.encode(text,"UTF-8")+"/list/1";
	}
	
	// search paging
	@RequestMapping(value="/commu/{category}/search/{filter}/{text}/list/{page}")
	public String commu_search_paging(Model model, @PathVariable("category") String category, @PathVariable("filter") String filter, @PathVariable("text") String text, @PathVariable("page") int page) throws UnsupportedEncodingException {
		int content_per_page = 20;
		int paging_count = 10;

		RowBounds rowBounds = new RowBounds((page - 1) * content_per_page, content_per_page);
		
		Map<String, String> searchMap = new HashMap<String, String>();
		
		searchMap.put("category", category);
		searchMap.put("filter", filter);
		searchMap.put("text", text);
		
		List<Commu> commu_list = ((AdminServiceImpl) adminServiceImpl).searchCommuList(searchMap, rowBounds);
		
		if (commu_list.size() < 1 && page != 1) return "redirect:/admin/commu/"+category+"/search/"+filter+"/"+URLEncoder.encode(text,"UTF-8")+"/list/1";
		
		int max_list_count = ((AdminServiceImpl) adminServiceImpl).searchCommuListCount(searchMap); 
		
		PageInfo pi = new PageInfo(page, content_per_page, max_list_count, paging_count);
		
		model.addAttribute("commu_list", commu_list).addAttribute("pi", pi);
		
		return "admin/commu/"+category;
	}
	
	/*
	 * community area end
	 */
}