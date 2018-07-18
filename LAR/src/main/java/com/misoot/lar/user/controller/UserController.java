package com.misoot.lar.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.misoot.lar.common.interfaces.LarMailSender;
import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.lecture.model.vo.Lecture;
import com.misoot.lar.user.model.service.UserServiceImpl;
import com.misoot.lar.user.model.vo.User;

@Controller
@SessionAttributes(value={"session_user"})
public class UserController {
	@Autowired
	private LarService<User> userServiceImpl;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	@Autowired
	private LarMailSender larMailSenderImpl;
	
	@ResponseBody
	@RequestMapping(value="/user/idDuplicateCheck", method=RequestMethod.POST)
	public boolean idDuplicateCheck(@RequestParam("value") String user_id) {
		
		System.out.println(user_id);
		return ((UserServiceImpl)userServiceImpl).idDuplicateCheck(user_id);
	}
	
	@ResponseBody
	@RequestMapping(value="/user/nicknameDuplicateCheck", method=RequestMethod.POST)
	public boolean nicknameDuplicateCheck(@RequestParam("value") String user_nickname) {
		System.out.println(user_nickname);
		return ((UserServiceImpl)userServiceImpl).nicknameDuplicateCheck(user_nickname);
	}
	
	@ResponseBody
	@RequestMapping(value="/user/phoneDuplicateCheck", method=RequestMethod.POST)
	public boolean phoneDuplicateCheck(@RequestParam("value") String user_phone) {
		System.out.println(user_phone);
		return ((UserServiceImpl)userServiceImpl).phoneDuplicateCheck(user_phone);
	}
	
	@RequestMapping(value="/user/signup", method=RequestMethod.POST)
	public String signup(User user, Model model) {
		// password encoding
		System.out.println(user);
		
		user.setUser_password(bcryptPasswordEncoder.encode(user.getUser_password()));
		
		int result = ((UserServiceImpl)userServiceImpl).insert(user);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/user/signin", method=RequestMethod.POST)
	public String signin(User temp, Model model) {
		
		System.out.println("temp : " + temp);
		
		User user = ((UserServiceImpl)userServiceImpl).selectOne(temp.getUser_id());
		
		System.out.println("user : " + user);
		
		String message = "";
		String location = "common/_message";
		String href = "";
		
		if (user == null) {
			message = "존재하지 않는 사용자입니다.";
			model.addAttribute("message", message);
		} else {
			if (user.getUser_try_signin_count() > 4) {
				message = "로그인 시도 " + user.getUser_try_signin_count() + "회 : 계정 잠금 해제 페이지로 이동합니다.";
				href = "user/unlock";
			} else {
				if (bcryptPasswordEncoder.matches(temp.getUser_password(), user.getUser_password())) {
					// 접속 카운트 reset
					int result = ((UserServiceImpl)userServiceImpl).trySigninCountReset(user);
					model.addAttribute("session_user", user);
					location = "redirect:/";
				} else {
					// 접속 카운트 add
					int result = ((UserServiceImpl)userServiceImpl).trySigninCountIncrease(user);
					message = "로그인 시도 " + user.getUser_try_signin_count() + "회 : 비밀번호를 확인해주세요!";
				}
			}
		}
		model.addAttribute("message", message).addAttribute("href", href);
		
		return location;
	}
	
	@RequestMapping(value="/user/signout")
	public String signout(SessionStatus status) {
		if (!status.isComplete()) status.setComplete();
		return "redirect:/";
	}
	
	@RequestMapping(value="/user/unlock")
	public String unlockPage() {
		return "user/unlock";
	}
	
	// email send example
	@RequestMapping(value = "/user/mailtest")
	public String mailtest(Model model) {
		// to, subject, content
		boolean result = larMailSenderImpl.emailSender("psh6185@naver.com", "진짜 테스트임", "아무의미없쬬?");

		if (result) {
			return "redirect:/";
		} else {
			String message = "이메일 전송 실패!";
			String href = "";
			model.addAttribute("message", message).addAttribute("href", href);
			return "common/_message";
		}
	}
	
	
	// REST URL PATTERN
	// ex) /user/view/faker => view faker's page
	// If it is equal to session.getAttribute("user")
	// This page is probably means my page.	
	@RequestMapping(value = "/user/view/{user_nickname}")	
	public String user(
			@PathVariable("user_nickname") String user_nickname,
			Model model) {
		
//		model.addAttribute("","");
		
		return "user/userDetail";
	}
	
	@RequestMapping(value = "/user/cart")
	public String cart() {
		return "user/cart";
	}
	
	@RequestMapping(value = "/user/purchase")
	public String purchase() {
		return "user/purchase";
	}
	
	@RequestMapping(value = "/mypage")
	public String mypageList(@ModelAttribute("session_user") User user, Model model,
								@RequestParam(value="lcPage", required=false, defaultValue="1") int lcPage, 
								@RequestParam(value="wcPage", required=false, defaultValue="1") int wcPage,
								@RequestParam(value="qnaPage",required=false, defaultValue="1") int qnaPage) {
		
		int numPerPage = 5;
		
		List<Map<String, String>> llist = ((UserServiceImpl) userServiceImpl).myLectureList(user.getUser_index(), lcPage, numPerPage);
		List<Map<String, String>> qnalist = ((UserServiceImpl) userServiceImpl).myqnaList(user.getUser_index(), lcPage, numPerPage);
		List<Map<String, String>> wlist = ((UserServiceImpl) userServiceImpl).myWishList(user.getUser_index(), qnaPage, numPerPage);
		List<Map<String, String>> plist = ((UserServiceImpl) userServiceImpl).myPaymentList(user.getUser_index());
		List<Map<String, String>> couponlist =  ((UserServiceImpl) userServiceImpl).myCoupontList(user.getUser_index());
		
		HashMap<String, Object> pagingInf = new HashMap<String, Object>();
		
		pagingInf.put("user_index", user.getUser_index());
		
		pagingInf.put("tab", "myLecture");
		pagingInf.put("lTotalCnt",((UserServiceImpl) userServiceImpl).myPageTotalCnt(pagingInf));
		
		pagingInf.put("tab", "wishList");
		pagingInf.put("wTotalCnt",((UserServiceImpl) userServiceImpl).myPageTotalCnt(pagingInf));
		
		pagingInf.put("tab", "QnAList");
		pagingInf.put("qnaTotalCnt",((UserServiceImpl) userServiceImpl).myPageTotalCnt(pagingInf));
		
		model.addAttribute("llist", llist)
			.addAttribute("wlist", wlist)
			.addAttribute("qnalist", qnalist)
			.addAttribute("plist", plist)
			.addAttribute("clist", couponlist)
			.addAttribute("numPerPage", numPerPage)
			.addAttribute("pagingInf", pagingInf);
		
		return "user/mypage";
	}
	
	@RequestMapping("/mypage/deleteWishList")
	public String deleteWishList(){
		return "redirect:/mypage";
	}
}