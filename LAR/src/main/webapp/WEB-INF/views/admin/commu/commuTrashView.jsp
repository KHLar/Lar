<%@page import="com.misoot.lar.common.util.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/admin/common/_header.jsp">
	<c:param value="Community" name="pageTitle" />
</c:import>

<div class="col-lg-12">
	<div class="row">
		<ol class="breadcrumb">
			<li><i class="fa fa-dashboard"></i> Community</li>
			<li class="active"><i class="fa fa-trash"></i> Trash</li>
			<li class="active"><i class="fa fa-eye"></i> View</li>
			<li class="active"><i class="fa fa-hashtag"></i> ${view_commu.commu_Index}</li>
		</ol>
	</div>
	
	<div class="row">
		
	</div>
	
	<div class="row">
		<c:forEach items="${view_commu_reply}" var="cr">
			${cr}
		</c:forEach>
	</div>
</div>
<c:import url="/WEB-INF/views/admin/common/_footer.jsp">
</c:import>