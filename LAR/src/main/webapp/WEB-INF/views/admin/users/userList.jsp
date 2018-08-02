<%@page import="com.misoot.lar.common.util.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/admin/common/_header.jsp">
	<c:param value="Users List" name="pageTitle" />
</c:import>

<div class="col-lg-12">
	<div class="row">
		<h1 class="page-header">Users</h1>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-address-book"></i> Users</li>
			<li class="active"><a href="/lar/admin/users/list/1"><i class="fa fa-list"></i> List</a></li>
			<li class="active"><i class="fa fa-hashtag"></i> ${page}</li>
		</ol>
	</div>
	
	<div class="row">
		<nav class="navbar">
			<div class="container-fluid">
				<form class="navbar-form navbar-right" action="/lar/admin/users/search" method="post">
					<div class="form-group">
						<ul class="nav">
							<li class="active">
								<select class="form-control" name="filter">
										<option value="id">ID</option>
										<option value="nickname">닉네임</option>
										<option value="phone">연락처</option>
								</select>
							</li>
						</ul>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search" name="text" required>
						<button class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</form>
			</div>
		</nav>
	</div>
	
	<div class="row table-responsive">
		<table class="table table-striped table-condensed">
			<tr>
				<td>Idx</td>
				<td>ID</td>
				<td>Nick</td>
				<td>E_Date</td>
				<td>Level</td>
			</tr>
			<c:forEach items="${user_list}" var="u">
				<tr>
					<td>${u.user_index}</td>
					<td><a href="/lar/admin/users/view/${u.user_index}">${u.user_id}</a></td>
					<td>${u.user_nickname}</td>
					<td>${u.user_enrolled_date}</td>
					<td>${u.user_level}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<%
		PageInfo pi = (PageInfo)request.getAttribute("pi");
	%>

	<div class="row">
		<nav class="text-center">
			<ul class="pagination">
				<% if (pi.getCurrent_page() != 1) { %>
					<li><a href="/lar/admin/users/list/1">&lt;&lt;</a></li>
					<li><a href="/lar/admin/users/list/${pi.current_page -1}">&lt;</a></li>				
				<% } %>
								
				<% for (int i=pi.getStart_page(); i<=pi.getEnd_page(); i++) { %>
					<% if (i == pi.getCurrent_page()) { %>
						<li class="active" disabled><a href="/lar/admin/users/list/<%=i%>"><%=i%></a></li>
					<% } else if (i <= pi.getMax_page_count()) { %>
						<li><a href="/lar/admin/users/list/<%=i%>"><%=i%></a></li>
					<% } %>
				<% } %>
				
				<% if (pi.getMax_page_count() > pi.getCurrent_page()) { %>
					<li><a href="/lar/admin/users/list/${pi.current_page + 1}">&gt;</a></li>
					<li><a href="/lar/admin/users/list/${pi.max_page_count}">&gt;&gt;</a></li>
				<% } %>
			</ul>
		</nav>
	</div>
</div>

<c:import url="/WEB-INF/views/admin/common/_footer.jsp">
</c:import>