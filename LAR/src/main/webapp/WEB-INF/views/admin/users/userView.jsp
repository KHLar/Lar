<%@page import="com.misoot.lar.user.model.vo.User"%>
<%@page import="com.misoot.lar.common.util.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/admin/common/_header.jsp">
	<c:param value="Users View" name="pageTitle" />
</c:import>

<%
	User view_user = (User)request.getAttribute("view_user");
%>

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
		<form id="user_view" action="/lar/admin/users/modify" method="post">
			<div class="panel panel-info" style="width:80%;">
				<div class="panel-heading">
					<h3 class="panel-title">정보</h3>
				</div>
				<div class="panel-body">
					<table class="table">
						<tr>
							<th>속성</th>
							<th>값</th>
							<th style="width:50%;">동작</th>
						</tr>
						<tr>
							<td>번호</td>
							<td>
								<div class="form-group">
									<input type="text" class="form-control" name="user_index" value="${view_user.user_index}" readonly/>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<td>ID</td>
							<td>
								<div class="form-group">
									<input type="text" class="form-control" name="user_id" value="${view_user.user_id}" readonly/>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<td>닉네임</td>
							<td>
								<div class="form-group">
									<input type="text" class="form-control" name="user_nickname" value="${view_user.user_nickname}"/>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<td>가입일</td>
							<td>${view_user.user_enrolled_date}</td>
							<td></td>
						</tr>
						<tr>
							<td>핸드폰</td>
							<td>
								<div class="form-group">
									<input type="text" class="form-control" name="user_phone" value="${view_user.user_phone}"/>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<td>타입</td>
							<td>${view_user.user_type}</td>
							<td></td>
						</tr>
						<tr>
							<td>레벨</td>
							<td>${view_user.user_level}</td>
							<td></td>
						</tr>
						<tr>
							<td>탈퇴 여부</td>
							<td>
								<div class="form-group">
									<select class="form-control" name="user_is_secession">
										<% if (view_user.isUser_is_secession()) { %>
											<option value="true" selected="true">true</option>
											<option value="false">false</option>
										<% } else { %>
											<option value="true">true</option>
											<option value="false" selected="true">false</option>
										<% } %>
									</select>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<td>추방 여부</td>
							<td>
								<div class="form-group">
									<select class="form-control" name="user_is_kicked">
										<% if (view_user.isUser_is_kicked()) { %>
											<option value="true" selected="true">true</option>
											<option value="false">false</option>
										<% } else { %>
											<option value="true">true</option>
											<option value="false" selected="true">false</option>
										<% } %>
									</select>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<td>접속 시도</td>
							<td>
								<div class="form-group">
									<input type="text" class="form-control" name="user_try_signin_count" id="user_try_signin_count" value="${view_user.user_try_signin_count}" readonly/>
								</div>
							</td>
							<td>
								<button type="button" class="btn btn-default" onclick="$('#user_try_signin_count').val(0);">Reset</button>
							</td>
						</tr>
					</table>
				</div>
				<div class="panel-footer" style="text-align:right;">
					<button type="submit" id="btn-modify" class="btn btn-warning">수정</button>
				</div>
			</div>
		</form>
	</div>
</div>

<c:import url="/WEB-INF/views/admin/common/_footer.jsp">
</c:import>