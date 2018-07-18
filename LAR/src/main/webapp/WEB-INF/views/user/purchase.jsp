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
		IMP.request_pay({ // param
			pg : "inicis",
			pay_method : "card",
			merchant_uid : "ORD20180131-0000011",
			name : "test",
			amount : 101,
			buyer_email : '${user.user_id}',
			buyer_name : '${user.user_nickname}',
			buyer_tel : '${user.user_phone}'
		}, function(rsp) { // callback
			if (rsp.success) {
				// ...,
				// 결제 성공 시 로직,
				// ...
			} else {
				//...,
				// 결제 실패 시 로직,
				//...
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
				<table class="table" style="border-bottom: 1px solid #ddd;">
					<tr>
						<th style="width: 80%">강의정보</th>
						<th style="width: 20%">수강료</th>
					</tr>
					<tr>
						<td>
							<div class="media">
								<a href="#" class="pull-left"> <img
									src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg"
									class="media-photo">
								</a>
								<div class="media-body">
									<h4 class="title">Lorem Impsum</h4>
									<p class="summary">Ut enim ad minim veniam, quis nostrud
										exercitation...</p>
									<span> <i class="glyphicon glyphicon-star"></i> <i
										class="glyphicon glyphicon-star"></i> <i
										class="glyphicon glyphicon-star"></i> <i
										class="glyphicon glyphicon-star"></i> <i
										class="glyphicon glyphicon-star"></i>
									</span>
								</div>
							</div>
						</td>
						<td>15,000</td>
					</tr>
					<tr>
						<th>총 금액</th>
						<td>15,000</td>
					</tr>
				</table>

				<br>

				<h3>수강생 정보</h3>
				<table class="table" style="border-bottom: 1px solid #ddd;">
					<tr>
						<td>신청자 명</td>
						<td><input type="text" class="form-control" name="" id=""
							style="width: 300px;" /></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td class="form-inline"><input type="text"
							class="form-control" name="" id="" style="width: 50px;" /> - <input
							type="text" class="form-control" name="" id=""
							style="width: 60px;" /> - <input type="text" class="form-control"
							name="" id="" style="width: 60px;" /></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="email" class="form-control"
							id="exampleInputEmail1" placeholder="이메일을 입력하세요"
							style="width: 300px;"></td>
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
						<td>15,000원</td>
						<td>-0원</td>
						<td>= 15,000원</td>
					</tr>
					<tr>
						<th>쿠폰사용</th>
						<td colspan="2" class="form-inline"><input type="text"
							class="form-control" name="" id="" style="width: 200px;" />
							<button type="button" class="btn btn btn-warning btn-xm">쿠폰선택</button>
						</td>
					</tr>
				</table>

				<button type="button" class="btn btn btn-success pull-right"
					onclick="requestPay();">구매확정</button>

			</div>
		</div>
<br>
<br>
<br>
<br>
<br>

<c:import url="/WEB-INF/views/common/_footer.jsp" />