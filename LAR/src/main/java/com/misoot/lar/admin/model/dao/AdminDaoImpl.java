package com.misoot.lar.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.misoot.lar.admin.model.vo.Admin;
import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.commu.model.vo.Commu;
import com.misoot.lar.commu.model.vo.CommuReply;
import com.misoot.lar.user.model.vo.Purchase;
import com.misoot.lar.user.model.vo.User;

@Repository
public class AdminDaoImpl implements LarDao<Admin> {

	@Autowired
	SqlSessionTemplate sqlSession;
	
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
		return 0;
	}

	@Override
	public int update(Admin t) {
		return 0;
	}

	@Override
	public int delete(int index) {
		return 0;
	}

	public List<User> selectUserList(int user_level, RowBounds rowBounds) {
		return sqlSession.selectList("admin.selectUserList", user_level, rowBounds);
	}

	public int selectUserCount(int user_level) {
		return sqlSession.selectOne("admin.selectUserCount", user_level);
	}

	public User selectUser(int user_index) {
		return sqlSession.selectOne("admin.selectUser", user_index);
	}
	
	public int modifyUserByAdmin(User user) {
		return sqlSession.update("admin.modifyUserByAdmin", user);
	}
	
	public List<Commu> selectCommuListByUserIndex(int user_index) {
		return sqlSession.selectList("admin.selectCommuListByUserIndex", user_index);
	}
	
	public List<CommuReply> selectCommuReplyListByUserIndex(int user_index) {
		return sqlSession.selectList("admin.selectCommuReplyListByUserIndex", user_index);
	}
	
	public List<Purchase> paymentList(int user_index) {
		return sqlSession.selectList("admin.paymentList", user_index);
	}
	
	public List<User> searchUserList(Map<String, Object> searchMap, RowBounds rowBounds) {
		return sqlSession.selectList("admin.searchUserList", searchMap, rowBounds);
	}

	public int searchUserListCount(Map<String, Object> searchMap) {
		return sqlSession.selectOne("admin.searchUserListCount", searchMap);
	}
	
	/*
	 * community area
	 */
	
	public Commu selectCommuByCommuIndex(int commu_index) {
		return sqlSession.selectOne("admin.selectCommuByCommuIndex", commu_index);
	}

	public List<CommuReply> selectCommuReplyListByCommuIndex(int commu_index) {
		return sqlSession.selectList("admin.selectCommuReplyListByCommuIndex", commu_index);
	}
	
	public List<Commu> selectCommuList(String category, RowBounds rowBounds) {
		return sqlSession.selectList("admin.selectCommuList", category, rowBounds);
	}
	
	public int selectCommuListCount(String category) {
		return sqlSession.selectOne("admin.selectCommuListCount", category);
	}
	
	public List<Commu> searchCommuList(Map<String, String> searchMap, RowBounds rowBounds) {
		return sqlSession.selectList("admin.searchCommuList", searchMap, rowBounds);
	}
	
	public int searchCommuListCount(Map<String, String> searchMap) {
		return sqlSession.selectOne("admin.searchCommuListCount", searchMap);
	}
	
	public boolean commuTrashRestore(int commu_index) {
		return sqlSession.update("admin.commuTrashRestore", commu_index) > 0 ? true : false;
	}
}
