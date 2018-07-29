<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/common/_header.jsp">
	<c:param value="마이페이지" name="pageTitle" />
</c:import>

<script>
	$('.mypageTab a').click(function (e) {
	    e.preventDefault();
	    $(this).tab('show');
	})
	
	function infoBtn(){
		location.href = "${pageContext.request.contextPath}/mypage/infoPage";
	}
	
	function checkboxArr() {
		var checkArr = [];
		
		$("input[name='wishIndex']:checked").each(function(i) {
			checkArr.push($(this).val());
		});
		
		$.ajax({
			url:'${pageContext.request.contextPath}/mypage/deleteWishList',
			type:'post',
			dataType:'json',
			data: {
				'checkArr': checkArr
			}, success : function(data){
				if (data.result) {
					location.href = '${pageContext.request.contextPath}'+data.href;
				} else {
					alert('에러발생 ! 관리자에게 문의하세요.');
				}
			}
		});
		
		
	}
</script>

</header>
</div>

<% 
	HashMap<String, Object> pagingInf = (HashMap<String, Object>)(request.getAttribute("pagingInf"));					
	int numPerPage = Integer.parseInt(String.valueOf(request.getAttribute("numPerPage")));
   
	int ltotalContents = (Integer)pagingInf.get("lTotalCnt");
	int wtotalContents = (Integer)pagingInf.get("wTotalCnt");
	int qtotalContents = (Integer)pagingInf.get("qnaTotalCnt");
	
	int lcPage = 1;
	int wcPage = 1;
	int qnaPage = 1;
	try {
		lcPage = Integer.parseInt(request.getParameter("lcPage"));
		wcPage = Integer.parseInt(request.getParameter("wcPage"));
		qnaPage = Integer.parseInt(request.getParameter("qnaPage"));
	} catch(Exception e) {
	}
	String url = "/lar/mypage";
%>

<div class="container" style="margin-left:5%;">
	<div class="row">
		<div class="col-lg-10 col-md-10 col-sm-10" style="margin-bottom: 100px;">
			<div class="row" style="width: 100%">
				<div class="panel panel-default"
					style="margin-left: 10px; border-bottom:0; box-shadow:0;">
					<div class="panel-body">
						<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
							<img alt="User Pic" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg" id="profile-image1" class="img-circle img-responsive">
						</div>
						<div class="col-md-9 col-xs-12 col-sm-8 col-lg-9">
							<div class="wrapprofile">
								<h2 style="display: inline-block;">${session_user.user_nickname}</h2>&nbsp;&nbsp;
								<button type="button" onclick="infoBtn();" class="btn btn-primary btn pull-right" style="margin-top: 18px;">정보수정</button>
								
							</div>
							<hr style="border: 0.03em solid #cbbde2">
							<ul class="container details" style="list-style: none;">
								<li>
									<label>
										<span class="glyphicon glyphicon-envelope"></span>  ${session_user.user_id}
									</label>
								</li>
								<li>
									<label>
										<span class="glyphicon glyphicon-calendar"></span>  Date Of Joining: ${session_user.user_enrolled_date}
									</label>
								</li>
							</ul>
							<hr style="border: 0.03em solid #cbbde2">
							<div class="col-sm-5 col-xs-6 tital">								
								<h4>소개</h4>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="tabs" style="width: 100%;">
				<ul class="nav mypageTab nav-tabs" role="tablist" style="width: 98%;">
					<li role="presentation" class="active"><a class="myLecture" 
						data-target="#wrapMyLecture" id="myLecture" data-toggle="tab"> 
							&nbsp;&nbsp;&nbsp;나의 강의&nbsp;&nbsp;&nbsp; </a></li>
					<li role="presentation"><a class="QnAList"
						data-target="#wrapQnA" id="QnAList" href="#" data-toggle="tab">
							&nbsp;&nbsp;&nbsp;질문 답변&nbsp;&nbsp;&nbsp; </a></li>
					<li role="presentation"><a class="wishList"
						data-target="#wrapWishList" id="wishList" data-toggle="tab">
							&nbsp;&nbsp;&nbsp;위시리스트&nbsp;&nbsp;&nbsp; </a></li>
					<li role="presentation"><a class="paymentList"
						data-target="#wrapPaymentList" id="paymentList" data-toggle="tab">
							&nbsp;&nbsp;&nbsp;구매내역&nbsp;&nbsp;&nbsp; </a></li>
					<li role="presentation"><a class="couponList" data-target="#wrapCoupon" id="couponList" data-toggle="tab">
							&nbsp;&nbsp;&nbsp;쿠폰내역&nbsp;&nbsp;&nbsp;</a></li>
					<li role="presentation"><a class="alarm"
						data-target="#wrapAlarm" id="alarm" data-toggle="tab">
							&nbsp;&nbsp;&nbsp;알림&nbsp;&nbsp;&nbsp; </a></li>
				</ul>
			</div>
			
			<div class="mypageBody tab-content">
				<div class="wrapMyLecture tab-pane active" id="wrapMyLecture">
					<h3>나의 강의</h3>
					<c:forEach  items="${mypageList.llist}" var="mylecture">
						<input type="hidden" id="lIndex" value="${mylecture.lecture_index}"/>
						<div class="well">
							<div class="media">
								<a class="pull-left" href="#"> <img class="media-object" src="http://placekitten.com/150/150"></a>
								<div class="media-body">
									<h4 class="media-heading">${mylecture.lecture_title}</h4>
									<p class="text-right">${mylecture.lecture_instructor_nickname}</p>
									<p>${mylecture.lecture_intro}</p>
									<ul class="list-inline list-unstyled">
										<li><span><i class="glyphicon glyphicon-calendar"></i></span></li>
										<li>|</li>
										<span><i class="glyphicon glyphicon-comment"></i> ${mylecture.lecture_review_cnt} reviews</span>
										<li>|</li>
										<li>
											<span class="glyphicon glyphicon-star"></span> 
											<span class="glyphicon glyphicon-star"></span> 
											<span class="glyphicon glyphicon-star"></span> 
											<span class="glyphicon glyphicon-star"></span> 
											<span class="glyphicon glyphicon-star-empty"></span>
										</li>
										<li>|</li>
										<li>
											<button type="button" class="btn btn-success btn-sm" style="border: none">계속하기</button>
											<button type="button" class="btn btn-danger btn-sm" style="border: none">수강취소</button>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</c:forEach>
					<div class="lcPageBar" style="text-align:center;">	
				   		<%= com.misoot.lar.common.util.Utils.mypagelcPageBar(ltotalContents, lcPage, numPerPage, url) %>
				   </div>
				</div>

				<div class="wrapQnA tab-pane" id="wrapQnA">
					<h3>질문답변</h3>
					<table class="table" style="text-align: center">
						<thead>
							<tr style="text-align: center">								
								<th style="width: 30%">강의 명</th>
								<th style="width: 52%">질문 제목</th>
								<th style="width: 8%">답변여부</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${mypageList.qnalist}" var="qnalist">
								<tr>
									<td>${qnalist.LECTURE_TITLE}</td>
									<td>${qnalist.LECTURE_Q_TITLE}</td>
									<td>
										<c:if test="${ qnalist.LECTURE_A_INDEX eq null }">
											X
										</c:if>
										<c:if test="${ qnalist.LECTURE_A_INDEX ne null }">
											O
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div style="text-align:center;">	
				   		<%= com.misoot.lar.common.util.Utils.mypageQnAcPageBar(qtotalContents, qnaPage, numPerPage, url) %>
				   </div>
				</div>
				
				<div class="wrapWishList tab-pane" id="wrapWishList">
					<h3 style="display: inline;">위시리스트</h3>
					<form action="/lar/mypage/deleteWishList">
					<div class="pull-right">
						<button type="button" class="btn btn-danger deleteWishList" style="border: none">
							<span class="glyphicon glyphicon-trash"></span>삭제하기
						</button>
						<button type="button" class="btn btn-success cancelDeleteWishList" onclick="checkboxArr();" style="border: none; display: none">
							<span class="glyphicon glyphicon-ok"></span>선택완료
						</button>
					</div>
					<br><br>
					<table class="table">
						<c:forEach items="${mypageList.wlist}" var="wishList">
							<tr>
								<td class="deleteCkbox" style="display: none">
									<div class="ckbox">
										<input type="checkbox" name="wishIndex" id="checkbox${wishList.lecture_index}" value="${wishList.lecture_index}"> 
										<label for="checkbox${wishList.lecture_index}"></label>
									</div>
								</td>
								<td>
									<div class="media">
										<a href="#" class="pull-left"> 
											<img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
										</a>
										<div class="media-body">
											<span class="media-meta pull-right">${wishList.lecture_review_cnt} reviews</span>
											<h4 class="title">${wishList.lecture_title}</h4>
											<p class="summary">${wishList.lecture_intro}</p>
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
							</tr>
						</c:forEach>
					</table>
					</form>
					<div style="text-align:center;">	
				   		<%= com.misoot.lar.common.util.Utils.mypagewcPageBar(wtotalContents, wcPage, numPerPage, url) %>
				   </div>
				</div>

				<div class="wrapPaymentList tab-pane" id="wrapPaymentList">
					<h3>구매내역</h3>
					<table class="table" frame=void>
						<tr>
							<th style="width: 17%; text-align: center;">결제일</th>
							<th style="width: 48%; text-align: center;">강의정보</th>
							<th style="width: 25%; text-align: center;">사용쿠폰</th>
							<th style="width: 10%; text-align: center;">결제금액</th>
						</tr>
						<c:forEach items="${mypageList.plist}" var="plist">
							<tr>
								<td class="paymentDate" style="text-align: center;">${plist.PURCHASE_DATE}</td>
								<td style="text-align: center;">
									<div class="media">
										<div class="media-body">
											<p class="puchaseList">${plist.PURCHASE_LECTURE_LIST}</p>											
										</div>
									</div>
								</td>
								<td style="text-align: center;">
								<c:choose>
									<c:when test="${plist.COUPON_NAME ne null}"> 
										${ plist.COUPON_NAME } 
									</c:when>
									<c:otherwise>
										X
									</c:otherwise>
								</c:choose>
								</td>
								<td style="text-align: center;">${ plist.PAID_AMOUNT }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				
				<div class="wrapCoupon tab-pane" id="wrapCoupon">
					<h3>미사용 쿠폰</h3>
					<table class="table" style="text-align: center">
						<thead>
							<tr style="text-align: center">
								<th style="width: 20%; text-align: center;">지급일</th>
								<th style="width: 40%; text-align: center;">쿠폰 명</th>
								<th style="width: 40%; text-align: center;">할인금액</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${mypageList.clist}" var="clist">
								<c:if test="${clist.USER_COUPON_USED_DATE eq null}">
								<tr class="">
									<td>${clist.USER_COUPON_GIVEN_DATE}</td>
									<td>${clist.COUPON_NAME}</td>
									<td>${clist.COUPON_DISCOUNT_INF}</td>
								</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
					<br><br>
					<h3>쿠폰 사용 내역</h3>
					<table class="table" style="text-align: center">
						<thead>
							<tr>
								<th style="width: 20%; text-align: center;">사용일</th>
								<th style="width: 40%; text-align: center;">쿠폰 명</th>
								<th style="width: 40%; text-align: center;">할인금액</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${mypageList.clist}" var="clist">
								<c:if test="${clist.USER_COUPON_USED_DATE ne null}">
								<tr class="">
									<td>${clist.USER_COUPON_USED_DATE}</td>
									<td>${clist.COUPON_NAME}</td>
									<td>${clist.COUPON_DISCOUNT_INF}</td>
								</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="wrapAlarm tab-pane" id="wrapAlarm">
					<h3>알림</h3>
					<div class="row">
						<div class="col-md-12">
							<div class="update-nag">
								<div class="update-split update-info">
									<i class="glyphicon glyphicon-sunglasses"></i>
								</div>
								<div class="update-text">
									1/7/2016 - <a href="#">DadDadDaddyO.com/blog</a> - Check out my sweet new site!
								</div>
							</div>
						</div>

						<div class="col-md-12">
							<div class="update-nag">
								<div class="update-split update-danger">
									<i class="glyphicon glyphicon-warning-sign"></i>
								</div>
								<div class="update-text">
									2/10/2016 - <a href="#">news.ycombinator.com</a> - <strong>Sweet new WordPress hack</strong>
								</div>
							</div>
						</div>

						<div class="col-md-12">
							<div class="update-nag">
								<div class="update-split update-success">
									<i class="glyphicon glyphicon-user"></i>
								</div>
								<div class="update-text">2/14/2016 - You - Yikes! Updating WordPress.</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<c:import url="/WEB-INF/views/common/_footer.jsp" />