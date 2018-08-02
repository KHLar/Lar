package com.misoot.lar.admin.controller;

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
	public String users(Model model, @SessionAttribute("session_user") User session_user,
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
	public String user_View(Model model, @PathVariable("user_index") int user_index) {
		User view_user = ((AdminServiceImpl) adminServiceImpl).selectUser(user_index);
		List<Commu> writeList = ((AdminServiceImpl) adminServiceImpl).selectCommuListByUserIndex(user_index);
//		List<CommuReply> replyList = ((AdminServiceImpl) adminServiceImpl).selectCommuReplyListByCommuIndex(commu_index);
		
		List<Purchase> paymentList = ((AdminServiceImpl) adminServiceImpl).paymentList(user_index);
		
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
	
	
	/*
	 * Admin Lectures area
	 */
	
	@RequestMapping(value= "/lectures/list/{page}")
	public String lectures(Model model, @PathVariable("page") int page) {
		return "admin/lectures/lectureList";
	}
	
	/*
	 * Admin Lectures area End
	 */
	
	
	/*
	 * community area start
	 */
	
	@RequestMapping(value="/commu/notice/list/{page}")
	public String commu_notice(Model model, @PathVariable("page") int page) {
		int content_per_page = 20;
		int paging_count = 10;
		
		RowBounds rowBounds = new RowBounds((page - 1) * content_per_page, content_per_page);
		
		List<Commu> commu_list = ((AdminServiceImpl) adminServiceImpl).selectCommuNoticeList(rowBounds);
		
		if (commu_list.size() < 1 && page != 1) return "redirect:/admin/commu/notice/list/1";
		
		int max_list_count = ((AdminServiceImpl) adminServiceImpl).selectCommuNoticeListCount();
		
		PageInfo pi = new PageInfo(page, content_per_page, max_list_count, paging_count);
				
		model.addAttribute("commu_notice_list", commu_list).addAttribute("pi", pi);
		
		return "admin/commu/notice";
	}
		
	@RequestMapping(value="/commu/board/list/{page}")
	public String commu_board(Model model, @PathVariable("page") int page) {
		int content_per_page = 20;
		int paging_count = 10;

		RowBounds rowBounds = new RowBounds((page - 1) * content_per_page, content_per_page);
		
		List<Commu> commu_list = ((AdminServiceImpl) adminServiceImpl).selectCommuBoardList(rowBounds);
		
		if (commu_list.size() < 1 && page != 1) return "redirect:/admin/commu/board/list/1";
		
		int max_list_count = ((AdminServiceImpl) adminServiceImpl).selectCommuBoardListCount(); 
		
		PageInfo pi = new PageInfo(page, content_per_page, max_list_count, paging_count);
		
		model.addAttribute("commu_board_list", commu_list).addAttribute("pi", pi);
		
		return "admin/commu/board";
	}
	
	@RequestMapping(value="/commu/qa/list/{page}")
	public String commu_qa(Model model, @PathVariable("page") int page) {
		int content_per_page = 20;
		int paging_count = 10;

		RowBounds rowBounds = new RowBounds((page - 1) * content_per_page, content_per_page);
		
		List<Commu> commu_list = ((AdminServiceImpl) adminServiceImpl).selectCommuQaList(rowBounds);
		
		if (commu_list.size() < 1 && page != 1) return "redirect:/admin/commu/qa/list/1";
		
		int max_list_count = ((AdminServiceImpl) adminServiceImpl).selectCommuQaListCount(); 
		
		PageInfo pi = new PageInfo(page, content_per_page, max_list_count, paging_count);
		
		model.addAttribute("commu_qa_list", commu_list).addAttribute("pi", pi);
		
		return "admin/commu/qa";
	}
		
	@RequestMapping(value="/commu/news/list/{page}")
	public String commu_news(Model model, @PathVariable("page") int page) {
		int content_per_page = 20;
		int paging_count = 10;

		RowBounds rowBounds = new RowBounds((page - 1) * content_per_page, content_per_page);
		
		List<Commu> commu_list = ((AdminServiceImpl) adminServiceImpl).selectCommuNewsList(rowBounds);
		
		if (commu_list.size() < 1 && page != 1) return "redirect:/admin/commu/news/list/1";
		
		int max_list_count = ((AdminServiceImpl) adminServiceImpl).selectCommuNewsListCount(); 
		
		PageInfo pi = new PageInfo(page, content_per_page, max_list_count, paging_count);
		
		model.addAttribute("commu_news_list", commu_list).addAttribute("pi", pi);
		
		return "admin/commu/news";
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
	
	@RequestMapping(value="/commu/trash/list/{page}")
	public String commu_trash(Model model, @PathVariable("page") int page) {
		int content_per_page = 20;
		int paging_count = 10;

		RowBounds rowBounds = new RowBounds((page - 1) * content_per_page, content_per_page);
		
		List<Commu> commu_list = ((AdminServiceImpl) adminServiceImpl).selectCommuTrashList(rowBounds);
		
		if (commu_list.size() < 1 && page != 1) return "redirect:/admin/commu/trash/list/1";
		
		int max_list_count = ((AdminServiceImpl) adminServiceImpl).selectCommuTrashListCount(); 
		
		PageInfo pi = new PageInfo(page, content_per_page, max_list_count, paging_count);
		
		model.addAttribute("commu_trash_list", commu_list).addAttribute("pi", pi);
		
		return "admin/commu/trash";
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

	
	@RequestMapping(value="/commu/{category}/search", method=RequestMethod.POST)
	public String commu_search(@PathVariable("category") String category, @RequestParam("filter") String filter, @RequestParam("text") String text) {
		return "redirect:/admin/commu/"+category+"/search/"+filter+"/"+text+"/list/1";
	}
		
	// search paging
	@RequestMapping(value="/commu/{category}/search/{filter}/{text}/list/{page}")
	public String commu_search_paging(Model model, @PathVariable("category") String category, @PathVariable("filter") String filter, @PathVariable("text") String text, @PathVariable("page") int page) {
		int content_per_page = 20;
		int paging_count = 10;

		RowBounds rowBounds = new RowBounds((page - 1) * content_per_page, content_per_page);
		
		Map<String, String> searchMap = new HashMap<String, String>();
		
		searchMap.put("category", category);
		searchMap.put("filter", filter);
		searchMap.put("text", text);
		
		List<Commu> commu_list = ((AdminServiceImpl) adminServiceImpl).searchCommuList(searchMap, rowBounds);
		
		if (commu_list.size() < 1 && page != 1) return "redirect:/admin/commu/"+category+"/search/"+filter+"/"+text+"/list/1";
		
		int max_list_count = ((AdminServiceImpl) adminServiceImpl).selectCommuTrashListCount(); 
		
		PageInfo pi = new PageInfo(page, content_per_page, max_list_count, paging_count);
		
		return "admin/commu/notice";
	}
	
	/*
	 * community area end
	 */
	
}