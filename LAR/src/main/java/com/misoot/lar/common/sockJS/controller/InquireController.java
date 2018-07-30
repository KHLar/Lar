package com.misoot.lar.common.sockJS.controller;

import java.sql.Clob;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.common.sockJS.model.service.InquireServiceImpl;
import com.misoot.lar.common.sockJS.model.vo.Inquire;
import com.misoot.lar.common.util.Utils;


@Controller
public class InquireController {
	
	@Autowired
	LarService<Inquire> larService;
	
	@MessageMapping("/question")
    @SendTo("/topic/greetings") 
	public Inquire sendEcho(Inquire msg) throws Exception { 
		System.out.println("sender : " + msg.getInquire_sender_index());
		System.out.println("receiver : " + msg.getInquire_receiver_index());
		System.out.println("receive message : " + msg.getInquire_content());
		System.out.println("sendDate : " + new Date(System.currentTimeMillis()));
		
		msg.setInquire_sendDate(new Date(System.currentTimeMillis()));
		
		System.out.println("What is msg? : "+msg);
		if(msg.getInquire_attachment_file() == null){
			msg.setInquire_attachment_file("");
		}
		
		larService.insert(msg);
		
		return msg;
	} 
	
	@RequestMapping(value="/inquireUserView", method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> inquireUserView(@RequestParam("user") int user){
		
		List<Map<String, Object>> list = ((InquireServiceImpl) larService).selectList(user);
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
		
		System.out.println("result : "+ result+"\nno : "+no);
		
		return result;
	}
	
}
