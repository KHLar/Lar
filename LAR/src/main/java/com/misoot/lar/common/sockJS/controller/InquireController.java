package com.misoot.lar.common.sockJS.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.common.sockJS.model.vo.Inquire;


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
		
		larService.insert(msg);
		
		return msg; 
	} 

}
