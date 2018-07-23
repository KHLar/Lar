package com.misoot.lar.commu.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.commu.model.vo.Attachment;
import com.misoot.lar.commu.model.vo.Commu;

@Repository
public class CommuDaoImpl implements LarDao<Commu> {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public Commu selectOne(int index) {
		return sqlSession.selectOne("", index);
	}
		
	@Override
	public List<Commu> selectList() {
		return sqlSession.selectList("");
	}
	@Override
	public int insert(Commu t) {
		return sqlSession.insert("", t);
	}
	@Override
	public int update(Commu t) {
		return sqlSession.update("", t);
	}
	@Override
	public int delete(int index) {
		return 0;
	}

	
	
	public List<Map<String, String>> selectCommuList(int cPage, int numPerPage) {
		
		/*
		 * RowBounds(offset, limit)
		 * offset : 최초 게시글 번호 (1페이지면 1, 2페이지면 11 ...)
		 * limit : 제한 게시글 (최초 게시글로부터 10개)
		*/
		System.out.println("commuOffset : "+(cPage-1)*numPerPage);
		System.out.println("commuLimit : "+numPerPage);
		
		RowBounds rows = new RowBounds((cPage-1)*numPerPage,numPerPage);
		
		return sqlSession.selectList("commu.selectCommuList",null,rows);
	}
	public List<Map<String, String>> selectCommuListSearchTitle(int cPage, int numPerPage, String searchText) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage,numPerPage);
		searchText="%"+searchText+"%";
		return sqlSession.selectList("commu.selectCommuListSearchTitle",searchText,rows);
	}

	public List<Map<String, String>> selectCommuListSearchWriter(int cPage, int numPerPage, String searchText) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage,numPerPage);
		searchText="%"+searchText+"%";
		return sqlSession.selectList("commu.selectCommuListSearchWriter",searchText,rows);
	}


	public int selectCommuTotalContents() {
		return sqlSession.selectOne("commu.selectCommuTotalContents");
	}

	public Commu selectCommuOne(int commuNo) {
		return sqlSession.selectOne("commu.selectCommuOne",commuNo);
	}

	public List<Attachment> selectAttachmentList(int commuNo) {
		//System.out.println("boardNo"+commuNo);
		return sqlSession.selectList("commu.selectAttachmentList",commuNo);
	}

	public int insertCommu(Commu commu) {
		return sqlSession.insert("commu.insertCommu",commu);
	}

	public int insertAttachment(Attachment a) {
		return sqlSession.insert("commu.insertAttachment",a);
	}

	public int IncreaseCommu(int commuNo) {
		return sqlSession.update("commu.IncreaseCommu",commuNo);
	}
	public int selectCommuTotalContentsTitle(String searchText) {
		searchText="%"+searchText+"%";
		return sqlSession.selectOne("commu.selectCommuTotalContentsTitle",searchText);
	}
	public int selectCommuTotalContentsWriter(String searchText) {
		searchText="%"+searchText+"%";
		return sqlSession.selectOne("commu.selectCommuTotalContentsWriter",searchText);
	}
	public List<Map<String, String>> selectNoticeList() {
		/*System.out.println("NoticeOffset : "+(cPage-1)*numPerPage);
		System.out.println("NoticeLimit : "+numPerPage);
		
		RowBounds rows = new RowBounds((cPage-1)*numPerPage,numPerPage);*/
		
		//return sqlSession.selectList("commu.selectNoticeList",null,rows);
		return sqlSession.selectList("commu.selectNoticeList");
	}

	
	
	public List<Map<String, String>> selectInfoListSearchTitle(int cPage, int numPerPage, String infoSearchText) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage,numPerPage);
		infoSearchText="%"+infoSearchText+"%";
		return sqlSession.selectList("commu.selectInfoListSearchTitle",infoSearchText,rows);
	}//

	public List<Map<String, String>> selectInfoListSearchWriter(int cPage, int numPerPage, String infoSearchText) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage,numPerPage);
		infoSearchText="%"+infoSearchText+"%";
		return sqlSession.selectList("commu.selectInfoListSearchWriter",infoSearchText,rows);
	}//

	public int selectInfoTotalContentsTitle(String infoSearchText) {
		infoSearchText="%"+infoSearchText+"%";
		return sqlSession.selectOne("commu.selectInfoTotalContentsTitle",infoSearchText);
	}//

	public int selectInfoTotalContentsWriter(String infoSearchText) {
		infoSearchText="%"+infoSearchText+"%";
		return sqlSession.selectOne("commu.selectInfoTotalContentsWriter",infoSearchText);
	}//

	public List<Map<String, String>> selectInfoList(int cPage, int numPerPage) {
		
		RowBounds rows = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("commu.selectInfoList",null,rows);
	}//

	public int selectInfoTotalContents() {
		return sqlSession.selectOne("commu.selectInfoTotalContents");
	}

	public int deleteCommu(String user_index) {
		return sqlSession.update("commu.deleteCommu",user_index);
		
	}

	public List<Map<String, String>> selectNewsList() {
		return sqlSession.selectList("commu.selectNewsList");
	}

	public List<Map<String, String>> selectCommuListSearchTags(int cPage, int numPerPage, String infoSearchText) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage,numPerPage);
		infoSearchText="%"+infoSearchText+"%";
		return sqlSession.selectList("commu.selectInfoListSearchTags",infoSearchText,rows);
	}

	
	

}
