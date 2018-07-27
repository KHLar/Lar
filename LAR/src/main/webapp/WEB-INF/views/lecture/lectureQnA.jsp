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


<!-- !important. div[class=container-fluid] ~ div[class=col-md-10 col-sm-10] -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-10 col-sm-10">
			<div class="row">
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
							<td>${ q.lecture_q_title }</td>
							<td><a href="/lar/lecture/QnA/detail">${ q.lecture_q_content }</a></td>
							<td>${ q.user_nickname }</td>
							<td>${ q.lecture_q_upload_date }</td>
							<td>${ q.lecture_q_hits }</td>
						</tr>
					</tbody>
					</c:forEach>
				</table>
				<hr />
				<a class="btn btn-default pull-right" href="/lar/lecture/QnA/writeForm">글쓰기</a>
			</div>
		</div>
<c:import url="/WEB-INF/views/common/_footer.jsp" />