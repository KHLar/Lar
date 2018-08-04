<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/common/_header.jsp">
	<c:param value="Home" name="pageTitle" />
</c:import>

<!-- Header -->
<div class="container main-carousel" style="width: 100%">
	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active" style="border: 1px solid gray"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"
				style="border: 1px solid gray"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"
				style="border: 1px solid gray"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img class="slide" src="/lar/resources/uploadFiles/carousel/carousel1.png" style="height:480px;" alt="test1">
				<div class="carousel-caption">img1</div>
			</div>
			<div class="item">
				<img class="slide" src="" alt="test2">
				<div class="carousel-caption">img2</div>
			</div>
			<div class="item">
				<img class="slide" src="" alt="test2">
				<div class="carousel-caption">img3</div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
</div>
</header>
<!-- header end -->

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-10 col-md-10 col-sm-10">
			<div class="row">
				<div class="main-newlecture" style="margin-bottom: 10px;">
					<h3>신규 강좌</h3>
					<div class="row">
						<c:forEach items="${recent_lecture_list}" var="rec">
							<div class="container col-xs-12 col-sm-6 col-md-4 col-lg-3" style="padding: 5px;">
								<div class="thumbnail container-fluid">
									<a href="/lar/lecture/lectureDetail?lecture_index=${rec.lecture_index}"><img src="${rec.lecture_thumbnail}"></a>
									<div class="caption">
										<h4>
											<a href="/lar/lecture/lectureDetail?lecture_index=${rec.lecture_index}">${rec.lecture_title}</a>
										</h4>
										<p>
											<c:if test="${rec.lecture_price eq 0}">
												<span style="text-align: right">Free</span>
											</c:if>
											<c:if test="${ rec.lecture_price ne 0}">
												<span style="text-align: right">￦${rec.lecture_price}</span>
												<a id="thumb-cart" class="pull-right"><span class="glyphicon glyphicon-shopping-cart"></span></a>&nbsp;&nbsp;&nbsp;
											</c:if>
											<c:if test="${rec.wish_user_index eq null}">
												<a id="thumb_empty_heart" class="pull-right"><span class="glyphicon glyphicon-heart-empty" style="color: tomato"></span></a>
											</c:if>
											<c:if test="${rec.wish_user_index ne null}">
												<a id="thumb_heart" class="pull-right"><span class="glyphicon glyphicon-heart" style="color: tomato"></span></a>
											</c:if>
											<input type="hidden" class="lecture_index" name="lecture_index" value="${rec.lecture_index}" />
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="main-recommandlecture">
					<h3>추천 강좌</h3>
					추후 추가예정
				</div>
			</div>
		</div>
<c:import url="/WEB-INF/views/common/_footer.jsp" />