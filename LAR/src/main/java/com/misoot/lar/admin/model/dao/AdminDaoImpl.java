package com.misoot.lar.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.misoot.lar.admin.model.vo.Admin;
import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.commu.model.vo.Commu;
import com.misoot.lar.commu.model.vo.CommuReply;
import com.misoot.lar.user.model.vo.User;

@Repository
public class AdminDaoImpl implements LarDao<Admin> {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public Admin selectOne(int index) {
		return null;
	}
	
	@Deprecated
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

	public List<User> selectUserList(int user_level, RowBounds rowBounds) {
		return sqlSession.selectList("admin.selectUserList", user_level, rowBounds);
	}

	public int selectUserCount(int user_level) {
		return sqlSession.selectOne("admin.selectUserCount", user_level);
	}

	public User selectUser(int user_index) {
		return sqlSession.selectOne("admin.selectUser", user_index);
	}
	
	public int modifyUserByAdmin(User user) {
		return sqlSession.update("admin.modifyUserByAdmin", user);
	}
	
	/*
	 * community area
	 */
	
	public Commu selectCommuByCommuIndex(int commu_index) {
		return sqlSession.selectOne("admin.selectCommuByCommuIndex", commu_index);
	}

	public List<CommuReply> selectCommuReplyListByCommuIndex(int commu_index) {
		return sqlSession.selectList("admin.selectCommuReplyListByCommuIndex", commu_index);
	}

	public List<Map<String, Object>> paymentList(int user_index) {
		return sqlSession.selectList("admin.paymentList", user_index);
	}

	public List<Commu> selectCommuListByUserIndex(int user_index) {
		return sqlSession.selectList("admin.selectCommuListByUserIndex", user_index);
	}
	
	public List<Commu> selectCommuNoticeList(RowBounds rowBounds) {
		return sqlSession.selectList("admin.selectCommuNoticeList", null, rowBounds);
	}

	public int selectCommuNoticeListCount() {
		return sqlSession.selectOne("admin.selectCommuNoticeListCount");
	}

	public List<Commu> selectCommuBoardList(RowBounds rowBounds) {
		return sqlSession.selectList("admin.selectCommuBoardList", null, rowBounds);
	}

	public int selectCommuBoardListCount() {
		return sqlSession.selectOne("admin.selectCommuBoardListCount");
	}

	public List<Commu> selectCommuQaList(RowBounds rowBounds) {
		return sqlSession.selectList("admin.selectCommuQaList", null, rowBounds);
	}

	public int selectCommuQaListCount() {
		return sqlSession.selectOne("admin.selectCommuQaListCount");
	}

	public List<Commu> selectCommuNewsList(RowBounds rowBounds) {
		return sqlSession.selectList("admin.selectCommuNewsList", null, rowBounds);
	}

	public int selectCommuNewsListCount() {
		return sqlSession.selectOne("admin.selectCommuNewsListCount");
	}

	public List<Commu> selectCommuTrashList(RowBounds rowBounds) {
		return sqlSession.selectList("admin.selectCommuTrashList", null, rowBounds);
	}

	public int selectCommuTrashListCount() {
		return sqlSession.selectOne("admin.selectCommuTrashListCount");
	}

	public boolean commuTrashRestore(int commu_index) {
		return sqlSession.update("admin.commuTrashRestore", commu_index) > 0 ? true : false;
	}

	public List<Commu> searchCommuList(Map<String, String> searchMap, RowBounds rowBounds) {
		return sqlSession.selectList("admin.searchCommuList", searchMap, rowBounds);
	}
}
