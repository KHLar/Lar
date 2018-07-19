package com.misoot.lar.community.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.community.model.vo.Community;

@Repository
public class CommunityDaoImpl implements LarDao<Community> {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public Community selectOne(int index) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Community> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Community t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Community t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int index) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
