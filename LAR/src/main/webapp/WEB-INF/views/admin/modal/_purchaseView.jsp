<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<style>
	.modal-footer .panel-body {
		padding: 15px;
		border: 1px solid #ddd;
	}
</style>

<script>
$(function() {
	$('#dynamicModal').on('hidden.bs.modal', function() {
		location.reload();
	});
});
</script>

<div class="modal-header">
	<ul class="pager pull-left">
		<li><a class="pre" role="button" onclick="adminUsersListModal(${user_index}, '${pre_list}', ${pre_page})">이전 목록</a></li>
	</ul>
</div>

<div class="modal-body">
	<div class="row">
		
	</div>
	<div class="row" style="text-align: right;">
		
	</div>
</div>

<div class="modal-footer" style="text-align: left;">
	
</div>