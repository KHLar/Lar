package com.misoot.lar.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.misoot.lar.admin.model.vo.Admin;
import com.misoot.lar.common.interfaces.LarDao;
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
}
