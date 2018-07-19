package com.misoot.lar.common.sockJS.model.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.common.sockJS.model.vo.Inquire;

@Service
public class InquireServiceImpl implements LarService<Inquire>{
	
	@Autowired
	LarDao<Inquire> larDao;

	@Override
	public Inquire selectOne(int index) {
		return null;
	}

	@Override
	public List<Inquire> selectList() {
		return larDao.selectList();
	}

	@Override
	public int insert(Inquire t) {
		return larDao.insert(t);
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
