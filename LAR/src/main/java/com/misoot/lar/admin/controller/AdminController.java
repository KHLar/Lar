package com.misoot.lar.admin.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		int commuList_count = ((AdminServiceImpl) adminServiceImpl).selectCommuListCountByUserIndex(user_index);
		int commuReplyList_count = ((AdminServiceImpl) adminServiceImpl).selectCommuReplyListCountByUserIndex(user_index);
		int payment_count = ((AdminServiceImpl) adminServiceImpl).getPaymentCountByUserIndex(user_index);
		int payment_amount = ((AdminServiceImpl) adminServiceImpl).getPaymentAmountByUserIndex(user_index);
		
		model.addAttribute("view_user", view_user)
			.addAttribute("commuList_count", commuList_count)
			.addAttribute("commuReplyList_count", commuReplyList_count)
			.addAttribute("payment_count", payment_count)
			.addAttribute("payment_amount", payment_amount);
			
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
		
		int result = ((AdminServiceImpl)adminServiceImpl).restoreCommuByCommuIndex(commu_index);
		
		if (result > 0) {
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
	
	
	/*
	 * modal area start
	 */
	
	@RequestMapping(value="/modal", method={RequestMethod.POST, RequestMethod.GET})
	public String modalController(@RequestBody Map<String, Object> modal_header, RedirectAttributes redirectAttributes) {
		
		Set<String> keySet = modal_header.keySet();
		
		for (String k : keySet) {
			System.out.println("key : " + k + ", value : " + modal_header.get(k));
		}
		
		String menu = modal_header.get("menu").toString();
		int index = Integer.parseInt(modal_header.get("index").toString());
		
		if (menu.equals("users")) {
			String list = modal_header.get("list").toString();
			if(!keySet.contains("target_index")) {
				int page = Integer.parseInt(modal_header.get("page").toString());
				
				if (!keySet.contains("filter")) {
					return "redirect:/admin/"+menu+"/view/"+index+"/modal/"+list+"/list/"+page;
				} else {
					String filter = modal_header.get("filter").toString();
					String text = modal_header.get("text").toString();
					return "redirect:/admin/"+menu+"/view/"+index+"/modal/"+list+"/"+filter+"/"+text+"/list/"+page;
				}
			} else {
				int target_index = Integer.parseInt(modal_header.get("target_index").toString());
				String pre_list = modal_header.get("pre_list").toString();
				int pre_page = Integer.parseInt(modal_header.get("pre_page").toString());
				
				if (keySet.contains("filter")) {
					redirectAttributes.addFlashAttribute("filter", modal_header.get("filter"));
					redirectAttributes.addFlashAttribute("text", modal_header.get("text"));
				}
				
				return "redirect:/admin/"+menu+"/view/"+index+"/modal/"+list+"/view/"+target_index+"/"+pre_list+"/"+pre_page;
			}
		} else if (menu.equals("charts")) {
			return "redirect:/admin/"+menu+"/view/"+index+"/modal";
		} else if (menu.equals("delete") || menu.equals("restore")) {
			String list = modal_header.get("list").toString();
			int target_index = Integer.parseInt(modal_header.get("target_index").toString());
			String pre_list = modal_header.get("pre_list").toString();
			int pre_page = Integer.parseInt(modal_header.get("pre_page").toString());
			
			redirectAttributes.addFlashAttribute("pre_list", pre_list);
			redirectAttributes.addFlashAttribute("pre_page", pre_page);
			
			if (keySet.contains("filter")) {
				redirectAttributes.addFlashAttribute("filter", modal_header.get("filter"));
				redirectAttributes.addFlashAttribute("text", modal_header.get("text"));
			}
			
			return "redirect:/admin/"+menu+"/"+index+"/modal/"+list+"/"+target_index;
		} else {
			return "admin/modal/_void";
		}
	}
	
	@RequestMapping(value="/users/view/{user_index}/modal/payment/list/{page}")
	public String modal_paymentListByUserIndex(Model model, @PathVariable("user_index") int user_index,
												@PathVariable("page") int page) {
		return "";
	}
	
	@RequestMapping(value="/users/view/{user_index}/modal/commu/list/{page}")
	public String modal_commuListByUserIndex(Model model, @PathVariable("user_index") int user_index,
												@PathVariable("page") int page) {
		int content_per_page = 20;
		int paging_count = 10;

		RowBounds rowBounds = new RowBounds((page - 1) * content_per_page, content_per_page);
		List<Commu> commu_list = ((AdminServiceImpl) adminServiceImpl).selectCommuListByUserIndex(user_index, rowBounds);
		
		int max_list_count = ((AdminServiceImpl) adminServiceImpl).selectCommuListCountByUserIndex(user_index);
		
		PageInfo pi = new PageInfo(page, content_per_page, max_list_count, paging_count);
		
		model.addAttribute("commu_list", commu_list).addAttribute("pi", pi).addAttribute("user_index", user_index);
		
		return "admin/modal/_commuListByUserIndex";
	}
	
	@RequestMapping(value="/users/view/{user_index}/modal/commuReply/list/{page}")
	public String modal_commuReplyListByUserIndex(Model model, @PathVariable("user_index") int user_index,
												@PathVariable("page") int page) {
		int content_per_page = 20;
		int paging_count = 10;

		RowBounds rowBounds = new RowBounds((page - 1) * content_per_page, content_per_page);
		List<CommuReply> commuReply_list = ((AdminServiceImpl) adminServiceImpl).selectCommuReplyListByUserIndex(user_index, rowBounds);
		
		int max_list_count = ((AdminServiceImpl) adminServiceImpl).selectCommuReplyListCountByUserIndex(user_index);
		
		PageInfo pi = new PageInfo(page, content_per_page, max_list_count, paging_count);
		
		model.addAttribute("commuReply_list", commuReply_list).addAttribute("pi", pi).addAttribute("user_index", user_index);
		
		return "admin/modal/_commuReplyListByUserIndex";
	}
	
	@RequestMapping(value="/users/view/{user_index}/modal/commu/view/{target_index}/{pre_list}/{pre_page}")
	public String modal_commuView(Model model, @PathVariable("user_index") int user_index,
												@PathVariable("target_index") int target_index,
												@PathVariable("pre_list") String pre_list,
												@PathVariable("pre_page") int pre_page,
												@ModelAttribute("filter") String filter,
												@ModelAttribute("text") String text) {
		Commu commu = ((AdminServiceImpl)adminServiceImpl).selectCommuByCommuIndex(target_index);
		
		List<CommuReply> reply_list = ((AdminServiceImpl)adminServiceImpl).selectCommuReplyListByCommuIndex(target_index);
		model.addAttribute("view_commu", commu)
			.addAttribute("view_commu_reply", reply_list)
			.addAttribute("pre_list", pre_list)
			.addAttribute("pre_page", pre_page);
		
		if (filter != null) {
			model.addAttribute("filter", filter).addAttribute("text", text);
		}
		
		return "admin/modal/_commuView";
	}
	
	@RequestMapping(value="/users/view/{user_index}/modal/commu/{filter}/{text}/list/{page}")
	public String modal_searchCommuListByUserIndex(Model model, @PathVariable("user_index") int user_index,
												@PathVariable("filter") String filter,
												@PathVariable("text") String text,
												@PathVariable("page") int page) {
		int content_per_page = 20;
		int paging_count = 10;

		RowBounds rowBounds = new RowBounds((page - 1) * content_per_page, content_per_page);
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		searchMap.put("user_index", user_index);
		searchMap.put("filter", filter);
		searchMap.put("text", text);
		
		List<Commu> commu_list = ((AdminServiceImpl) adminServiceImpl).searchCommuListByUserIndex(searchMap, rowBounds);
		
		int max_list_count = ((AdminServiceImpl) adminServiceImpl).searchCommuListCountByUserIndex(searchMap);
		
		PageInfo pi = new PageInfo(page, content_per_page, max_list_count, paging_count);
		
		model.addAttribute("commu_list", commu_list)
			.addAttribute("pi", pi)
			.addAttribute("user_index", user_index)
			.addAttribute("filter", filter)
			.addAttribute("text", text);
		
		return "admin/modal/_commuListByUserIndex";
	}
	
	@RequestMapping(value="/users/view/{user_index}/modal/commuReply/{filter}/{text}/list/{page}")
	public String modal_searchCommuReplyListSearchByUserIndex(Model model, @PathVariable("user_index") int user_index,
												@PathVariable("filter") String filter,
												@PathVariable("text") String text,
												@PathVariable("page") int page) {
		int content_per_page = 20;
		int paging_count = 10;

		RowBounds rowBounds = new RowBounds((page - 1) * content_per_page, content_per_page);
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		searchMap.put("user_index", user_index);
		searchMap.put("filter", filter);
		searchMap.put("text", text);
		
		List<CommuReply> commuReply_list = ((AdminServiceImpl) adminServiceImpl).searchCommuReplyListByUserIndex(searchMap, rowBounds);;
		
		int max_list_count = ((AdminServiceImpl) adminServiceImpl).searchCommuReplyListCountByUserIndex(searchMap);
		
		PageInfo pi = new PageInfo(page, content_per_page, max_list_count, paging_count);
		
		model.addAttribute("commuReply_list", commuReply_list)
			.addAttribute("pi", pi)
			.addAttribute("user_index", user_index)
			.addAttribute("filter", filter)
			.addAttribute("text", text);
		
		return "admin/modal/_commuReplyListByUserIndex";
	}
	
	@RequestMapping(value = "/delete/{user_index}/modal/{list}/{target_index}")
	public String modal_Delete_Action(Model model, RedirectAttributes redirectAttributes,
			@PathVariable("user_index") int user_index, @PathVariable("list") String list,
			@PathVariable("target_index") int target_index, @ModelAttribute("pre_list") String pre_list,
			@ModelAttribute("pre_page") String pre_page, @ModelAttribute("filter") String filter,
			@ModelAttribute("text") String text) {
		if (list.equals("commu")) {
			int result = ((AdminServiceImpl) adminServiceImpl).deleteCommuByCommuIndex(target_index);
			if (filter != null) {
				redirectAttributes.addFlashAttribute("filter", filter);
				redirectAttributes.addFlashAttribute("text", text);
			}
			return "redirect:/admin/users/view/" + user_index + "/modal/commu/view/" + target_index + "/"
					+ pre_list + "/" + pre_page;
		} else if (list.equals("commuReply")) {
			int result = ((AdminServiceImpl) adminServiceImpl).deleteCommuReplyByCommuIndex(target_index);
			result = ((AdminServiceImpl) adminServiceImpl).getCommuIndexByCommuReplyIndex(target_index);
			if (filter != null) {
				redirectAttributes.addFlashAttribute("filter", filter);
				redirectAttributes.addFlashAttribute("text", text);
			}
			return "redirect:/admin/users/view/" + user_index + "/modal/commu/view/" + result + "/" + pre_list
					+ "/" + pre_page;
		} else {
			return "admin/modal/_void";
		}
	}
	
	@RequestMapping(value = "/restore/{user_index}/modal/{list}/{target_index}")
	public String modal_Restore_Action(Model model, RedirectAttributes redirectAttributes,
			@PathVariable("user_index") int user_index, @PathVariable("list") String list,
			@PathVariable("target_index") int target_index, @ModelAttribute("pre_list") String pre_list,
			@ModelAttribute("pre_page") String pre_page, @ModelAttribute("filter") String filter,
			@ModelAttribute("text") String text) {
		if (list.equals("commu")) {
			int result = ((AdminServiceImpl) adminServiceImpl).restoreCommuByCommuIndex(target_index);
			if (filter != null) {
				redirectAttributes.addFlashAttribute("filter", filter);
				redirectAttributes.addFlashAttribute("text", text);
			}
			return "redirect:/admin/users/view/" + user_index + "/modal/" + list + "/view/" + target_index + "/"
					+ pre_list + "/" + pre_page;
		} else if (list.equals("commuReply")) {
			int result = ((AdminServiceImpl) adminServiceImpl).restoreCommuReplyByCommuIndex(target_index);
			result = ((AdminServiceImpl) adminServiceImpl).getCommuIndexByCommuReplyIndex(target_index);
			if (filter != null) {
				redirectAttributes.addFlashAttribute("filter", filter);
				redirectAttributes.addFlashAttribute("text", text);
			}
			return "redirect:/admin/users/view/" + user_index + "/modal/commu/view/" + result + "/" + pre_list
					+ "/" + pre_page;
		} else {
			return "admin/modal/_void";
		}
	}
	
	
	/*
	 * modal area end
	 */
}