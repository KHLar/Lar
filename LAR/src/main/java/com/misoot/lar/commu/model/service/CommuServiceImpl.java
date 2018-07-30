package com.misoot.lar.commu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.misoot.lar.common.interfaces.LarDao;
import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.commu.model.dao.CommuDaoImpl;
import com.misoot.lar.commu.model.exception.CommuException;
import com.misoot.lar.commu.model.vo.Attachment;
import com.misoot.lar.commu.model.vo.Commu;

@Service
public class CommuServiceImpl implements LarService<Commu> {

	@Autowired
	LarDao<Commu> commuDaoImpl;

	@Override
	public Commu selectOne(int index) {
		return commuDaoImpl.selectOne(index);
	}

	@Override
	public List<Commu> selectList() {
		return commuDaoImpl.selectList();
	}

	@Override
	public int insert(Commu t) {
		return commuDaoImpl.insert(t);
	}

	@Override
	public int update(Commu t) {
		return commuDaoImpl.update(t);
	}

	@Override
	public int delete(int index) {
		return commuDaoImpl.delete(index);
	}

	// 커뮤니티게시판
	public List<Map<String, String>> selectCommuList(int cPage, int numPerPage) {
		return ((CommuDaoImpl) commuDaoImpl).selectCommuList(cPage, numPerPage);
	}

	public int selectCommuTotalContents() {
		return ((CommuDaoImpl) commuDaoImpl).selectCommuTotalContents();
	}

	public Commu selectCommuOne(int commuNo) {
		return ((CommuDaoImpl) commuDaoImpl).selectCommuOne(commuNo);
	}

	public List<Attachment> selectAttachmentList(int commuNo) {
		return ((CommuDaoImpl) commuDaoImpl).selectAttachmentList(commuNo);
	}

	public int insertCommu(Commu commu, List<Attachment> list) {
		int result = 0;
		int commuNo = 0;
		try {
			result = ((CommuDaoImpl) commuDaoImpl).insertCommu(commu);
			if (result == 0)
				throw new CommuException();

			// 매퍼를 다녀온 Board 객체가 boardNo를 가져온다.
			commuNo = commu.getCommu_Index();
			System.out.println("commuNo 확인 : " + commuNo);

			if (list.size() > 0) {
				for (Attachment a : list) {
					a.setCommu_Attach_Commu_Index(commuNo);
					result = ((CommuDaoImpl) commuDaoImpl).insertAttachment(a);
					System.out.println("result" + result);

					if (result == 0)
						throw new CommuException();
				}
			}

		} catch (Exception e) {
			throw e;
		}

		return result;
	}

	// 게시판값증가
	public int IncreaseCommu(int commuNo) {
		return ((CommuDaoImpl) commuDaoImpl).IncreaseCommu(commuNo);
	}

	// 커뮤니티 찾기
	public List<Map<String, String>> selectCommuListSearchTitle(int cPage, int numPerPage, String commuSearchText) {
		return ((CommuDaoImpl) commuDaoImpl).selectCommuListSearchTitle(cPage, numPerPage, commuSearchText);
	}

	public List<Map<String, String>> selectCommuListSearchWriter(int cPage, int numPerPage, String commuSearchText) {
		return ((CommuDaoImpl) commuDaoImpl).selectCommuListSearchWriter(cPage, numPerPage, commuSearchText);
	}

	public int selectCommuTotalContentsTitle(String commuSearchText) {
		return ((CommuDaoImpl) commuDaoImpl).selectCommuTotalContentsTitle(commuSearchText);
	}

	public int selectCommuTotalContentsWriter(String commuSearchText) {
		return ((CommuDaoImpl) commuDaoImpl).selectCommuTotalContentsWriter(commuSearchText);
	}

	public List<Map<String, String>> selectNoticeList() {
		return ((CommuDaoImpl) commuDaoImpl).selectNoticeList();
	}

	// 정보공유
	public List<Map<String, String>> selectInfoListSearchTitle(int cPage, int numPerPage, String infoSearchText) {
		return ((CommuDaoImpl) commuDaoImpl).selectInfoListSearchTitle(cPage, numPerPage, infoSearchText);
	}

	public int selectInfoTotalContentsTitle(String infoSearchText) {
		return ((CommuDaoImpl) commuDaoImpl).selectInfoTotalContentsTitle(infoSearchText);
	}

	public List<Map<String, String>> selectInfoListSearchWriter(int cPage, int numPerPage, String infoSearchText) {
		return ((CommuDaoImpl) commuDaoImpl).selectInfoListSearchWriter(cPage, numPerPage, infoSearchText);
	}

	public int selectInfoTotalContentsWriter(String infoSearchText) {
		return ((CommuDaoImpl) commuDaoImpl).selectInfoTotalContentsWriter(infoSearchText);
	}

	public List<Map<String, String>> selectInfoList(int cPage, int numPerPage) {
		return ((CommuDaoImpl) commuDaoImpl).selectInfoList(cPage, numPerPage);
	}

	public int selectInfoTotalContents() {
		return ((CommuDaoImpl) commuDaoImpl).selectInfoTotalContents();
	}

	public int deleteCommu(String user_index) {
		return ((CommuDaoImpl) commuDaoImpl).deleteCommu(user_index);
	}

	public List<Map<String, String>> selectNewsList() {
		return ((CommuDaoImpl) commuDaoImpl).selectNewsList();
	}

	public List<Map<String, String>> selectCommuListSearchTags(int cPage, int numPerPage, String commuSearchText) {
		
		return ((CommuDaoImpl) commuDaoImpl).selectCommuListSearchTags(cPage, numPerPage, commuSearchText);
	}

	public int selectCommuTotalContentsTag(String commuSearchText) {
		return ((CommuDaoImpl) commuDaoImpl).selectCommuTotalContentsTag(commuSearchText);
	}


	public int selectInfoTotalContentsTag(String infoSearchText) {
		return ((CommuDaoImpl) commuDaoImpl).selectInfoTotalContentsTag(infoSearchText);
	}

	public List<Map<String, String>> selectInfoSearchTags(int infocPage, int numPerPage, String infoSearchText) {
		return ((CommuDaoImpl) commuDaoImpl).selectInfoListSearchTags(infocPage, numPerPage, infoSearchText);
	}
}