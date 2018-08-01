package com.misoot.lar.lecture.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;


import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.lecture.model.service.LectureServiceImpl;
import com.misoot.lar.lecture.model.vo.BoardLecture;
import com.misoot.lar.lecture.model.vo.BoardLectureAttachment;
import com.misoot.lar.lecture.model.vo.Lecture;

@Controller
public class LectureController {

	@Autowired
	LarService<Lecture> LectureServiceImpl;

	@RequestMapping(value = "lecture/regist")
	public String lectureRegist() {
		return "lecture/regist";
	}

	@RequestMapping(value = "lecture/recommanded")
	public String lectureRecommanded() {
		return "lecture/recommanded";
	}

	@RequestMapping(value = "/lectureList/")
	public String lectureList() {
		return "lecture/lectureList";
	}

	@RequestMapping(value = "/lectureDetail/")
	public String lectureDetail(@RequestParam int lectureNo, Model model) {
		model.addAttribute("Blist", ((LectureServiceImpl)LectureServiceImpl).selectBoardList(lectureNo));
		return "lecture/lectureDetail";
	}

	@RequestMapping(value = "/lectureView/")
	public String lectureView() {
		return "lecture/lectureView";
	}

	@RequestMapping(value = "/lectureInsert/")
	public String lectureInsert() {
		return "lecture/lectureInsert";
	}
	@RequestMapping(value = "/lectureBoardInsert/")
	public String lectureBoardInsert() {
		return "lecture/lectureBoardInsert";
	}
	//게시글 등록하기 
	@RequestMapping(value="/lecture/lectureInsert", method=RequestMethod.POST)
	public String insertLecture(Lecture Lecture){
		
		int result = ((LectureServiceImpl)LectureServiceImpl).insert(Lecture);
		
		
		return "lecture/lectureList";
	}
	//강의 동영상 게시글 한개 등록 처리
	@RequestMapping(value = "/lecture/lectureBoardInsert/" , method=RequestMethod.POST)
	public  String insertLectureBoardinsert(BoardLecture boardLecture	,Model model,
			@RequestParam(value = "upFile", required = false) MultipartFile[] upfiles, HttpServletRequest request) {
			System.out.println("boardLecture"+boardLecture);
	
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
			int result = 0;
			try{
			result = ((LectureServiceImpl)LectureServiceImpl).insertBoardLeceture(boardLecture, list);
			}	catch(Exception e){
				e.printStackTrace();
			}
			String location = "common/_message";
			String message = "";
			if(result>0){
				message="게시글 등록 성공";
				location = "lecture/lectureDetail";
				System.out.println("location"+location);
				
			}	else message="게시글 등록 실패";
				
			// 그페이지에 보내주는 역할
			model.addAttribute("message", message).addAttribute("location", location);
			
		return location;
	}
	
/*
	@RequestMapping("lecture/lectureView")
	public String selectBoardOne(@RequestParam("no") int boardNo, Model model){
		model.addAttribute("lecture", LectureServiceImpl.selectList()).addAttribute("attachmentList", LectureServiceImpl.selectList());
		
		return "lecture/lectureView";
	}*/
/*	// 게시글 파일 다운로드
		@RequestMapping("/board/fileDownload.do")
		   public void fileDownload(@RequestParam String oName, @RequestParam String rName,
		                        HttpServletRequest request, HttpServletResponse response){ 
		      
		      //파일저장디렉토리
		      String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/upload/board");   
		   
		      BufferedInputStream bis = null;
		      ServletOutputStream sos = null;
		          
		      try {
		         sos = response.getOutputStream();
		         File savedFile = new File(saveDirectory + "/" + rName);
		         response.setContentType("application/octet-stream; charset=utf-8");

		         // 한글파일명 처리 : 브라우져에 따른 인코딩분기
		         String resFilename = "";
		         boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE") != -1 
		                    || request.getHeader("user-agent").indexOf("Trident") != -1;
		         System.out.println("isMSIE="+isMSIE);
		         if(isMSIE){
		            //ie는 utf-8인코딩을 명시적으로 해줌. 공백을 의미하는 +를 %20로 치환.
		            resFilename = URLEncoder.encode(oName, "UTF-8");
		            System.out.println("ie : "+resFilename);//ie : %EC%B7%A8+%EC%97%85+%ED%8A%B9+%EA%B0%95.txt
		                           
		            resFilename = resFilename.replaceAll("\\+", "%20");
		            System.out.println("ie : "+resFilename);//ie : %EC%B7%A8%20%EC%97%85%20%ED%8A%B9%20%EA%B0%95.txt
		         } else {
		            resFilename = new String(oName.getBytes("UTF-8"),"ISO-8859-1");
		            System.out.println("not ie : "+resFilename);
		         }
		         response.addHeader("Content-Disposition",
		               "attachment; filename=\"" + resFilename + "\"");

		         //파일크기지정
		         response.setContentLength((int)savedFile.length());

		         FileInputStream fis = new FileInputStream(savedFile);
		         bis = new BufferedInputStream(fis);
		         int read = 0;

		         while ((read = bis.read()) != -1) {
		            sos.write(read);
		         }
		         
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         
		         try {
		            sos.close();
		            bis.close();
		         } catch (IOException e) {
		            e.printStackTrace();
		         }
		         
		      }
		}*/
	

}
	
	






