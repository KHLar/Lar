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

	<div class="row">
		<form>
			<div class="panel panel-info" style="width:80%;">
				<div class="panel-heading">
					<h3 class="panel-title">test</h3>
				</div>
				<div class="panel-body">
					<table class="table">
						<tr>
							<th>Field</th>
							<th>Value</th>
							<th style="width:50%;">Action</th>
						</tr>
						<tr>
							<td>Index</td>
							<td>${view_user.user_index}</td>
							<td></td>
						</tr>
						<tr>
							<td>ID</td>
							<td>${view_user.user_id}</td>
							<td></td>
						</tr>
						<tr>
							<td>NickName</td>
							<td>
								<div class="form-group">
									<input type="text" class="form-control" value="${view_user.user_nickname}"/>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<td>E-Date</td>
							<td>${view_user.user_enrolled_date}</td>
							<td></td>
						</tr>
						<tr>
							<td>Phone</td>
							<td>${view_user.user_phone}</td>
							<td></td>
						</tr>
						<tr>
							<td>Level</td>
							<td>${view_user.user_level}</td>
							<td></td>
						</tr>
						<tr>
							<td>Is secession</td>
							<td>${view_user.user_is_secession}</td>
							<td></td>
						</tr>
						<tr>
							<td>Is kicked</td>
							<td>${view_user.user_is_kicked}</td>
							<td></td>
						</tr>
						<tr>
							<td>Signin count</td>
							<td>${view_user.user_try_signin_count}</td>
							<td><button type="button" class="btn btn-default">Reset</button></td>
						</tr>
					</table>
				</div>
				<div class="panel-footer" style="text-align:right;">
					<button type="button" class="btn btn-warning">수정</button>
				</div>
			</div>
		</form>
	</div>
</div>
<c:import url="/WEB-INF/views/admin/common/_footer.jsp">
</c:import>