package com.misoot.lar.user.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.lecture.model.vo.Lecture;
import com.misoot.lar.user.model.vo.User;

@Repository
public class UserDaoImpl implements LarDao<User> {
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public User selectOne(int index) {
		return sqlSession.selectOne("", index);
	}

	@Override
	public List<User> selectList() {
		return sqlSession.selectList("");
	}

	@Override
	public int insert(User t) {
		return sqlSession.insert("user.insert", t);
	}

	@Override
	public int update(User t) {
		return sqlSession.update("", t);
	}
	
	@Override
	public int delete(int index) {
		return 0;
	}

	/*
	 * User account start
	*/
	
	public User selectOne(String user_id) {
		return sqlSession.selectOne("user.select", user_id);
	}

	public boolean idDuplicateCheck(String user_id) {
		return ((Integer)sqlSession.selectOne("user.idDuplicateCheck", user_id) == 0) ? true : false;
	}
	
	public boolean nicknameDuplicateCheck(String user_nickname) {
		return ((Integer)sqlSession.selectOne("user.nicknameDuplicateCheck", user_nickname) == 0) ? true : false;
	}
	
	public boolean phoneDuplicateCheck(String user_phone) {
		return ((Integer)sqlSession.selectOne("user.phoneDuplicateCheck", user_phone) == 0) ? true : false;
	}

	public int trySigninCountIncrease(User user) {
		return sqlSession.update("user.trySigninCountIncrease", user);
	}
	
	public int trySigninCountReset(User user) {
		return sqlSession.update("user.trySigninCountReset", user);
	}
	
	/*
	 * User account end
	*/
	
	/*
	 * My page start
	 */	
	public int myPageTotalCnt(HashMap<String, Object> pagingInf) {
		return sqlSession.selectOne("user.myPageTotalCnt", pagingInf);
	}
	
	public List<Map<String, String>> myLectureList(int user_index, int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("user.myLectureList", user_index, rows);
	}

	public List<Map<String, String>> myWishList(int user_index, int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("user.myWishList", user_index, rows);
	}
	
	public List<Map<String, String>> myqnaList(int user_index, int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("user.myqnaList", user_index, rows);
	}

	public List<Map<String, String>> myPaymentList(int user_index) {
		return sqlSession.selectList("user.myPaymentList", user_index);
	}

	public List<Map<String, String>> myCoupontList(int user_index) {
		return sqlSession.selectList("user.myCouponList", user_index);
	}
	
	/*
	 * My page end
	 */
}