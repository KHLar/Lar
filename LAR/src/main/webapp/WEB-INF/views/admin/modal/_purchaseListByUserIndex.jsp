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
	<h4><b>User's Payment List</b></h4>
</div>

<div class="modal-body">

	<table class="table table-striped table-condensed">
		<tr>
			
		</tr>
	</table>
</div>

<div class="modal-footer">
	<nav class="text-center">
		<ul class="pagination">
			<% if (pi.getCurrent_page() != 1) { %>
				<li><a role="button" onclick="adminUsersListModal(${user_index}, 'purchase', 1)">&lt;&lt;</a></li>
				<li><a role="button" onclick="adminUsersListModal(${user_index}, 'purchase', ${pi.current_page-1})">&lt;</a></li>				
			<% } %>
				
			<% for (int i=pi.getStart_page(); i<=pi.getEnd_page(); i++) { %>
				<% if (i == pi.getCurrent_page()) { %>
					<li class="active"><a><%=i%></a></li>
				<% } else if (i <= pi.getMax_page_count()) { %>
					<li><a role="button" onclick="adminUsersListModal(${user_index}, 'purchase', <%=i%>)"><%=i%></a></li>
				<% } %>
			<% } %>
			
			<% if (pi.getMax_page_count() > pi.getCurrent_page()) { %>
				<li><a role="button" onclick="adminUsersListModal(${user_index}, 'purchase', ${pi.current_page+1})">&gt;</a></li>
				<li><a role="button" onclick="adminUsersListModal(${user_index}, 'purchase', ${pi.max_page_count})">&gt;&gt;</a></li>
			<% } %>
		</ul>
	</nav>
</div>