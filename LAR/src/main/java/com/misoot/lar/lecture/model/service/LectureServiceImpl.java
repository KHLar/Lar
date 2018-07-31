package com.misoot.lar.lecture.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.lecture.model.dao.LectureDaoImpl;
import com.misoot.lar.lecture.model.vo.BoardLectureAttachment;
import com.misoot.lar.lecture.model.vo.Lecture;
import com.misoot.lar.lecture.model.vo.LectureA;
import com.misoot.lar.lecture.model.vo.LectureBoard;
import com.misoot.lar.lecture.model.vo.LectureQ;
import com.misoot.lar.lecture.model.vo.LectureReview;
import com.misoot.lar.lecture.model.vo.LectureTotalScore;

@Service
public class LectureServiceImpl implements LarService<Lecture> {
	@Autowired
	LarDao<Lecture> lectureDaoImpl;
	@Override
	public List<Lecture> selectList() {
		return null;
	}
	
	@Override
	public Lecture selectOne(int index) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Lecture t) {
		return ((LectureDaoImpl)lectureDaoImpl).update(t);
	}

	@Override
	public int delete(int index) {
		return ((LectureDaoImpl)lectureDaoImpl).delete(index) ;
	}
	@Override
	public int insert(Lecture t) {
	 int result = 0;  
	 int lecture_index = 0;
		try{
			
		 result =((LectureDaoImpl)lectureDaoImpl).insert(t);
		 
		 lecture_index = t.getLecture_index();
		 
		 if(result>0){
			 
			 result = ((LectureDaoImpl)lectureDaoImpl).insertToTal(lecture_index);
		 }
		
		
		
		
		
		}catch( Exception e){
			throw e ;
		}
		
		return result;
	}

	public List<Map<String, String>> selectList (Map<String, String> parameters, int cPage, int numPerPage) {
		
		return ((LectureDaoImpl)lectureDaoImpl).selectList(parameters, cPage, numPerPage);
	}
	
	public int insertBoardLeceture(LectureBoard lectureBoard, List<BoardLectureAttachment> list ) {
		int result = 0, lecture_board_index =0;		
		
		try {
			result = ((LectureDaoImpl)lectureDaoImpl).insertBoardLeceture(lectureBoard);
			// if(result==0) ;
			// mapper를 다녀온 Board 객체가 boardNo를 가져온다.
			lecture_board_index = lectureBoard.getLecture_board_index();
			
			System.out.println("lecture_board_index 확인 : "+lecture_board_index);
			System.out.println("List Size : " + list.size());
			System.out.println("result 값 확인" +result);
			
			if(list.size()>0){
				for(BoardLectureAttachment a : list){
					a.setLecture_attach_board_index(lecture_board_index);
					result = ((LectureDaoImpl)lectureDaoImpl).insertLectureAttachment(a);
				}
			}
		} catch (Exception e) {
			throw e;
		}
		
		return result;
	
	}

	public List<LectureBoard> selectBoardList(int lecture_index) {
		return ((LectureDaoImpl)lectureDaoImpl).selectBoardList(lecture_index);
	}

	
	public int selectlectureTotalCount(String category) {
		return ((LectureDaoImpl)lectureDaoImpl).selectlectureTotalCount(category);
	}

	public Lecture selectLectureOne(int lecture_index) {
		return ((LectureDaoImpl)lectureDaoImpl).selectLectureOne(lecture_index);
	}

	public LectureBoard selectLectureView(Map<String, Integer> map) {
		return ((LectureDaoImpl)lectureDaoImpl).selectLectureView(map);
	}

	public List<Map<String, Object>> selectAttachment(int lecture_index) {

		return ((LectureDaoImpl)lectureDaoImpl).selectAttachment(lecture_index);
	}

	public int insertReview(LectureReview lectureReview) {
		return ((LectureDaoImpl)lectureDaoImpl).insertReview(lectureReview);
	}

	public List<LectureReview> reviewList(int lecture_index) {
		return ((LectureDaoImpl)lectureDaoImpl).reviewList(lecture_index);
	}

	public LectureTotalScore selectTotalScore(int lecture_index) {
		return ((LectureDaoImpl)lectureDaoImpl).selectTotalScore(lecture_index) ;
	}

	public int deleteLecture(int index) {
		return ((LectureDaoImpl)lectureDaoImpl).deleteLecture(index);
	}

	public int updaetStar(int lecture_index) {
		return ((LectureDaoImpl)lectureDaoImpl).updaetStar(lecture_index);
	}

	public int IncreaseLecture(int lecture_index) {
		return ((LectureDaoImpl)lectureDaoImpl).IncreaseLecture(lecture_index);
	}
	
	public int insertQ(LectureQ lectureq) {
		return ((LectureDaoImpl)lectureDaoImpl).insertQ(lectureq);
	}

	public List<Map<String, String>> lectureQlist(int cPage, int numPerPage, int lecidx) {
		return ((LectureDaoImpl)lectureDaoImpl).lectureQlist(cPage, numPerPage, lecidx);
	}

	public int lectureQTotalContents(int lecidx) {
		return ((LectureDaoImpl)lectureDaoImpl).lectureQTotalContents(lecidx);
	}

	public LectureQ lectureQdetail(int qindex) {
		return ((LectureDaoImpl)lectureDaoImpl).lectureQdetail(qindex);
	}

	public List<LectureA> lectureAdetail(int qindex) {
		return ((LectureDaoImpl)lectureDaoImpl).lectureAdetail(qindex);
	}

	public int insertA(Map<String, Object> amap) {
		return ((LectureDaoImpl)lectureDaoImpl).insertA(amap);
	}

	public int updateQhits(int qindex) {
		return ((LectureDaoImpl)lectureDaoImpl).updateQhits(qindex);
	}

	public Map<String, Object> selectBoardUpdate(Map<String, Object> map) {
		return ((LectureDaoImpl)lectureDaoImpl).selectBoardUpdate(map);
	}

	public int deleteBoardLecture(int bindex) {
		return ((LectureDaoImpl)lectureDaoImpl).deleteBoardLecture(bindex);
	}

	public int updateBoard(LectureBoard bo) {
		return ((LectureDaoImpl)lectureDaoImpl).updateBoard(bo);
	}

}
