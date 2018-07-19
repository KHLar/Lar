package com.misoot.lar.home.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.home.model.vo.Home;

@Controller
public class HomeController {
	
	@Autowired
	LarService<Home> homeServiceImpl;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "home";
	}
	
	@RequestMapping(value="/aboutLar", method = RequestMethod.GET)
	public String aboutLar() {
		return "common/aboutLar";
	}
	
	@RequestMapping(value = "/modal/{target}")
	public String get_modal_sign(@PathVariable("target") String target) {
		return "modal/_" + target;
	}
	
	@RequestMapping(value= "/importExample")
	public String importExample() {
		return "example/importExample";
	}
}