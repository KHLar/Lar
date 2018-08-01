package com.misoot.lar.admin.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.misoot.lar.admin.model.dao.AdminDaoImpl;
import com.misoot.lar.admin.model.vo.Admin;
import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.commu.model.vo.Commu;
import com.misoot.lar.commu.model.vo.CommuReply;
import com.misoot.lar.user.model.vo.Purchase;
import com.misoot.lar.user.model.vo.User;

@Service
public class AdminServiceImpl implements LarService<Admin> {

	@Autowired
	LarDao<Admin> adminDaoImpl;
	
	@Deprecated
	@Override
	public Admin selectOne(int index) {
		return null;
	}

	@Deprecated
	@Override
	public List<Admin> selectList() {
		return null;
	}

	@Override
	public int insert(Admin t) {
		return adminDaoImpl.insert(t);
	}

	@Override
	public int update(Admin t) {
		return adminDaoImpl.update(t);
	}

	@Override
	public int delete(int index) {
		return adminDaoImpl.delete(index);
	}

	public List<User> selectUserList(int user_level, RowBounds rowBounds) {
		return ((AdminDaoImpl)adminDaoImpl).selectUserList(user_level, rowBounds);
	}
	
	public User selectUser(int user_index) {
		return ((AdminDaoImpl)adminDaoImpl).selectUser(user_index);
	}

	public int selectUserCount(int user_level) {
		return ((AdminDaoImpl)adminDaoImpl).selectUserCount(user_level);
	}
	
	public int modifyUserByAdmin(User user) {
		return ((AdminDaoImpl)adminDaoImpl).modifyUserByAdmin(user);
	}
	
	/*
	 * community area
	 */
	
	public List<Commu> selectCommuListByUserIndex(int user_index) {
		return ((AdminDaoImpl)adminDaoImpl).selectCommuListByUserIndex(user_index);
	}
	
	public Commu selectCommuByCommuIndex(int commu_index) {
		return ((AdminDaoImpl)adminDaoImpl).selectCommuByCommuIndex(commu_index);
	}

	public List<CommuReply> selectCommuReplyListByCommuIndex(int commu_index) {
		return ((AdminDaoImpl)adminDaoImpl).selectCommuReplyListByCommuIndex(commu_index);
	}

	public List<Purchase> paymentList(int user_index) {
		return ((AdminDaoImpl)adminDaoImpl).paymentList(user_index);
	}

	public List<Commu> selectCommuBoardList(RowBounds rowBounds) {
		return ((AdminDaoImpl)adminDaoImpl).selectCommuBoardList(rowBounds);
	}

	public int selectCommuBoardListCount() {
		return ((AdminDaoImpl)adminDaoImpl).selectCommuBoardListCount();
	}
}
