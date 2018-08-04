<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script>
$(function() {
	$('#dynamicModal').on('hidden.bs.modal', function() {
		location.reload();
	});
});
</script>

<div class="modal-header">
	<ul class="pager pull-left">
		<li><a role="button" onclick="adminUsersListModal(${view_commu.commu_Writer_Index}, '${pre_list}', ${pre_page})">이전 목록</a></li>
	</ul>
</div>

<div class="modal-body">
	<div class="row">
		<p>${pre_list}</p>
		<p>${pre_page}</p>
		${view_commu}
	</div>
	<div class="row">
		${view_commu_reply}
	</div>
</div>

<div class="modal-footer">
	
</div>