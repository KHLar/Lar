<%@page import="com.misoot.lar.common.util.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
%>

<div class="modal-header">
	<nav class="navbar">
		<div class="container-fluid">
			<form class="navbar-form navbar-right" action="/lar/admin/commu/board/search" method="post">
				<div class="form-group">
					<ul class="nav">
						<li class="active">
							<select class="form-control" name="filter">
								<option value="title">제목</option>
								<option value="writer">작성자</option>
								<option value="content">내용</option>
								<option value="tag">태그</option>
							</select>
						</li>
					</ul>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search" name="text" required>
					<button class="btn btn-default form-control" type="submit">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</form>
		</div>
	</nav>
</div>


<div class="modal-body">
	<table class="table table-striped table-condensed">
		<tr>
			<td>Idx</td>
			<td>Title</td>
			<td>Nick</td>
			<td>Date</td>
		</tr>
		<c:forEach items="${commu_list}" var="cb">
			<tr>
				<td>${cb.commu_Index}</td>
				<td>
					<p><a href="/lar/admin/commu/view/${cb.commu_Index}">${cb.commu_Title}</a></p>
					<c:forTokens items="${cb.commu_tags}" var="tag" delims=",">
						<a href="/lar/admin/commu/board/search/tag/${tag}/list/1" class="bg-warning labelinput badge badge-warning" style="background-color: #fed136; color: #4c0b5f; font-size: 10px;">#${tag}</a>
					</c:forTokens>
				</td>
				<td>${cb.commu_Writer}</td>
				<td>${cb.commu_Upload_Date}</td>
			</tr>
		</c:forEach>
	</table>
</div>

<div class="modal-footer">
	<nav class="text-center">
		<ul class="pagination">
			<% if (pi.getCurrent_page() != 1) { %>
				<li><a class="btn btn-default" onclick="adminUsersListModal('${user_index}', 'commuList', 1)">&lt;&lt;</a></li>
				<li><a class="btn btn-default" onclick="adminUsersListModal('${user_index}', 'commuList', ${pi.current_page-1})">&lt;</a></li>				
			<% } %>
				
			<% for (int i=pi.getStart_page(); i<=pi.getEnd_page(); i++) { %>
				<% if (i == pi.getCurrent_page()) { %>
					<li class="active" disabled><a class="btn btn-default" onclick="adminUsersListModal('${view_user.user_index}', 'commuList', <%=i%>)"><%=i%></a></li>
				<% } else if (i <= pi.getMax_page_count()) { %>
					<li><a class="btn btn-default" onclick="adminUsersListModal('${user_index}', 'commuList', <%=i%>)"><%=i%></a></li>
				<% } %>
			<% } %>
			
			<% if (pi.getMax_page_count() > pi.getCurrent_page()) { %>
				<li><a href="/lar/admin/commu/board/list/${pi.current_page + 1}">&gt;</a></li>
				<li><a href="/lar/admin/commu/board/list/${pi.max_page_count}">&gt;&gt;</a></li>
			<% } %>
		</ul>
	</nav>
</div>