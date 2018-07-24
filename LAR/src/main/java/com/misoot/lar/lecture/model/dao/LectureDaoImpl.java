package com.misoot.lar.lecture.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.lecture.model.vo.BoardLectureAttachment;
import com.misoot.lar.lecture.model.vo.Lecture;
import com.misoot.lar.lecture.model.vo.LectureBoard;

@Repository
public class LectureDaoImpl implements LarDao<Lecture> {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public Lecture selectOne(int index) {
		return null;
	}

	
	public List<Map<String, String>> selectList(String category, int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("lecture.selectLectureList", category, rows);
	}

	@Override
	public int insert(Lecture t) {
		return sqlSession.insert("lecture.insertLecture",t);
	}

	@Override
	public int update(Lecture t) {
		return sqlSession.update("lecture.updateLecture");
	}

	@Override
	public int delete(int index) {
		return sqlSession.update("lecture.deleteLecture",index);
	}

	public int insertBoardLeceture(LectureBoard lectureBoard) {
	
		return sqlSession.insert("lecture.insertLectureBoardinsert",lectureBoard);
	}

	public int insertLectureAttachment(BoardLectureAttachment a) {
		return sqlSession.insert("lecture.insertLectureBoardAttachment", a);
	}

	public List<LectureBoard> selectBoardList(int lecture_index) {
		return sqlSession.selectList("lecture.selectBoardList", lecture_index);
	}


	@Override
	public List<Lecture> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

     /* lecture insert*/
	public int selectlectureTotalCount() {
		return sqlSession.selectOne("lecture.selectlectureTotalCount");
	}


	public Lecture selectLectureOne(int lecture_index) {
		return sqlSession.selectOne("lecture.selectLectureOne", lecture_index);
	}


	public LectureBoard selectLectureView(Map<String, Integer> map) {
		return sqlSession.selectOne("lecture.selectLectureView",map);
	}
	

	
	
	
}
