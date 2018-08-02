package com.misoot.lar.home.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.home.model.vo.Home;
import com.misoot.lar.lecture.model.vo.Lecture;

@Repository
public class HomeDaoImpl implements LarDao<Home> {

	@Autowired
	SqlSessionTemplate sqlSession;
	
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
	
	public List<Lecture> selectLectureList(String method, int user_index) {
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("user_index", user_index);
		return sqlSession.selectList("home.selectLectureList"+method, hmap, new RowBounds(0,7));
	}
}