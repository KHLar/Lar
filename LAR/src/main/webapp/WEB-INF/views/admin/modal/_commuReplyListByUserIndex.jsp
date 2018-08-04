<%@page import="com.misoot.lar.common.util.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
%>
<script>
$(function() {
	$('#dynamicModal').on('hidden.bs.modal', function() {
		location.reload();
	});
});
</script>

<div class="modal-header">
	User's Community Reply Write List
</div>

<div class="modal-body">
	<nav class="navbar">
		<div class="container-fluid">
			<div class="navbar-form navbar-right modal-search">
				<div class="form-group">
					<ul class="nav">
						<li class="active">
							<select class="form-control" name="filter">
								<option value="content">내용</option>
							</select>
						</li>
					</ul>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search" name="text">
					<button class="btn btn-default form-control" type="button" onclick="">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
		</div>
	</nav>

	<table class="table table-striped table-condensed">
		<tr>
			<td>Parent Idx</td>
			<td>Content</td>
			<td>Nick</td>
			<td>Date</td>
		</tr>
		<c:forEach items="${commuReply_list}" var="cr">
			<tr>
				<td>${cr.commu_Reply_Commu_Index}</td>
				<td>
					<p><a role="button" onclick="adminUsersViewModal(${user_index}, 'commu', ${cr.commu_Reply_Commu_Index}, 'commuReply', ${pi.current_page})">${cr.commu_Reply_Content}</a></p>
				</td>
				<td>${cr.commu_Reply_Writer}</td>
				<td>${cr.commu_Reply_Upload_Date}</td>
			</tr>
		</c:forEach>
	</table>
</div>

<div class="modal-footer">
	<nav class="text-center">
		<ul class="pagination">
			<% if (pi.getCurrent_page() != 1) { %>
				<li><a role="button" onclick="adminUsersListModal(${user_index}, 'commuReply', 1)">&lt;&lt;</a></li>
				<li><a role="button" onclick="adminUsersListModal(${user_index}, 'commuReply', ${pi.current_page-1})">&lt;</a></li>				
			<% } %>
				
			<% for (int i=pi.getStart_page(); i<=pi.getEnd_page(); i++) { %>
				<% if (i == pi.getCurrent_page()) { %>
					<li class="active"><a><%=i%></a></li>
				<% } else if (i <= pi.getMax_page_count()) { %>
					<li><a role="button" onclick="adminUsersListModal('${user_index}', 'commuReply', <%=i%>)"><%=i%></a></li>
				<% } %>
			<% } %>
			
			<% if (pi.getMax_page_count() > pi.getCurrent_page()) { %>
				<li><a role="button" onclick="adminUsersListModal(${user_index}, 'commuReply', ${pi.current_page+1})">&gt;</a></li>
				<li><a role="button" onclick="adminUsersListModal(${user_index}, 'commuReply', ${pi.max_page_count})">&gt;&gt;</a></li>
			<% } %>
		</ul>
	</nav>
</div>