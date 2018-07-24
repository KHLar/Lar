<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/common/_header.jsp">
	<c:param value="강의 리스트" name="pageTitle" />
</c:import>
<script>
	/* $(function(){
		  $(document).click("#Detail",function(){
		      var lecture_index = $("#index").val;
		      console.log("lecture_index="+lecture_index);  
		      location.href = "${pageContext.request.contextPath}/lecture/lectureDetail?lecture_index="+lecture_index;
		   });
	}); */
	

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
						<li class="list-group-item"><a href="/lar/lectureList?category=L01">JAVA</a></li>
						<li class="list-group-item"><a href="/lar/lectureList?category=L02">C++</li>
						<li class="list-group-item"><a href="/lar/lectureList?category=L03">JavaScript</li>
						<li class="list-group-item"><a href="/lar/lectureList?category=L04">php</li>
						<li class="list-group-item"><a href="/lar/lectureList?category=L05">JavaScript</li>

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
				<c:forEach items="${lList}" var="lList">
				<div class="row">
					<div class="col-md-3">
						<a href="#"> <img class="img-fluid rounded mb-3 mb-md-0"
							src="http://placehold.it/240x240" alt="">
						</a>
					</div>
					<div class="col-md-6">
						
						
						<input class="index" type="hidden" value="${lList.lecture_index}">
						<h3>${lList.lecture_title}</h3><span class="text-warning">&#9733; &#9733; &#9733; &#9733;
							&#9734;</span> ${lList.lecture_total_score}
							<p>
							<a class="" id="Detail" href="${pageContext.request.contextPath}/lecture/lectureDetail?lecture_index=${lList.lecture_index}">
							${lList.lecture_intro }</a>
						</p>
						
						<button type="button" class="btn btn-warning pull-right" id="lectureUpdate">수정하기</button>
						<button type="button" class="btn btn-warning pull-right lecturedelete">삭제하기</button>
						<h4 class="pull-right">${lList.lecture_price }원</h4>
					</div>
				</div>
				<hr>
				</c:forEach>
			
			
				<!-- Pagination -->
				
	<% 
      int totalContents = Integer.parseInt(String.valueOf(request.getAttribute("totalContents")));
      int numPerPage = Integer.parseInt(String.valueOf(request.getAttribute("numPerPage")));
      
      //파라미터 cPage가 null이거나 "" 일 때에는 기본값 1로 세팅함.  
      String cPageTemp = request.getParameter("cPage");
      int cPage = 1;
      try{
         cPage = Integer.parseInt(cPageTemp);
      } catch(NumberFormatException e){
         
      }
      
   %>
   <%=com.misoot.lar.common.util.Utils.getPageBar(totalContents, cPage, numPerPage, "/lar/lectureList") %>
			
				<button class="btn btn-warning pull-right" id="lectureInsert">등록하기</button>
			</div>
	

<script
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<c:import url="/WEB-INF/views/common/_footer.jsp" />
<a href="#" class="list-group-item list-primary" data-toggle="collapse"
	data-target="#body">카테고리</a>




