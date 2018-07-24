package com.misoot.lar.user.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.lecture.model.vo.Lecture;
import com.misoot.lar.user.model.dao.UserDaoImpl;
import com.misoot.lar.user.model.vo.User;

@Service
public class UserServiceImpl implements LarService<User> {
	@Autowired
	LarDao<User> userDaoImpl;

	@Override
	public User selectOne(int index) {
		return userDaoImpl.selectOne(index);
	}

	@Override
	public List<User> selectList() {
		return userDaoImpl.selectList();
	}

	@Override
	public int insert(User t) {
		return userDaoImpl.insert(t);
	}

	@Override
	public int update(User t) {
		return userDaoImpl.update(t);
	}

	@Override
	public int delete(int index) {
		return userDaoImpl.delete(index);
	}

	/*
	 * User account start
	*/
	public User selectOne(String user_id) {
		return ((UserDaoImpl)userDaoImpl).selectOne(user_id);
	}

	public boolean idDuplicateCheck(String user_id) {
		return ((UserDaoImpl)userDaoImpl).idDuplicateCheck(user_id);
	}

	public boolean nicknameDuplicateCheck(String user_nickname) {
		return ((UserDaoImpl)userDaoImpl).nicknameDuplicateCheck(user_nickname);
	}

	public boolean phoneDuplicateCheck(String user_phone) {
		return ((UserDaoImpl)userDaoImpl).phoneDuplicateCheck(user_phone);
	}

	public int trySigninCountIncrease(User user) {
		return ((UserDaoImpl)userDaoImpl).trySigninCountIncrease(user);
	}
	
	public int trySigninCountReset(User user) {
		return ((UserDaoImpl)userDaoImpl).trySigninCountReset(user);
	}
	
	/*
	 * User account end
	*/
	
	/*
	 * My page start
	 */
	public int myPageTotalCnt(HashMap<String, Object> pagingInf) {
		return ((UserDaoImpl)userDaoImpl).myPageTotalCnt(pagingInf);
	}
	
	public List<Map<String, String>> myLectureList(int user_index, int cPage, int numPerPage) {
		return ((UserDaoImpl)userDaoImpl).myLectureList(user_index, cPage, numPerPage);
	}

	public List<Map<String, String>> myWishList(int user_index, int cPage, int numPerPage) {
		return ((UserDaoImpl)userDaoImpl).myWishList(user_index, cPage, numPerPage);
	}

	public List<Map<String, String>> myqnaList(int user_index, int cPage, int numPerPage) {
		return ((UserDaoImpl)userDaoImpl).myqnaList(user_index, cPage, numPerPage);
	}
	
	public List<Map<String, String>> myPaymentList(int user_index) {
		return ((UserDaoImpl)userDaoImpl).myPaymentList(user_index);
	}

	public List<Map<String, String>> myCoupontList(int user_index) {
		return ((UserDaoImpl)userDaoImpl).myCoupontList(user_index);
	}

	public int deleteWishList(Map<String, Object> checkList) {
		return ((UserDaoImpl)userDaoImpl).deleteWishList(checkList);
	}
	/*
	 * My page end
	 */
	
}