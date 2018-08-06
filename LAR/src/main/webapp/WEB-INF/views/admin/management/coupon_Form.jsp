<%@page import="com.misoot.lar.common.util.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/admin/common/_header.jsp">
	<c:param value="coupon_Form" name="pageTitle" />
</c:import>


<div class="col-lg-12">
	<div class="row">
		<h1 class="page-header">
			Management
		</h1>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-cogs"></i> Management</li>
			<li class="active"><i class="fa fa-ticket"></i> Coupon</li>
			<li class="active"><a href="/lar/admin/management/coupon/list/1"><i class="fa fa-list"></i> List</a></li>
			<li class="active"><i class="fa fa-hashtag"></i> ${pi.current_page}</li>
		</ol>
	</div>
	
	<div class="row table-responsive">
		<form action="/lar/admin/management/coupon/add" method="post">
			<table class="table table-striped table-condensed">
				<tr>
					<td>쿠폰 명 : </td>
					<td><input type="text" class="form-control" name="coupon_name"/></td>
					<td></td>
				</tr>
				<tr>
					<td>할인 가:</td>
					<td><input type="text" class="form-control" name="coupon_discount_inf"/></td>
					<td>
						<select class="form-control" name="coupon_type">							
							<option value="%" selected="true">％</option>
							<option value="원">￦</option>					
						</select>
					</td>
				</tr>
			</table>
			<div class="pull-right"><button type="submit" class="btn btn-primary">추가</button></div>
		</form>
	</div>
</div>

<c:import url="/WEB-INF/views/admin/common/_footer.jsp">
</c:import>