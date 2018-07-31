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
		<div style="width:80%;">
			<ul class="nav nav-tabs">
				<li class="active"><a data-target="#user_view" data-toggle="tab">유저 정보</a></li>
				<li><a data-target="#writeList" data-toggle="tab">작성한 글</a></li>
				<li><a data-target="#replyList" data-toggle="tab">댓글</a></li>
				<li><a data-target="#paymentList" data-toggle="tab">결제 내역</a></li>
				<% if (view_user.getUser_type().equals("inst")) { %>
					<li><a data-target="#lectureLaunchedList" data-toggle="tab">강의 제공 내역</a></li>
				<% } %>
			</ul>
			<div class="panel-body tab-content">
				<form id="user_view" class="tab-pane active" action="/lar/admin/users/modify" method="post">
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
				</form>
				<div id="writeList" class="tab-pane">
					<table class="table">
						<tr>
							<th>Category</th>
							<th>Index</th>
							<th>Title</th>
							<th>Date</th>
						</tr>
						<c:forEach items="${writeList}" var="w">
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						</c:forEach>
					</table>
				</div>
				<div id="replyList" class="tab-pane">
					
				</div>
				<div id="paymentList" class="tab-pane">
					
				</div>
				<% if (view_user.getUser_type().equals("inst")) { %>
				<div id="lectureLaunchedList" class="tab-pane">
					
				</div>
				<% } %>
			</div>
			<div class="panel-footer" style="text-align:right;">
				<button type="submit" id="btn-modify" class="btn btn-warning">수정</button>
			</div>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/views/admin/common/_footer.jsp">
</c:import>