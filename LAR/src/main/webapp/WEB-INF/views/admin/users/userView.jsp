<%@page import="com.misoot.lar.common.util.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/admin/common/_header.jsp">
	<c:param value="Users View" name="pageTitle" />
</c:import>

<div class="col-lg-12">
	<div class="row">
		<h1 class="page-header">Users</h1>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-dashboard"></i> Users</li>
			<li class="active"><i class="fa fa-dashboard"></i> View</li>
			<li class="active"><i class="fa fa-dashboard"></i> ${user_index}</li>
		</ol>
	</div>

	${view_user}


	<div class="row">
		
	</div>

</div>

<c:import url="/WEB-INF/views/admin/common/_footer.jsp">
</c:import>