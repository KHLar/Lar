<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- "_header.jsp" include the div[class=wrapper] tag start point. -->
<!-- page title, LAR : ${pageTitle} -->
<c:import url="/WEB-INF/views/common/_header.jsp">
	<c:param value="질문답변" name="pageTitle" />
</c:import>

<!-- !important. header tag have margin! please don't delete -->
</header>

<ul class="nav nav-tabs">
	<li class="" id="commuTab"><a data-toggle="tab" href="#Commu">강좌소계</a></li>
	<li id="noticeTab"><a data-toggle="tab" href="#Notice">공지사항</a></li>
	<li class="active" id="qaTab"><a data-toggle="tab" href="/lar/lecture/QnA?lecture=${lecture.lecture_index}">질의응답</a></li>
	<li id="newsTab"><a data-toggle="tab" href="#News">소식</a></li>
</ul>

<!-- !important. div[class=container-fluid] ~ div[class=col-md-10 col-sm-10] -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-10 col-sm-10">
			<div class="row" id="QnA">
				<div class="QnA" id="QnA" style="margin-top: 50px">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>날짜</th>
								<th>조회수</th>
							</tr>
						</thead>
						<c:forEach items="${qlist}" var="q">
						<tbody>
							<tr>
								<td>${ q.LECTURE_Q_INDEX }</td>
								<td><a href="/lar/lecture/QnA/detail?content=${q.LECTURE_Q_INDEX}">${ q.LECTURE_Q_TITLE }</a></td>
								<td>${ q.USER_NICKNAME }</td>
								<td>${ q.LECTURE_Q_UPLOAD_DATE }</td>
								<td>${ q.LECTURE_Q_HITS }</td>
							</tr>
						</tbody>
						</c:forEach>
					</table>
					<a class="btn btn-default pull-right" href="/lar/lecture/QnA/writeForm">글쓰기</a>
					<div class="pagingArea" style="text-align: center">
					<% 
				      int totalContents = Integer.parseInt(String.valueOf(request.getAttribute("totalContents")));
				      int numPerPage = Integer.parseInt(String.valueOf(request.getAttribute("numPerPage")));
				        
				      String cPageTemp = request.getParameter("cPage");
				      int cPage = 1;
				      try{
				         cPage = Integer.parseInt(cPageTemp);
				      } catch(NumberFormatException e){
				         
				      }	      
				   %>
	   			  <%= com.misoot.lar.common.util.Utils.getPageBar(totalContents, cPage, numPerPage, "/lar/lecture/QnA") %>
					</div>
				</div>
			</div>
		</div>
<c:import url="/WEB-INF/views/common/_footer.jsp" />