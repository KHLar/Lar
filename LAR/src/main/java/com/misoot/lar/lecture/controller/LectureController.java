package com.misoot.lar.lecture.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;


import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.lecture.model.service.LectureServiceImpl;
import com.misoot.lar.lecture.model.vo.BoardLectureAttachment;
import com.misoot.lar.lecture.model.vo.Lecture;
import com.misoot.lar.lecture.model.vo.LectureBoard;

@Controller
public class LectureController {

	@Autowired
	LarService<Lecture> LectureServiceImpl;

	/*  Lecture*/
	
	@RequestMapping(value = "lecture/regist")
	public String lectureRegist() {
		return "lecture/regist";
	}

	@RequestMapping(value = "lecture/recommanded")
	public String lectureRecommanded() {
		return "lecture/recommanded";
	}
	
/*	@RequestMapping(value = "/lectureView")
	public String lectureView() {
		return "lecture/lectureView";
	}*/

	@RequestMapping(value = "/lectureInsert")
	public String lectureInsert() {
		return "lecture/lectureInsert";
	}
	@RequestMapping(value = "/lectureBoardInsert")
	public String lectureBoardInsert() {
		return "lecture/lectureBoardInsert";
	}
	// 게시글 등록
	@RequestMapping(value="/lecture/lectureInsert", method=RequestMethod.POST)
	public String insertLecture(Lecture Lecture){
		
		int result = ((LectureServiceImpl)LectureServiceImpl).insert(Lecture);
		
		return "redirect:/lectureList";
	}
	//게시글 삭제
	@RequestMapping(value="/lectureDelete")
	public String DeleteLecture(@RequestParam int index){
	
		int result = ((LectureServiceImpl)LectureServiceImpl).delete(index);
		System.out.println("index"+ index +"result=" +result);	
		
		return "redirect:/lectureList";
	}
	//게시글 수정
	@RequestMapping(value="/lectureUpdate")
	public String updateLecture(Lecture t){
			
		
		int result = ((LectureServiceImpl)LectureServiceImpl).update(t);
		
		return "lecture/lectureList";
	}
	
	@RequestMapping(value = "/lectureList")
	public String lectureList(@RequestParam(value="category", required=false, defaultValue="total") String category, Model model,
			@RequestParam(value="cPage", required=false, defaultValue="1")int cPage,
			@RequestParam(value="LecSearchText", required=false, defaultValue="")String LecSearchText) {
		
		int numPerPage = 7;	// 한 페이지 당 게시글 수
		List<Map<String, String>> lList;
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("category", category);
		if(LecSearchText.equals("")){
			LecSearchText="%"+LecSearchText+"%";
		    parameters.put("LecSearchText", LecSearchText);
			lList = ((LectureServiceImpl)LectureServiceImpl).selectList(parameters,cPage, numPerPage);
		}else{
			LecSearchText="%"+LecSearchText+"%";
		    parameters.put("LecSearchText", LecSearchText);
			lList = ((LectureServiceImpl)LectureServiceImpl).selectList(parameters,cPage, numPerPage);
		}
		
		int totalContents = ((LectureServiceImpl)LectureServiceImpl).selectlectureTotalCount(category);
		
		model.addAttribute("lList", lList).addAttribute("numPerPage", numPerPage).addAttribute("totalContents", totalContents);
		model.addAttribute("category",category);
		return "lecture/lectureList";
	}
	//동영상 하나보기
	@RequestMapping(value="/lectureBoardView")
	public String BoardLecutreDetail( @RequestParam("bindex") int lecture_board_index,@RequestParam("index") int lecture_index, Model model){
		
		
		Map< String, Integer> map = new HashMap<String, Integer>();
		map.put( "lecture_board_index", lecture_board_index );
		map.put( "lecture_index", lecture_index );
		
		LectureBoard bLecture = ((LectureServiceImpl)LectureServiceImpl).selectLectureView(map);
		
		List<LectureBoard> blist = ((LectureServiceImpl)LectureServiceImpl).selectBoardList(lecture_index);
		
		
		System.out.println("bLecture="+bLecture+"blist="+blist);
		
		System.out.println(lecture_index);
		
		model.addAttribute("blist",blist).addAttribute("bLecture",bLecture).addAttribute("lecture_index",lecture_index);
		return "lecture/lectureView";
	}
	
	//게시글 하나보기 // 강의 리스트 가져오기
	@RequestMapping(value="lecture/lectureDetail")
	public String lectureDetail(@RequestParam("lecture_index") int lecture_index, Model model){
		Lecture lecture =  ((LectureServiceImpl)LectureServiceImpl).selectLectureOne(lecture_index);
		
	    List<Map<String, Object>> blist = ((LectureServiceImpl)LectureServiceImpl).selectAttachment(lecture_index);
		model.addAttribute("blist",blist).addAttribute(lecture);
		System.out.println("blist"+blist);
		
		return "lecture/lectureDetail";
	}
	
	@RequestMapping(value="/lecture/lecturedelete")
	public String deleteLecture(@RequestParam int index){
		
		int result = ((LectureServiceImpl)LectureServiceImpl).delete(index);
		
	return "redirect:/lecture/lectureList";	
	}
	
	/*     lectureBoard */

	
	//강의 동영상 한개 등록 처리
	@RequestMapping(value = "/lecture/lectureBoardInsert" , method=RequestMethod.POST)
	public  String insertLectureBoardinsert(LectureBoard lectureBoard,@RequestParam("lecture_board_lecture_index") int lecture_index,Model model,
			@RequestParam(value = "upFile", required = false) MultipartFile[] upfiles, HttpServletRequest request) {
			System.out.println("boardLecture"+lectureBoard);
	
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/uploadFiles/BoardLecture");
		
		File dir = new File(saveDir);
	
		if(!dir.exists()) System.out.println("dir.mkdirs() = "+dir.mkdirs());
		
		List<BoardLectureAttachment>  list = new ArrayList<>();
		
		for(MultipartFile f : upfiles){
			if(!f.isEmpty()){
				
				String originFileName = f.getOriginalFilename();
				String ext = originFileName.substring(originFileName.lastIndexOf(".")+1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
				
				int randomNum = (int)(Math.random()*1000);
				String renameFileName = sdf.format(new Date(System.currentTimeMillis()))+"_"+randomNum+"."+ext;
				
				try {
					f.transferTo(new File(saveDir+"/"+renameFileName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
			
				BoardLectureAttachment  blat  = new BoardLectureAttachment();
				blat.setLecture_attach_originfilename(originFileName);
				blat.setLecture_attach_renamedfilename(renameFileName);
				
				list.add(blat);
			}
		}
			int result =0;
			try{
			result = ((LectureServiceImpl)LectureServiceImpl).insertBoardLeceture(lectureBoard, list);
			}	catch(Exception e){
				e.printStackTrace();
			}
			String message = "";
			if(result>0){
				message="게시글 등록 성공";
				
			}	else message="게시글 등록 실패";
				
			
			
		return "redirect:/lecture/lectureDetail?lecture_index="+lecture_index;
	}
	

}
