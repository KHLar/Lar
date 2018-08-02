<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/admin/common/_header.jsp">
	<c:param value="Lectures" name="pageTitle" />
</c:import>

<script>
	var current_path = window.location.href;
	var path_arr = current_path.split('/');
	
	$(function() {
		if (current_path.includes('search')) {
			$('.breadcrumb .fa-search').parent('li').css('display', '');
			$('.breadcrumb .fa-list').parent('a').attr('href', current_path);
			$('input[name=text]').val(decodeURI(path_arr[path_arr.indexOf('search')+2]));
			$('select[name=filter]').children('option[value='+path_arr[path_arr.indexOf('search')+1]+']').attr('selected','true');
		}
	});
</script>

<div class="col-lg-12">
	<div class="row">
		<h1 class="page-header">
			Lectures
		</h1>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-book"></i> Lectures</li>
			<li class="active" style="display: none;"><i class="fa fa-search"></i> Search</li>
			<li class="active"><a href="/lar/admin/lectures/list/1"><i class="fa fa-list"></i> List</a></li>
			<li class="active"><i class="fa fa-hashtag"></i> ${pi.current_page}</li>
		</ol>
	</div>
	
	<div class="row">
		<nav class="navbar">
			<div class="container-fluid">
				<form class="navbar-form navbar-right" action="/lar/admin/lectures/search" method="post">
					<div class="form-group">
						<ul class="nav">
							<li class="active">
								<select class="form-control" name="filter">
									<option value="title">제목</option>
									<option value="category">카테고리</option>
									<option value="writer">작성자</option>
								</select>
							</li>
						</ul>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search" name="text" required>
						<button class="btn btn-default form-control" type="submit">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</form>
			</div>
		</nav>
	</div>
	
	<div class="row">
		강의좀 보여주기
	</div>
</div>

<c:import url="/WEB-INF/views/admin/common/_footer.jsp">
</c:import>