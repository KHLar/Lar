<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/common/_header.jsp">
	<c:param value="결제페이지" name="pageTitle" />
</c:import>

<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
	var IMP = window.IMP;
	IMP.init("imp42497878");

	function requestPay() {
		var title = $('.media-body .title');
		var name = "";
		
		$.each(title, function(index, item){
			if(index >= title.length-1) {
				name += $(item).text();
			} else {
				name += $(item).text() + ",";
			}
		});
		
		IMP.request_pay({ // param
			pg : "inicis",
			pay_method : "card",
			merchant_uid : $('#imputEmail').val() + "_" + new Date().getTime(),
			name : name,
			amount : $('#afterdiscount').text(),
			buyer_email : $('#imputEmail').val(),
			buyer_name : $('#name').val(),
			buyer_tel : $('#phone').val()
		}, function(rsp) { // callback
			if (rsp.success) {
				// 결제정보 db에 저장
				// 결제 성공 시 cart에서 해당 강의 삭제
				// 사용쿠폰 삭제
			} else {
				// 에러페이지
			}
		});
	}
</script>

</header>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-10 col-md-10 col-sm-10">
			<div class="PurchaseLectureList">
				<h3>수강신청 내용</h3>
				<table class="table" id="pchtable" style="border-bottom: 1px solid #ddd;">
					<tr>
						<th style="width: 80%">강의정보</th>
						<th style="width: 20%">수강료</th>
					</tr>
					<c:set var="lecTotal" value="0" />
					<c:forEach items="${pchList}" var="p">
					<tr>
						<td>
							<div class="media">
								<a href="#" class="pull-left"> 
									<img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
								</a>
								<div class="media-body">
									<h4 class="title">${p.LECTURE_TITLE}</h4>
									<c:choose>
										<c:when test="${fn:length(p.LECTURE_INTRO) > 80}">
											<p><c:out value="${fn:substring(p.LECTURE_INTRO,0,79)}"/>....</p>
										</c:when>
										<c:otherwise>
											<p><c:out value="${p.LECTURE_INTRO}"/></p>
										</c:otherwise> 
									</c:choose>								
								</div>
							</div>
						</td>
						<td>15,000</td>
					</tr>
					<c:set var="lecTotal" value="${lecTotal+p.LECTURE_PRICE}" />
					</c:forEach>
					<tr>
						<th>총 금액</th>
						<th>${lecTotal} 원</th>
					</tr>
				</table>

				<br>

				<h3>수강생 정보</h3>
				<table class="table" style="border-bottom: 1px solid #ddd;">
					<tr>
						<td>신청자 명</td>
						<td><input type="text" class="form-control" id="name" style="width: 300px;" /></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td>
							<input type="text" class="form-control" id="phone" value="${ session_user.user_phone }" style="width: 300px;"/>
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<input type="email" class="form-control" id="inputEmail" style="width: 300px;" value="${ session_user.user_id }">
						</td>
					</tr>
				</table>

				<br>

				<h3>결제 예정 금액</h3>
				<table class="table" style="border-bottom: 1px solid #ddd;">
					<tr>
						<th>총 금액</th>
						<th>할인 + 부가결제 금액</th>
						<th>최종 결제 예정 금액</th>
					</tr>
					<tr>
						<td id="totalprice">${lecTotal}</td>
						<td> - <span id="discount">0</span></td>
						<td>= <span id="afterdiscount">${lecTotal}</span> 원</td>						
					</tr>
					<tr>
						<th>쿠폰사용</th>
						<td colspan="2" class="form-inline">
							<input type="text" class="form-control" id="coupon" style="width: 200px;" disabled/>
							<input type="hidden" id="couponidx"/>
							<button type="button" class="btn btn btn-warning btn-xm" onClick="window.open('/lar/purchase/coupon','coupon','width=500, height=' + (parseInt(window.innerHeight) * .25))">쿠폰선택</button>
						</td>
					</tr>
				</table>
				<button type="button" class="btn btn btn-success pull-right" onclick="requestPay();">구매확정</button>
			</div>
		</div>
<br>
<br>
<br>
<br>
<br>

<!-- 부모창에서 자식창 열때
	.open("path", "사이즈 관련 있음");
 -->

<c:import url="/WEB-INF/views/common/_footer.jsp" />