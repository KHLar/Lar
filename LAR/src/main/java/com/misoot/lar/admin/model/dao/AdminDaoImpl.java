package com.misoot.lar.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.misoot.lar.admin.model.vo.Admin;
import com.misoot.lar.common.interfaces.LarDao;

@Repository
public class AdminDaoImpl implements LarDao<Admin> {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public Admin selectOne(int index) {
		return null;
	}

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

}
