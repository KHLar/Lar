package com.misoot.lar.lecture.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.lecture.model.vo.Lecture;
import com.misoot.lar.lecture.model.vo.LectureBoard;

@Controller
public class LectureController {
	@Autowired
	LarService<Lecture> lectureServiceImpl;
	
	@Autowired
	LarService<LectureBoard> lectureBoardServiceImpl;
	
	@RequestMapping(value = "lecture/regist")
	public String lectureRegist() {
		return "lecture/regist";
	}
	
	@RequestMapping(value = "lecture/recommanded")
	public String lectureRecommanded() {
		return "lecture/recommanded";
	}
}