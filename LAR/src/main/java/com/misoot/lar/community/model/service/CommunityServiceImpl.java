package com.misoot.lar.community.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.community.model.vo.Community;

@Service
public class CommunityServiceImpl implements LarService<Community> {

	@Autowired
	LarDao<Community> communityDaoImpl;
	
	@Override
	public Community selectOne(int index) {
		return null;
	}

	@Override
	public List<Community> selectList() {
		return null;
	}

	@Override
	public int insert(Community t) {
		return 0;
	}

	@Override
	public int update(Community t) {
		return 0;
	}

	@Override
	public int delete(int index) {
		return 0;
	}

}
