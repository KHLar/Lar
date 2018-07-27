<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/admin/common/_header.jsp">
	<c:param value="User List" name="pageTitle" />
</c:import>

<div class="col-lg-12">
	<div class="row">
		<h1 class="page-header">
			Users
		</h1>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-dashboard"></i> Users</li>
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
				<td>
					${u.user_index}
				</td>
				<td>
					${u.user_id}
				</td>
				<td>
					${u.user_nickname}
				</td>
				<td>
					${u.user_enrolled_date}
				</td>
				<td>
					${u.user_level}
				</td>
			</tr>
		</c:forEach>
		</table>
	</div>
	
	<div class="row">
		
	</div>
	
</div>

<c:import url="/WEB-INF/views/admin/common/_footer.jsp">
</c:import>