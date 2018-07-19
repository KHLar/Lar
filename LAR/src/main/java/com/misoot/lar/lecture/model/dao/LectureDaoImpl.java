package com.misoot.lar.lecture.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.lecture.model.vo.BoardLecture;
import com.misoot.lar.lecture.model.vo.BoardLectureAttachment;
import com.misoot.lar.lecture.model.vo.Lecture;

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
		return 0;
	}

	@Override
	public int delete(int index) {
		return 0;
	}

	public int insertBoardLeceture(BoardLecture boardLecture) {
	
		return sqlSession.insert("lecture.insertLectureBoardinsert",boardLecture);
	}

	public int insertLectureAttachment(BoardLectureAttachment a) {
		return sqlSession.insert("lecture.insertLectureBoardAttachment", a);
	}

	public List<Lecture> selectBoardList(int lectureNo) {
		return sqlSession.selectList("lecture.selectLectureBoardList", lectureNo);
	}


	@Override
	public List<Lecture> selectList() {
		// TODO Auto-generated method stub
		return null;
	}


	public int selectlectureTotalCount() {
		return sqlSession.selectOne("lecture.selectlectureTotalCount");
	}
	

	
	
	
}
