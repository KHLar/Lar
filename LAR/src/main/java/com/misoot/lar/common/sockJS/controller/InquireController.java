package com.misoot.lar.common.sockJS.controller;

import java.io.File;
import java.sql.Clob;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.common.sockJS.model.service.InquireServiceImpl;
import com.misoot.lar.common.sockJS.model.vo.Inquire;
import com.misoot.lar.common.util.Utils;
import com.misoot.lar.user.model.vo.User;


@Controller
public class InquireController {
	
	@Autowired
	LarService<Inquire> larService;
	
	@MessageMapping("/question")
    @SendTo("/topic/greetings") 
	public Inquire sendEcho(Inquire msg, @SessionAttribute("session_user") User user) throws Exception { 
		System.out.println("sender : " + msg.getInquire_sender_index());
		System.out.println("receiver : " + msg.getInquire_receiver_index());
		System.out.println("receive message : " + msg.getInquire_content());
		System.out.println("sendDate : " + new Date(System.currentTimeMillis()));
		System.out.println("sendFile : " + msg.getInquire_attachment_file());
		//System.out.println("sendFile : " + msg.getSendFile().getOriginalFilename());
		
		msg.setInquire_sendDate(new Date(System.currentTimeMillis()));
		
		System.out.println("What is msg? : "+msg);
		if(msg.getInquire_attachment_file() == null){
			msg.setInquire_attachment_file("");
		}
		
		Map<String, Object> msgMap = new HashMap<String, Object>();
		
		msgMap.put("msg", msg);
		
		if(user.getUser_level() == 1001) {
			msgMap.put("level", "admin");
		} else {
			msgMap.put("level", "user");
		}
		
		((InquireServiceImpl) larService).insert(msgMap);
		
		return msg;
	}
	/*@RequestMapping("/inquireAttachment")
	public @ResponseBody String inquireAttachment(@RequestParam(value="input_file", required=false) MultipartFile file,
													HttpServletRequest request){
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/uploadFiles/inquire");
		File dir = new File(saveDir);
		System.out.println(saveDir);
		
		return null;
	}*/
	
	
	@RequestMapping(value="/inquireUserView", method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> inquireUserView(@RequestParam("user") int user){
		Utils util = new Utils();
		
		List<Map<String, Object>> list = ((InquireServiceImpl) larService).selectList(user);
		for(Map<String, Object> map : list) {			
			map.put("INQUIRE_CONTENT", util.convertClobToString((Clob) map.get("INQUIRE_CONTENT")));
		}
		System.out.println(list);
		return list;
	}
	
	@RequestMapping(value="/inquireAllView", method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> inquireAllView(){
		
		Utils util = new Utils();
		
		List<Map<String, Object>> list = ((InquireServiceImpl) larService).selectAllList();
		
		for(Map<String, Object> map : list) {			
			map.put("INQUIRE_CONTENT", util.convertClobToString((Clob) map.get("INQUIRE_CONTENT")));
		}
		
		System.out.println(list);
		return list;
	}
	
	@RequestMapping(value="/inquireDelete", method=RequestMethod.POST)
	public @ResponseBody int inquireDelete(@RequestParam("no") int no){
		
		int result = ((InquireServiceImpl) larService).deleteContent(no);
		
		return result;
	}
	
}
