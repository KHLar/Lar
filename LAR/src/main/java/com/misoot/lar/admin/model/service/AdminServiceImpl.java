package com.misoot.lar.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.misoot.lar.admin.model.vo.Admin;
import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.common.interfaces.LarService;

@Service
public class AdminServiceImpl implements LarService<Admin> {

	@Autowired
	LarDao<Admin> adminDaoImpl;
	
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
