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
			<li class="active"><i class="fa fa-dashboard"></i> Users</li>
			<li class="active"><i class="fa fa-dashboard"></i> List</li>
			<li class="active"><i class="fa fa-dashboard"></i> ${page}</li>
		</ol>
	</div>

	<div class="row table-responsive">
		<table class="table">
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
	
		System.out.println(pi.getCurrent_page());
		System.out.println(pi.getMax_page_count());
		System.out.println(pi.getMax_list_count());
		System.out.println(pi.getPaging_count());
	%>

	<div class="row">
		<nav class="text-center">
			<ul class="pagination text-center">
				<% if (pi.getCurrent_page() != 1) { %>
					<li><a href="/lar/admin/users/list/1">&lt;&lt;</a></li>
					<li><a href="/lar/admin/users/list/${pi.current_page -1}">&lt;</a></li>				
				<% } %>
				
				<% int temp = pi.getCurrent_page() / pi.getPaging_count() + 1; %>
								
				<% for (int i=(temp-1)*10+1; i<=temp*pi.getPaging_count(); i++) { %>
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