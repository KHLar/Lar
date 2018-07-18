package com.misoot.lar.lecture.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.lecture.model.vo.Lecture;

@Repository
public class LectureDaoImpl implements LarDao<Lecture> {

	@Override
	public Lecture selectOne(int index) {
		return null;
	}

	@Override
	public List<Lecture> selectList() {
		return null;
	}

	@Override
	public int insert(Lecture t) {
		return 0;
	}

	@Override
	public int update(Lecture t) {
		return 0;
	}

	@Override
	public int delete(int index) {
		return 0;
	}

}
