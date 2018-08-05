package com.misoot.lar.admin.model.service;

import java.util.List;
import java.util.Map;

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

	/*
	 * user area start
	 */
	
	public List<User> selectUserList(int user_level, RowBounds rowBounds) {
		return ((AdminDaoImpl)adminDaoImpl).selectUserList(user_level, rowBounds);
	}
	
	public User selectUser(int user_index) {
		return ((AdminDaoImpl)adminDaoImpl).selectUser(user_index);
	}

	public int getSelectUserListCount(int user_level) {
		return ((AdminDaoImpl)adminDaoImpl).getSelectUserListCount(user_level);
	}
	
	public int modifyUserByAdmin(User user) {
		return ((AdminDaoImpl)adminDaoImpl).modifyUserByAdmin(user);
	}
	
	public List<Commu> selectCommuListByUserIndex(int user_index, RowBounds rowBounds) {
		return ((AdminDaoImpl)adminDaoImpl).selectCommuListByUserIndex(user_index, rowBounds);
	}
	
	public int getSelectCommuListCountByUserIndex(int user_index) {
		return ((AdminDaoImpl)adminDaoImpl).getSelectCommuListCountByUserIndex(user_index);
	}
	
	public List<Commu> searchCommuListByUserIndex(Map<String, Object> searchMap, RowBounds rowBounds) {
		return ((AdminDaoImpl)adminDaoImpl).searchCommuListByUserIndex(searchMap, rowBounds);
	}
	
	public int getSearchCommuListCountByUserIndex(Map<String, Object> searchMap) {
		return ((AdminDaoImpl)adminDaoImpl).getSearchCommuListCountByUserIndex(searchMap);
	}
	
	public List<CommuReply> selectCommuReplyListByUserIndex(int user_index, RowBounds rowBounds) {
		return ((AdminDaoImpl)adminDaoImpl).selectCommuReplyListByUserIndex(user_index, rowBounds);
	}
	
	public int selectCommuReplyListCountByUserIndex(int user_index) {
		return ((AdminDaoImpl)adminDaoImpl).getSelectCommuReplyListCountByUserIndex(user_index);
	}
	
	public List<CommuReply> searchCommuReplyListByUserIndex(Map<String, Object> searchMap, RowBounds rowBounds) {
		return ((AdminDaoImpl)adminDaoImpl).searchCommuReplyListByUserIndex(searchMap, rowBounds);
	}
	
	public int getSearchCommuReplyListCountByUserIndex(Map<String, Object> searchMap) {
		return ((AdminDaoImpl)adminDaoImpl).getSearchCommuReplyListCountByUserIndex(searchMap);
	}
	
	public int getTotalPurchaseCountByUserIndex(int user_index) {
		return ((AdminDaoImpl)adminDaoImpl).getTotalPurchaseCountByUserIndex(user_index);
	}
	
	public int getTotalPurchaseAmountByUserIndex(int user_index) {
		return ((AdminDaoImpl)adminDaoImpl).getTotalPurchaseAmountByUserIndex(user_index);
	}
	
	public List<Purchase> selectPurchaseList(int user_index, RowBounds rowBounds) {
		return ((AdminDaoImpl)adminDaoImpl).selectPurchaseListByUserIndex(user_index, rowBounds);
	}
	
	public int getSelectPurchaseListCountByUserIndex(int user_index) {
		return ((AdminDaoImpl)adminDaoImpl).getSelectPurchaseListCountByUserIndex(user_index);
	}
	
	public List<Map<String, String>> selectCouponListByUserIndex(int user_index, RowBounds rowBounds) {
		return ((AdminDaoImpl)adminDaoImpl).selectCouponListByUserIndex(user_index, rowBounds);
	}
	
	public int getSelectCouponListCountByUserIndex(int user_index) {
		return ((AdminDaoImpl)adminDaoImpl).getSelectCouponListCountByUserIndex(user_index);
	}
	
	public int getSelectUnusedCouponListCountByUserIndex(int user_index) {
		return ((AdminDaoImpl)adminDaoImpl).getSelectUnusedCouponListCountByUserIndex(user_index);
	}
	
	public List<User> searchUserList(Map<String, Object> searchMap, RowBounds rowBounds) {
		return ((AdminDaoImpl)adminDaoImpl).searchUserList(searchMap, rowBounds);
	}

	public int getSearchUserListCount(Map<String, Object> searchMap) {
		return ((AdminDaoImpl)adminDaoImpl).getSearchUserListCount(searchMap);
	}
	
	/*
	 * user area end
	 */
	
	
	/*
	 * community area
	 */
	
	public Commu selectCommuByCommuIndex(int commu_index) {
		return ((AdminDaoImpl)adminDaoImpl).selectCommuByCommuIndex(commu_index);
	}

	public List<CommuReply> selectCommuReplyListByCommuIndex(int commu_index) {
		return ((AdminDaoImpl)adminDaoImpl).selectCommuReplyListByCommuIndex(commu_index);
	}
	
	public List<Commu> selectCommuList(String category, RowBounds rowBounds) {
		return ((AdminDaoImpl)adminDaoImpl).selectCommuList(category, rowBounds);
	}
	
	public int getSelectCommuListCount(String category) {
		return ((AdminDaoImpl)adminDaoImpl).getSelectCommuListCount(category);
	}
	
	public List<Commu> searchCommuList(Map<String, String> searchMap, RowBounds rowBounds) {
		return ((AdminDaoImpl)adminDaoImpl).searchCommuList(searchMap, rowBounds);
	}
	
	public int getSearchCommuListCount(Map<String, String> searchMap) {
		return ((AdminDaoImpl)adminDaoImpl).getSearchCommuListCount(searchMap);
	}
	
	public int deleteCommuByCommuIndex(int target_index) {
		return ((AdminDaoImpl)adminDaoImpl).deleteCommuByCommuIndex(target_index);
	}

	public int restoreCommuByCommuIndex(int target_index) {
		return ((AdminDaoImpl)adminDaoImpl).restoreCommuByCommuIndex(target_index);
	}

	public int deleteCommuReplyByCommuIndex(int target_index) {
		return ((AdminDaoImpl)adminDaoImpl).deleteCommuReplyByCommuIndex(target_index);
	}

	public int restoreCommuReplyByCommuIndex(int target_index) {
		return ((AdminDaoImpl)adminDaoImpl).restoreCommuReplyByCommuIndex(target_index);
	}

	public int getCommuIndexByCommuReplyIndex(int target_index) {
		return ((AdminDaoImpl)adminDaoImpl).getCommuIndexByCommuReplyIndex(target_index);
	}
}