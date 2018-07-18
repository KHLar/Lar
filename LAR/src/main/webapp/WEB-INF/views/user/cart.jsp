<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/common/_header.jsp" >
	<c:param value="장바구니" name="pageTitle"/>
</c:import>

<br><br><br><br><br>
<br><br>
<div class=container>
<div class="row">
    <div class="col-lg-10 col-md-10 col-sm-10">
    <h3>장바구니</h3>
    	<div class="cartList">
   			<table class="table">
   				<tr>
   					<th></th>
					<th>강의정보</th>
					<th>수량</th>
					<th>가격</th>
				</tr>
				<c:forEach var="i" begin="1" end="3" step="1">
				<tr>
					<td class="deleteCkbox">
						<div class="ckbox">
							<input type="checkbox" id="checkbox1">
							<label for="checkbox1"></label>
						</div>
					</td>
					<td>
						<div class="media">
							<a href="#" class="pull-left">
								<img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
							</a>
							<div class="media-body">
								<h4 class="title">Lorem Impsum</h4>
								<p class="summary">Ut enim ad minim veniam, quis nostrud exercitation...</p>
								<span>
									<i class="glyphicon glyphicon-star"></i>
									<i class="glyphicon glyphicon-star"></i>
									<i class="glyphicon glyphicon-star"></i>
									<i class="glyphicon glyphicon-star"></i>
									<i class="glyphicon glyphicon-star"></i>
								</span>
							</div>
						</div>
					</td>
					<td>
						1
					</td>
					<td>
						15,000원
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="4" style="text-align:right;">총 금액  : 45,000원</td>
				</tr>
			</table>	
			<div class="pull-right">
				<button type="button" class="btn btn-danger deleteCartList" style="border:none"><span class="glyphicon glyphicon-trash"></span>선택삭제</button>
				<button type="button" class="btn btn-success selectPurchase" style="border:none;"><span class="glyphicon glyphicon-ok"></span>선택결제</button>
				<button type="button" class="btn btn-success allPurchase" style="border:none;"><span class="glyphicon glyphicon-ok"></span>모두결제</button>
			</div>
			<br><br>
		</div>
	</div>
	
	<div class="col-lg-2 col-md-2 col-sm-2">
		<div><img src="${pageContext.request.contextPath}/resources/images/ad.JPG"></img></div>
	</div>
</div>
</div>
<br><br><br>
<c:import url="/WEB-INF/views/common/_footer.jsp"/>