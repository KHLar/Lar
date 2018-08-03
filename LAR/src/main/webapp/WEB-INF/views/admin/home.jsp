<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/admin/common/_header.jsp">
	<c:param value="Home" name="pageTitle" />
</c:import>

<script>
	function testModal(num) {
		$.ajax({
			type: 'post',
			url: '/lar/admin/modal',
			data: {
				num: num
			},
			success: function(result_html) {
				$('.modal-content').html(result_html);
			}
		});
	}
</script>

<div class="col-lg-12">
	<div class="row">
		<h1 class="page-header">
			Home <small>Statistics Overview</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-dashboard"></i> Home</li>
		</ol>
	</div>

	<div class="row">
		<a class="btn btn-default" role="button" data-toggle="modal" data-target=".dynamicModal" onclick="testModal(1);">1</a>
		<a class="btn btn-default" role="button" data-toggle="modal" data-target=".dynamicModal" onclick="testModal(8);">2</a>
	</div>
</div>

<c:import url="/WEB-INF/views/admin/common/_footer.jsp">
</c:import>