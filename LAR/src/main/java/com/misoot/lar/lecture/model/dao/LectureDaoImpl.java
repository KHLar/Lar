package com.misoot.lar.lecture.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.lecture.model.vo.BoardLectureAttachment;
import com.misoot.lar.lecture.model.vo.Lecture;
import com.misoot.lar.lecture.model.vo.LectureA;
import com.misoot.lar.lecture.model.vo.LectureBoard;
import com.misoot.lar.lecture.model.vo.LectureQ;
import com.misoot.lar.lecture.model.vo.LectureReview;
import com.misoot.lar.lecture.model.vo.LectureTotalScore;

@Repository
public class LectureDaoImpl implements LarDao<Lecture> {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public Lecture selectOne(int index) {
		return null;
	}
	
	public List<Map<String, String>> selectList(Map<String, String> parameters, int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("lecture.selectLectureList", parameters, rows);
	}

	@Override
	public int insert(Lecture t) {
		return sqlSession.insert("lecture.insertLecture",t);
	}

	@Override
	public int update(Lecture t) {
		
		return sqlSession.update("lecture.updateLecture",t);
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
	public int selectlectureTotalCount(String category) {
		return sqlSession.selectOne("lecture.selectlectureTotalCount",category);
	}


	public Lecture selectLectureOne(int lecture_index) {
		return sqlSession.selectOne("lecture.selectLectureOne", lecture_index);
	}


	public LectureBoard selectLectureView(Map<String, Integer> map) {
		return sqlSession.selectOne("lecture.selectLectureView",map);
	}

	public List<Map<String, Object>> selectAttachment(int lecture_index) {
		return sqlSession.selectList("lecture.selectLectureBoardAttachmentList",lecture_index);
	}

	public int insertReview(LectureReview lectureReview) {
		return sqlSession.insert("lecture.insertLectureReview",lectureReview);
	}


	public List<LectureReview> reviewList(int lecture_index) {
		return sqlSession.selectList("lecture.reviewList", lecture_index);
	}


	public LectureTotalScore selectTotalScore(int lecture_index) {
		return sqlSession.selectOne("lecture.selectTotalScore",lecture_index);
	}


	public int deleteLecture(int index) {
		return sqlSession.update("lecture.deleteLecture",index);
	}


	public int insertToTal(int lecture_index) {
		return sqlSession.insert("lecture.insertTotal",lecture_index);
	}


	public int updaetStar(int lecture_index) {
		return sqlSession.update("lecture.updateStar",lecture_index);
	}

	public int IncreaseLecture(int lecture_index) {
		return sqlSession.update("lecture.IncreaseLecture",lecture_index);
	}
	
	public int insertQ(LectureQ lectureq) {
		return sqlSession.insert("lecture.insertQ", lectureq);
	}

	public List<Map<String, String>> lectureQlist(int cPage, int numPerPage, int lecidx) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("lecture.lectureQlist", lecidx, rows);
	}

	public Map<String, Object> selectBoardUpdate(Map<String, Object> map) {
		return sqlSession.selectOne("lecture.selectBoardUpdate",map);
	}

	public int deleteBoardLecture(int bindex) {
		return sqlSession.update("lecture.deleteBoardLecture",bindex);
	}

	public int lectureQTotalContents(int lecidx) {
		return sqlSession.selectOne("lecture.lectureQTotalContents", lecidx);
	}

	public LectureQ lectureQdetail(int qindex) {
		return sqlSession.selectOne("lecture.lectureQdetail", qindex);
	}

	public List<LectureA> lectureAdetail(int qindex) {
		return sqlSession.selectList("lecture.lectureAdetail", qindex);
	}

	public int insertA(Map<String, Object> amap) {
		return sqlSession.insert("lecture.insertA", amap);
	}

	public int updateQhits(int qindex) {
		return sqlSession.update("lecture.updateQhits", qindex);
	}
	
	// 추천강의
	public List<Lecture> recomandedList(Map<String, String> keyword) {
		RowBounds rows = new RowBounds(1, 6);
		return sqlSession.selectList("lecture.recomandedList", keyword, rows);
	}
}
