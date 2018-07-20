package com.misoot.lar.lecture.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.lecture.model.vo.Lecture;

@Service
public class LectureServiceImpl implements LarService<Lecture> {

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
