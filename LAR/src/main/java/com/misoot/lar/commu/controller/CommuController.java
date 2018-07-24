package com.misoot.lar.commu.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.commu.model.exception.CommuException;
import com.misoot.lar.commu.model.service.CommuReplyServiceImpl;
import com.misoot.lar.commu.model.service.CommuServiceImpl;
import com.misoot.lar.commu.model.vo.Attachment;
import com.misoot.lar.commu.model.vo.Commu;
import com.misoot.lar.commu.model.vo.CommuReply;

@Controller
public class CommuController {

	@Autowired
	LarService<Commu> commuServiceImpl;

	@Autowired
	LarService<CommuReply> commuReplyServiceImpl;

	// 게시글 목록 보기
	@RequestMapping("/commu/commuMain")
	public String selectCommuMain(
			@RequestParam(value = "commucPage", required = false, defaultValue = "1") int commucPage,
			@RequestParam(value = "infocPage", required = false, defaultValue = "1") int infocPage,
			@RequestParam(value = "commuSearchType", required = false, defaultValue = "") String commuSearchType,
			@RequestParam(value = "commuSearchText", required = false, defaultValue = "") String commuSearchText,
			@RequestParam(value = "infoSearchType", required = false, defaultValue = "") String infoSearchType,
			@RequestParam(value = "infoSearchText", required = false, defaultValue = "") String infoSearchText,
			Model model) {

		int numPerPage = 10; // 한 페이지 당 게시글 수
		List<Map<String, String>> commulist;
		List<Map<String, String>> infolist;
		/*System.out.println("commucPage : "+commucPage);
		System.out.println("infocPage : "+infocPage);*/
		int commuTotalContents;
		int infoTotalContents;
		if (commuSearchType.equals("Ctitle")&&!commuSearchText.equals("")) {
			commulist = ((CommuServiceImpl) commuServiceImpl).selectCommuListSearchTitle(commucPage, numPerPage,
					commuSearchText);
			commuTotalContents = ((CommuServiceImpl) commuServiceImpl).selectCommuTotalContentsTitle(commuSearchText);
			
		} else if (commuSearchType.equals("Cwriter")&&!commuSearchText.equals("")) {
			commulist = ((CommuServiceImpl) commuServiceImpl).selectCommuListSearchWriter(commucPage, numPerPage,
					commuSearchText);
			commuTotalContents = ((CommuServiceImpl) commuServiceImpl).selectCommuTotalContentsWriter(commuSearchText);
		}  else if (commuSearchType.equals("tags")&&!commuSearchText.equals("")) {
			commulist = ((CommuServiceImpl) commuServiceImpl).selectCommuListSearchTags(commucPage, numPerPage,
					commuSearchText);
			commuTotalContents = ((CommuServiceImpl) commuServiceImpl).selectCommuTotalContentsWriter(commuSearchText);
			
		} else {
			commulist = ((CommuServiceImpl) commuServiceImpl).selectCommuList(commucPage, numPerPage);
			commuTotalContents = ((CommuServiceImpl) commuServiceImpl).selectCommuTotalContents();
		}
		
		if (infoSearchType.equals("Ititle")&&!infoSearchText.equals("")) {
			infolist = ((CommuServiceImpl) commuServiceImpl).selectInfoListSearchTitle(infocPage, numPerPage,
					infoSearchText);
			infoTotalContents = ((CommuServiceImpl) commuServiceImpl).selectInfoTotalContentsTitle(infoSearchText);
			
		} else if (infoSearchType.equals("Iwriter")&&!infoSearchText.equals("")) {
			infolist = ((CommuServiceImpl) commuServiceImpl).selectInfoListSearchWriter(infocPage, numPerPage,
					infoSearchText);
			infoTotalContents = ((CommuServiceImpl) commuServiceImpl).selectInfoTotalContentsWriter(infoSearchText);
			
		} else {
			infolist = ((CommuServiceImpl) commuServiceImpl).selectInfoList(infocPage, numPerPage);
			infoTotalContents = ((CommuServiceImpl) commuServiceImpl).selectInfoTotalContents();
			
		}
		
		System.out.println("infoList!!!!!!!!!!!!!!!!!! : " + commulist);
		
		List<Map<String, String>> noticelist = ((CommuServiceImpl) commuServiceImpl).selectNoticeList();
		List<Map<String, String>> newslist = ((CommuServiceImpl) commuServiceImpl).selectNewsList();
		// 반환자료형이 Model이라서 붙여써도 무방하다.
		model.addAttribute("commuList", commulist).addAttribute("commuNumPerPage", numPerPage);
		model.addAttribute("commuTotalContents", commuTotalContents);
		model.addAttribute("noticeList", noticelist);
		model.addAttribute("commuSearchType", commuSearchType);
		model.addAttribute("commuSearchText", commuSearchText);
		model.addAttribute("infolist",infolist);
		model.addAttribute("infoTotalContents",infoTotalContents);
		model.addAttribute("infoSearchType", infoSearchType);
		model.addAttribute("infoSearchText", infoSearchText);
		model.addAttribute("infoNumPerPage",numPerPage);
		model.addAttribute("infocPage",infocPage);
		model.addAttribute("commucPage",commucPage);
		model.addAttribute("newslist",newslist);
		
		return "commu/commuMain";

	}

	// 게시글 한개 보기
	@RequestMapping("/commu/commuView")
	public String selectCommuOne(@RequestParam("no") int commuNo, Model model) {

		int increase = ((CommuServiceImpl) commuServiceImpl).IncreaseCommu(commuNo);
		if (increase > 0)
			System.out.println("증가 성공!");
		model.addAttribute("commu", ((CommuServiceImpl) commuServiceImpl).selectCommuOne((commuNo)))
				.addAttribute("attachmentList", ((CommuServiceImpl) commuServiceImpl).selectAttachmentList((commuNo)));

		List<CommuReply> list = ((CommuReplyServiceImpl) commuReplyServiceImpl).selectCommuReplyList(commuNo);
		for (CommuReply cReply : list) {
			if (cReply.getCommu_Reply_Is_Deleted() == 1) {// 댓글 삭제된거
				cReply.setCommu_Reply_Content("삭제된 댓글입니다.");
				cReply.setCommu_Reply_Writer("삭제된 작성자입니다.");
				System.out.println("삭제됨");
			}
			System.out.println(cReply);
		}

		model.addAttribute("commuReply", list);
		return "commu/commuView";
	}

	// 게시글 한 개 등록 페이지
	@RequestMapping("/commu/commuForm/{commu_Category_Index}")
	public String commuForm(@PathVariable("commu_Category_Index") String commu_Category_Index,Model model) {
		model.addAttribute("commu_Category_Index",commu_Category_Index);
		return "commu/commuForm";
	}

	@RequestMapping(value = "/commu/commuFormEnd", method = RequestMethod.POST)
	public String insertBoard(
			@RequestParam("commu_Category_Index") String commu_Category_Index,
			@RequestParam("commu_Title") String commu_Title,
			@RequestParam("commu_Content") String commu_Content,
			@RequestParam("result") String commu_tag,
			@RequestParam("commu_Writer_Index") int commu_Writer_Index,
			@RequestParam(value = "upFile", required = false) MultipartFile[] upfiles, HttpServletRequest request,
			Model model) {
		
		//---------------------------------------//
		
		//---------------------------------------//
		/*System.out.println(commu_Category_Index);
		  System.out.println(commu_Title); 
		  System.out.println(commu_Content);
		  System.out.println(commu_Writer_Index);
		  System.out.println("컨트롤러 태그 확인 : "+commu_tag);*/
		Commu commu = new Commu();
		commu.setCommu_Title(commu_Title);
		commu.setCommu_Content(commu_Content);
		commu.setCommu_Writer_Index(commu_Writer_Index);
		commu.setCommu_Category_Index(commu_Category_Index);
		commu.setCommu_tags(commu_tag);
		// System.out.println(commu);
		// --------------- 멀티파트파일 방식을 이용한 파일 업로드 시작 --------------- //
		// 파일 저장 경로 생성하기
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/uploadFiles/commu");
		File dir = new File(saveDir);
		System.out.println(saveDir);
		String loc = "/commu/commuMain";
		String msg = "";
		
		// 만약 현재 저장하려는 경로에 폴더가 없다면 만들겠습니다.
		if (!dir.exists())
			System.out.println("dir.mkdirs() = " + dir.mkdirs());

		List<Attachment> list = new ArrayList<>();

		for (MultipartFile f : upfiles) {
			if (!f.isEmpty()) {
				// 파일명 재생성하여 원본 파일과 매칭 시키기
				String originFileName = f.getOriginalFilename();
				String ext = originFileName.substring(originFileName.lastIndexOf(".") + 1);
				if(commu_Category_Index.equals("B03")){
					if(ext.equals("jpg")||ext.equals("JPG")||ext.equals("png")||ext.equals("PNG")){
						
					}else{
						loc="/commu/commuForm/B03";
						msg="이미지파일만 첨부 가능합니다..";
						model.addAttribute("loc", loc).addAttribute("msg", msg);

						return "common/msg";
					}
				}
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");

				int randomNum = (int) (Math.random() * 1000);

				String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "_" + randomNum + "." + ext;

				try {
					f.transferTo(new File(saveDir + "/" + renameFileName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}

				// Attachment list에 등록하기
				Attachment at = new Attachment();
				at.setCommu_Attach_Originfilename(originFileName);
				at.setCommu_Attach_Renamedfilename(renameFileName);

				list.add(at);
			}
		}
		// --------------- 멀티파트파일 방식을 이용한 파일 업로드 끝 --------------- //

		int result;
		try {
			result = ((CommuServiceImpl) commuServiceImpl).insertCommu(commu, list);
		} catch (Exception e) {
			throw new CommuException("게시글 등록 실패!");
		}

		
		if (result > 0)
			msg = "게시글 등록 성공!";
		else {
			msg = "게시글 등록 실패!";
			loc = "/commu/commuView";
		}

		model.addAttribute("loc", loc).addAttribute("msg", msg);

		return "common/msg";
		
		/* 해쉬태그 */
		
	}
	

	// 게시글 파일 다운로드
	@RequestMapping("/commu/fileDownload")
	public void fileDownload(@RequestParam String oName, @RequestParam String rName, HttpServletRequest request,
			HttpServletResponse response) {

		// 파일저장디렉토리
		String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/uploadFiles/commu");

		BufferedInputStream bis = null;
		ServletOutputStream sos = null;

		try {
			sos = response.getOutputStream();
			File savedFile = new File(saveDirectory + "/" + rName);
			response.setContentType("application/octet-stream; charset=utf-8");

			// 한글파일명 처리 : 브라우져에 따른 인코딩분기
			String resFilename = "";
			boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE") != -1
					|| request.getHeader("user-agent").indexOf("Trident") != -1;
			System.out.println("isMSIE=" + isMSIE);
			if (isMSIE) {
				// ie는 utf-8인코딩을 명시적으로 해줌. 공백을 의미하는 +를 %20로 치환.
				resFilename = URLEncoder.encode(oName, "UTF-8");
				System.out.println("ie : " + resFilename);// ie :
															// %EC%B7%A8+%EC%97%85+%ED%8A%B9+%EA%B0%95.txt

				resFilename = resFilename.replaceAll("\\+", "%20");
				System.out.println("ie : " + resFilename);// ie :
															// %EC%B7%A8%20%EC%97%85%20%ED%8A%B9%20%EA%B0%95.txt
			} else {
				resFilename = new String(oName.getBytes("UTF-8"), "ISO-8859-1");
				System.out.println("not ie : " + resFilename);

			}
			response.addHeader("Content-Disposition", "attachment; filename=\"" + resFilename + "\"");

			// 파일크기지정
			response.setContentLength((int) savedFile.length());

			FileInputStream fis = new FileInputStream(savedFile);
			bis = new BufferedInputStream(fis);
			int read = 0;

			while ((read = bis.read()) != -1) {
				sos.write(read);
			}

		} catch (Exception e) {
			e.printStackTrace(); 
		} finally {

			try {
				sos.close();
				bis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
	}

	// 게시글 한 개 등록 페이지
	@RequestMapping("/commu/commuReply")
	public String commuReply(@RequestParam("replyWriter") int replyWriter,
			@RequestParam("replyContent") String replyContent, @RequestParam("commuIndex") int commuIndex,
			Model model) {

		CommuReply cReply = new CommuReply();
		cReply.setCommu_Reply_Commu_Index(commuIndex);
		cReply.setCommu_Reply_Content(replyContent);
		cReply.setCommu_Reply_Writer_Index(replyWriter);

		int result = ((CommuReplyServiceImpl) commuReplyServiceImpl).insertCommuReply(cReply);

		String loc = "/commu/commuView?no=" + commuIndex;
		String msg = "";
		if (result > 0)
			msg = "게시글 등록 성공!";
		else {
			msg = "게시글 등록 실패!";
		}

		model.addAttribute("loc", loc).addAttribute("msg", msg);

		return "common/msg";
	}

	@RequestMapping("/commu/commuReplyReply")
	// public String commuReply_Reply(@RequestParam("replyWriter") int
	// replyWriter, @RequestParam("replyContent") String
	// replyContent,@RequestParam("commuIndex") int commuIndex, Model model){
	public String commuReply_Reply(CommuReply cReply, Model model) {

		System.out.println(cReply);

		int upResult = ((CommuReplyServiceImpl) commuReplyServiceImpl).updateCommuReply_Reply(cReply);
		int inResult = ((CommuReplyServiceImpl) commuReplyServiceImpl).insertCommuReply_Reply(cReply);

		String loc = "/commu/commuView?no=" + cReply.getCommu_Reply_Commu_Index();
		String msg = "";
		if (inResult > 0)
			msg += "대댓글 등록 성공!";
		else
			msg += "대댓글 등록 실패!";
		/*if (upResult > 0)
			msg += "대댓글 업뎃 성공!";
		else
			msg += "대댓글 업뎃 실패!";*/
		model.addAttribute("loc", loc).addAttribute("msg", msg);

		return "common/msg";
	}

	@RequestMapping("/commu/commuReplyDelete")
	public String commuReply_Delete(@RequestParam("commu_Reply_Index") int commu_Reply_Index, Model model) {
		System.out.println(commu_Reply_Index);

		CommuReply cReply = ((CommuReplyServiceImpl) commuReplyServiceImpl).selectOneCommuReply(commu_Reply_Index);
		System.out.println(cReply);

		// int upResult= commuReplyService.updateCommuReply_Reply2(cReply);
		int deResult = ((CommuReplyServiceImpl) commuReplyServiceImpl)
				.deleteCommuReply_Reply(cReply.getCommu_Reply_Index());
		String loc = "/commu/commuView?no=" + cReply.getCommu_Reply_Commu_Index();
		String msg = "";
		if (deResult > 0)
			msg += "댓글 삭제 성공!";
		else
			msg += "댓글 삭제 실패!";

		model.addAttribute("loc", loc).addAttribute("msg", msg);
		return "common/msg";
	}
	@RequestMapping(value="/commu/commuDelete/{user_index}")
	public String commuDelete(@PathVariable("user_index") String  user_index, Model model){
		
		//String loc="";
		//String msg="";
		int commuDelete=((CommuServiceImpl) commuServiceImpl).deleteCommu(user_index);
		if(commuDelete>0){
			System.out.println("삭제성공");
		}else{
			System.out.println("삭제실패");
		}
		
		
		return "redirect:/commu/commuMain";
	}
	
}
