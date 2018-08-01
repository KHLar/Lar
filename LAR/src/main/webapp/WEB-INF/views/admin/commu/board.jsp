<%@page import="com.misoot.lar.common.util.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/admin/common/_header.jsp">
	<c:param value="Community" name="pageTitle" />
</c:import>

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>

<div class="col-lg-12">
	<div class="row">
		<h1 class="page-header">
			Community
		</h1>
		<ol class="breadcrumb">
			<li><i class="fa fa-dashboard"></i> Community</li>
			<li class="active"><i class="fa fa-dashboard"></i> Board</li>
			<li class="active"><i class="fa fa-dashboard"></i> List</li>
			<li class="active"><i class="fa fa-dashboard"></i> ${pi.current_page}</li>
		</ol>
	</div>

	<div class="row table-responsive">
		<table class="table table-striped table-condensed">
			<tr>
				<td>Idx</td>
				<td>Title</td>
				<td>Nick</td>
				<td>Date</td>
			</tr>
			<c:forEach items="${commu_board_list}" var="cb">
				<tr>
					<td>${cb.commu_Index}</td>
					<td><a href="/lar/admin/commu/view/${cb.commu_Index}">${cb.commu_Title}</a></td>
					<td>${cb.commu_Writer}</td>
					<td>${cb.commu_Upload_Date}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	

	<div class="row">
		<nav class="text-center">
			<ul class="pagination">
				<% if (pi.getCurrent_page() != 1) { %>
					<li><a href="/lar/admin/commu/board/list/1">&lt;&lt;</a></li>
					<li><a href="/lar/admin/commu/board/list/${pi.current_page -1}">&lt;</a></li>				
				<% } %>
					
				<% for (int i=pi.getStart_page(); i<=pi.getEnd_page(); i++) { %>
					<% if (i == pi.getCurrent_page()) { %>
						<li class="active" disabled><a href="/lar/admin/commu/board/list/<%=i%>"><%=i%></a></li>
					<% } else if (i <= pi.getMax_page_count()) { %>
						<li><a href="/lar/admin/commu/board/list/<%=i%>"><%=i%></a></li>
					<% } %>
				<% } %>
				
				<% if (pi.getMax_page_count() > pi.getCurrent_page()) { %>
					<li><a href="/lar/admin/commu/board/list/${pi.current_page + 1}">&gt;</a></li>
					<li><a href="/lar/admin/commu/board/list/${pi.max_page_count}">&gt;&gt;</a></li>
				<% } %>
			</ul>
		</nav>
	</div>
</div>

<c:import url="/WEB-INF/views/admin/common/_footer.jsp">
</c:import>