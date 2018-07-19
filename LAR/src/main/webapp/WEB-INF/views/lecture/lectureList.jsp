<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/common/_header.jsp">
	<c:param value="강의 리스트" name="pageTitle" />
</c:import>
<script>
function fn_goBoardForm(){
	   location.href = "${pageContext.request.contextPath}/board/boardForm.do";
	}
	$(function(){
	   $("tr[id]").on("click",function(){
	      var boardNo = $(this).attr("id");
	      console.log("bordNo="+boardNo);  
	      location.href = "${pageContext.request.contextPath}/board/boardView.do?no="+boardNo;
	   });
	});

</script>
</header>
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap1.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/shop-item.css"
	rel="stylesheet">

<br>
<br>
<br>
<div class="container">

	<div class="row">
	

		<div class="col-lg-3">

			<ul class="list-group">
				<li class="list-group-item list-group-item-warning"
					data-toggle="collapse" data-target="#cool1" aria-expanded="false">
					<a>메뉴</a> <span class="navbar-toggler-icon"></span>
				</li>

				<div id="cool1">
					<div data-toggle="collapse" data-target="#cool1"
						aria-expanded="false">
						<li class="list-group-item"><a href="#">JAVA</a></li>
						<li class="list-group-item">C++</li>
						<li class="list-group-item">JavaScript</li>
						<li class="list-group-item">php</li>
						<li class="list-group-item">JavaScript</li>

					</div>
			</ul>

		
		</div>
		<div class="col-lg-7">
			<br>
			
				<form action="#" method="get">
					<div class="input-group">
						  <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      					  <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
					</div>
				</form>
				<hr>
				<div class="row">
					<div class="col-md-3">
						<a href="#"> <img class="img-fluid rounded mb-3 mb-md-0"
							src="http://placehold.it/240x240" alt="">
						</a>
					</div>
					<div class="col-md-6">
						<h3>Project One</h3>
						<span class="text-warning">&#9733; &#9733; &#9733; &#9733;
							&#9734;</span> 4.0 stars
						<h4>$24.99</h4>
						<p>
							<a class="lectureDetail">누르면 리스트로 가진다</a>
						</p>
					</div>
				</div>
				<hr>
			
				<!-- Pagination -->
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
					</a></li>
					<li class="page-item active"><a class="page-link " href="#">1</a>
					</li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
							class="sr-only">Next</span>
					</a></li>
				</ul>
				<button class="btn btn-warning pull-right" id="lectureInsert">등록하기</button>
			</div>
	


<script
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<c:import url="/WEB-INF/views/common/_footer.jsp" />
<a href="#" class="list-group-item list-primary" data-toggle="collapse"
	data-target="#body">카테고리</a>




