package com.misoot.lar.lecture.controller;

import java.io.File;
import java.io.IOException;

import java.sql.Clob;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.common.util.Utils;
import com.misoot.lar.lecture.model.service.LectureServiceImpl;
import com.misoot.lar.lecture.model.vo.BoardLectureAttachment;
import com.misoot.lar.lecture.model.vo.Lecture;
import com.misoot.lar.lecture.model.vo.LectureA;
import com.misoot.lar.lecture.model.vo.LectureBoard;
import com.misoot.lar.lecture.model.vo.LectureQ;
import com.misoot.lar.lecture.model.vo.LectureReview;
import com.misoot.lar.lecture.model.vo.LectureTotalScore;
import com.misoot.lar.user.model.vo.User;



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
		
		int start = Lecture.getLecture_content().indexOf("//www.youtube.com/embed/") + ("//www.youtube.com/embed/").length();
		
		int end = Lecture.getLecture_content().indexOf("\" width");
		
		Lecture.setLecture_thumbnail(
				"https://img.youtube.com/vi/"+Lecture.getLecture_content().substring(start, end)+"/sddefault.jpg");
		
		int result = ((LectureServiceImpl)LectureServiceImpl).insert(Lecture);
		
		return "redirect:/lectureList";
	}
	
	//게시글 삭제
	@RequestMapping(value="/lectureDelete")
	public String DeleteLecture(@RequestParam int index){
	
		int result = ((LectureServiceImpl)LectureServiceImpl).delete(index);
		return "redirect:/lectureList";
	}
	
	
	//게시글 수정폼으로가기
	@RequestMapping(value="/lectureUpdate")
	public String updateForm(Model model, @RequestParam("index") int lecture_index){
		model.addAttribute("lecture",((LectureServiceImpl)LectureServiceImpl).selectLectureOne(lecture_index));
		return "lecture/lectureUpdate";
	}
	
	//게시글 수정
	@RequestMapping(value="/lecture/lectureUpdateEnd",method=RequestMethod.POST)
	public String updateLecture(Lecture t){
		int result = ((LectureServiceImpl)LectureServiceImpl).update(t);
		return "redirect:/lectureList";
	}
	
	// 동영상 삭제
	@RequestMapping(value="/lectureBoardDelete")
	public String deleteBoard(@RequestParam("bindex") int bindex , @RequestParam("index") int index ){
		int result = ((LectureServiceImpl)LectureServiceImpl).deleteBoardLecture(bindex);
		return "redirect:/lectureBoardView?index="+index+"&bindex="+bindex;
	}
	
	// 리뷰 삭제
	@RequestMapping(value="/deleteReview")
	public String deleteReview(@RequestParam("rindex") int rindex, @RequestParam("index") int index){
		int result = ((LectureServiceImpl)LectureServiceImpl).deleteReview(rindex);
		
		return "redirect:/lecture/lectureDetail?lecture_index="+index;	
	}
	
	//동영상 수정폼으로 가기
	@RequestMapping(value="/lectureBoardUpdate")
	public String updateBoardForm(Model model , @RequestParam("bindex") int bindex, @RequestParam("index") int index){
		
		Map< String, Object> map = new HashMap<String, Object>();
		map.put( "bindex", bindex );
		map.put("index", index);
		
		map = ((LectureServiceImpl)LectureServiceImpl).selectBoardUpdate(map);
		
		Utils utils = new Utils();
		
		map.put("LECTURE_BOARD_CONTENT", utils.convertClobToString((Clob) map.get("LECTURE_BOARD_CONTENT")));
		
		model.addAttribute("b", map);
		
		return "lecture/lectureBoardUpdate";
	}
	
	//동영상 수정하기 
	@RequestMapping(value="/lecture/lectureBoardUpdateEnd",method=RequestMethod.POST)
	public String updateBoardLecture(LectureBoard bo){
		int bindex = bo.getLecture_board_index();
		int index = bo.getLecture_board_lecture_index();
		
		int result =   ((LectureServiceImpl)LectureServiceImpl).updateBoard(bo);
		return "redirect:/lectureBoardView?index="+index+"&bindex="+bindex;
	}
	
	// 강의 리스트 불러오기
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

	//게시글 하나보기 // 강의 리스트 가져오기 //댓글 리스트 가져오기
	@RequestMapping(value="lecture/lectureDetail")
	public String lectureDetail(HttpServletResponse response, HttpServletRequest request,@RequestParam("lecture_index") int lecture_index, 
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model, HttpSession session){
		
		Lecture lecture =  ((LectureServiceImpl)LectureServiceImpl).selectLectureOne(lecture_index);
		
		LectureTotalScore lectureTotalScore = ((LectureServiceImpl)LectureServiceImpl).selectTotalScore(lecture_index);
		
		List<LectureReview> rlist = ((LectureServiceImpl)LectureServiceImpl).reviewList(lecture_index);
		boolean chk = true;
		if(session.getAttribute("session_user") != null){
			for(LectureReview r : rlist){
				if(r.getLecture_review_writer_index() == ((User)session.getAttribute("session_user")).getUser_index()){
					chk = false;
					break;
				}
			}
		}
		// QnA		
		int numPerPage = 10;
		
		List<Map<String, String>> qlist = ((LectureServiceImpl)LectureServiceImpl).lectureQlist(cPage, numPerPage, lecture_index);
		
		int totalContents = ((LectureServiceImpl)LectureServiceImpl).lectureQTotalContents(lecture_index);
		// QnA
		
		Cookie cookies[] = request.getCookies();
		
		Map mapCookie = new HashMap<>();
		
		if (request.getCookies() != null) {
			for (int i = 0; i < cookies.length; i++) {
				mapCookie.put(cookies[i].getName(), cookies[i].getValue());
			}
		}
		
		String cookie_read_count = (String) mapCookie.get("read_count");
		
		String new_cookie_read_count = "|" + lecture_index;
		
		// 저장된 쿠키에 새로운 쿠키값이 존재하는 지 검사
		if (cookie_read_count == null) cookie_read_count = "";
		
		Cookie cookie;
		
		if (!cookie_read_count.contains(new_cookie_read_count)) {
			// 없을 경우 쿠키 생성
			cookie = new Cookie("read_count", cookie_read_count + new_cookie_read_count);
			response.addCookie(cookie); // 조회수 업데이트
			int increase = ((LectureServiceImpl) LectureServiceImpl).IncreaseLecture(lecture_index);
			
		}else{
			cookie=new Cookie("read_count",new_cookie_read_count);
			response.addCookie(cookie); 
		}
		
	    List<Map<String, Object>> blist = ((LectureServiceImpl)LectureServiceImpl).selectAttachment(lecture_index);
	    
		 for(int i = 0; i < blist.size() - 1 ; i++){
			 for(int j = i+1; j < blist.size() ; j++){
				 if(blist.get(i).get("LECTURE_BOARD_CHAPTER").equals(blist.get(j).get("LECTURE_BOARD_CHAPTER"))){
					 blist.get(j).put("LECTURE_BOARD_CHAPTER", "");
				 }
			 }
		 }
	    
		model.addAttribute("blist",blist).addAttribute("lecture",lecture).
		addAttribute("lectureTotalScore",lectureTotalScore).addAttribute("rlist", rlist).
		addAttribute("qlist", qlist).addAttribute("numPerPage", numPerPage).
		addAttribute("totalContents", totalContents)
		.addAttribute("chk",chk);
		
		return "lecture/lectureDetail";
	}
	
	//동영상 하나보기
	@RequestMapping(value="/lectureBoardView")
	public String BoardLecutreDetail( @RequestParam("bindex") int lecture_board_index,@RequestParam("index") int lecture_index, Model model){
		
		
		Map< String, Integer> map = new HashMap<String, Integer>();
		map.put( "lecture_board_index", lecture_board_index );
		map.put( "lecture_index", lecture_index );
		
		LectureBoard bLecture = ((LectureServiceImpl)LectureServiceImpl).selectLectureView(map);
		
		/*List<LectureBoard> blist = ((LectureServiceImpl)LectureServiceImpl).selectBoardList(lecture_index);*/
		 List<Map<String, Object>> blist = ((LectureServiceImpl)LectureServiceImpl).selectAttachment(lecture_index);
		 for(int i = 0; i < blist.size() - 1 ; i++){
			 for(int j = i+1; j < blist.size() ; j++){
				 if(blist.get(i).get("LECTURE_BOARD_CHAPTER").equals(blist.get(j).get("LECTURE_BOARD_CHAPTER"))){
					 blist.get(j).put("LECTURE_BOARD_CHAPTER", "");
				 }
			 }
		 }
	/*	
		System.out.println("bLecture="+bLecture+"blist="+blist);
		
		System.out.println(lecture_index);*/
		
		model.addAttribute("blist",blist).addAttribute("bLecture",bLecture).addAttribute("lecture_index",lecture_index);
		return "lecture/lectureView";
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

	//댓글과 평점쓰기
	@RequestMapping(value="/lecture/lectureReview", method=RequestMethod.GET)
	public String insertReview(@RequestParam("lecture_review_lecture_index") int lecture_index ,
	@RequestParam("lecture_review_writer_index") int lecture_review_writer_index ,@RequestParam("lecture_review_score") int lecture_review_score,
	@RequestParam("lecture_review_title") String lecture_review_title , @RequestParam("lecture_review_content") String lecture_review_content,@RequestParam("lecture_review_index") String lecture_review_index, Model model){

		LectureReview lectureReview = new  LectureReview();
		
		lectureReview.setLecture_review_lecture_index(lecture_index);
		lectureReview.setLecture_review_score(lecture_review_score);
		lectureReview.setLecture_review_title(lecture_review_title);
		lectureReview.setLecture_review_content(lecture_review_content);
		lectureReview.setLecture_review_writer_index(lecture_review_writer_index);
		
		System.out.println("lectureReview="+lectureReview);
		
		if(lecture_review_index==null || lecture_review_index == ""){
		
		int result = ((LectureServiceImpl)LectureServiceImpl).insertReview(lectureReview);
		
		int result2 =  ((LectureServiceImpl)LectureServiceImpl).updaetStar(lecture_index);
		}else{
			Map<String, Object> rmap = new HashMap<String, Object>();
			rmap.put("lecture_review_writer_index", lecture_review_writer_index);
			rmap.put("lecture_review_lecture_index", lecture_index);
			rmap.put("lectureReview", lectureReview);
			int result3 =  ((LectureServiceImpl)LectureServiceImpl).updateReview(rmap);
			
			int result2 =  ((LectureServiceImpl)LectureServiceImpl).reupdaetStar(lecture_index);
		}	
		
		System.out.println("lectureReview="+lectureReview);
		
		return "redirect:/lecture/lectureDetail?lecture_index="+lecture_index;
	}
	
	@RequestMapping("/lecture/QnA/writeForm")
	public String writeFormView() {
		return "lecture/writeFormQnA";
	}
	
	@RequestMapping("/lecture/QnA/insertQ")
	public String insertQ(LectureQ lectureq, @SessionAttribute("session_user") User user,Model model) {
		
		lectureq.setUser_index(user.getUser_index());
		
		int result = ((LectureServiceImpl)LectureServiceImpl).insertQ(lectureq);
		
		return "redirect:/lecture/QnA/detail/"+result;
	}
	
	@RequestMapping("/lecture/QnA/detail/{content}")
	public String lectureQnAdetail(@PathVariable int content, Model model) {
		
		int result = ((LectureServiceImpl)LectureServiceImpl).updateQhits(content);
		
		if(result > 0) {
			LectureQ lectureQ = ((LectureServiceImpl)LectureServiceImpl).lectureQdetail(content);
			
			List<LectureA> lectureA = ((LectureServiceImpl)LectureServiceImpl).lectureAdetail(content);
			
			model.addAttribute("lectureQ",lectureQ).addAttribute("lectureA", lectureA);
		}
		
		return "lecture/detailQnA";
	}
	
	@RequestMapping("/lecture/QnA/insertA")
	public String insertA(LectureA lecturea, @SessionAttribute("session_user") User user) {
		
		Map<String, Object> amap = new HashMap<String, Object>();
		
		System.out.println(user.getUser_index());
		
		amap.put("useridx", user.getUser_index());
		amap.put("lecturea", lecturea);
		
		int result = ((LectureServiceImpl)LectureServiceImpl).insertA(amap);
		
		return "redirect:/lecture/QnA/detail?content="+lecturea.getLecture_a_lecture_q_index();
	}
	
	@RequestMapping("/lecture/QnA/updateQ/{qindex}")
	public String updateQview(@PathVariable int qindex, Model model) {
		LectureQ lectureq = ((LectureServiceImpl)LectureServiceImpl).updateQview(qindex);
		
		model.addAttribute("lectureq", lectureq);
		
		return "lecture/updateFormQnA";
	}
	
	@RequestMapping("/lecture/QnA/updateQ")
	public String updateQ(LectureQ lectureq) {
		int result = ((LectureServiceImpl)LectureServiceImpl).updateQ(lectureq); 
		return "redirect:/lecture/QnA/detail/"+lectureq.getLecture_q_index();
	}
	
	// 추천강의
	@RequestMapping("/recommanded")
	public String recomandedList(Model model) {
		
		Map<String, String> keyword = new HashMap<String, String>();
		
		keyword.put("keyword", "reviews");
		List<Lecture> reviews = ((LectureServiceImpl)LectureServiceImpl).recomandedList(keyword);
		
		keyword.put("keyword", "score");
		List<Lecture> score = ((LectureServiceImpl)LectureServiceImpl).recomandedList(keyword);
		
		keyword.put("keyword", "hotest");
		List<Lecture> hotest = ((LectureServiceImpl)LectureServiceImpl).recomandedList(keyword);
		
		Map<String, List<Lecture>> recomandedList = new HashMap<String, List<Lecture>>();
		
		recomandedList.put("reviews", reviews);
		recomandedList.put("score", score);
		recomandedList.put("hotest", hotest);
		
		System.out.println(recomandedList);
		
		model.addAttribute("recomandedList", recomandedList);
		
		return "lecture/recommanded";
	}
}
