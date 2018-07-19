package com.misoot.lar.common.sockJS.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.common.sockJS.model.vo.Inquire;

@Repository
public class InquireDaoImpl implements LarDao<Inquire>{
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public Inquire selectOne(int index) {
		return null;
	}

	@Override
	public List<Inquire> selectList() {
		return sqlSession.selectList("inquire.selectUserInquireList");
	}

	@Override
	public int insert(Inquire t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Inquire t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int index) {
		// TODO Auto-generated method stub
		return 0;
	}


}
