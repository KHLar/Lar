package com.misoot.lar.home.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.home.model.dao.HomeDaoImpl;
import com.misoot.lar.home.model.vo.Home;

@Service
public class HomeServiceImpl implements LarService<Home> {

	@Autowired
	LarDao<Home> homeDaoImpl;
	
	@Deprecated
	@Override
	public Home selectOne(int index) {
		return null;
	}

	@Deprecated
	@Override
	public List<Home> selectList() {
		return null;
	}

	@Deprecated
	@Override
	public int insert(Home t) {
		return 0;
	}
	
	@Deprecated
	@Override
	public int update(Home t) {
		return 0;
	}

	@Deprecated
	@Override
	public int delete(int index) {
		return 0;
	}
	
	public List<Object> selectList(String method) {
		return ((HomeDaoImpl)homeDaoImpl).selectList(method);
	}
}