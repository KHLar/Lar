package com.misoot.lar.lecture.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.misoot.lar.lecture.model.dao.LectureDaoImpl;
import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.lecture.model.vo.BoardLecture;
import com.misoot.lar.lecture.model.vo.BoardLectureAttachment;
import com.misoot.lar.lecture.model.vo.Lecture;

@Service
public class LectureServiceImpl implements LarService<Lecture> {

	
	@Autowired
	LarDao<Lecture> lectureDaoImpl;
	
	
	@Override
	public Lecture selectOne(int index) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Lecture t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int index) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int insert(Lecture t) {
		
		return ((LectureDaoImpl)lectureDaoImpl).insert(t);
	}

	public List<Map<String, String>> selectList (String category, int cPage, int numPerPage) {
		
		return ((LectureDaoImpl)lectureDaoImpl).selectList(category, cPage, numPerPage);
	}
	
	public int insertBoardLeceture(BoardLecture boardLecture, List<BoardLectureAttachment> list ) {
		int result = 0, lecture_board_index =0;
		
		try {
			result = ((LectureDaoImpl)lectureDaoImpl).insertBoardLeceture(boardLecture);
			// if(result==0) ;
			// mapper를 다녀온 Board 객체가 boardNo를 가져온다.
				lecture_board_index = boardLecture.getLecture_board_lecture_index();
			System.out.println("lecture_board_index 확인 : "+lecture_board_index);
			System.out.println("List Size : " + list.size());
			if(list.size()>0){
				for(BoardLectureAttachment a : list){
					a.setLecture_attach_board_index(lecture_board_index);
					result = ((LectureDaoImpl)lectureDaoImpl).insertLectureAttachment(a);
					
					if(result==0); 
				}
			}
		} catch (Exception e) {
			throw e;
		}
		
		return result;
	
	}

	public List<Lecture> selectBoardList(int lectureNo) {
		return ((LectureDaoImpl)lectureDaoImpl).selectBoardList(lectureNo);
	}

	@Override
	public List<Lecture> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectlectureTotalCount() {
		// TODO Auto-generated method stub
		return ((LectureDaoImpl)lectureDaoImpl).selectlectureTotalCount();
	}


	

}
