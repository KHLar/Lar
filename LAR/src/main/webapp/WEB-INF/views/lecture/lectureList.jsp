<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/common/_header.jsp">
	<c:param value="강의 리스트" name="pageTitle" />
</c:import>
<link href="${pageContext.request.contextPath}/resources/css/blog-post.css" rel="stylesheet">	
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link
	href="${pageContext.request.contextPath}/resources/css/lar-board.css"
	rel="stylesheet">
 <style>
 
 
  * {box-sizing: border-box;}
    
    body {
        font-family: Arial
       
    }
    
    .heading {
        font-size: 25px;
        margin-right: 25px;
    }
    
    .fa {font-size: 25px;}
    
    .checked {color: orange;}
    
    /* Three column layout */
    .side {
        float: left;
        width: 15%;
        margin-top:10px;
    }
    
    .middle {
        margin-top:10px;
        float: left;
        width: 70%;
    }
    
    /* Place text to the right */
    .right {
        text-align: right;
    }
    
    /* Clear floats after the columns */
    .row:after {
        content: "";
        display: table;
        clear: both;
    }
    
    /* The bar container */
    .bar-container {
        width: 100%;
        
        background-color: #f1f1f1;
        text-align: center;
        color: white;
    }
    
    /* Individual bars */
    .bar-5 {width: 60%; height: 18px; background-color: #4CAF50;}
    .bar-4 {width: 30%; height: 18px; background-color: #2196F3;}
    .bar-3 {width: 10%; height: 18px; background-color: #00bcd4;}
    .bar-2 {width: 4%; height: 18px; background-color: #ff9800;}
    .bar-1 {width: 15%; height: 18px; background-color: #f44336;}
    
    /* Responsive layout - make the columns stack on top of each other instead of next to each other */
    @media (max-width: 400px) {
        .side, .middle {
            width: 100%;
        }
        .right {display: none;}
    }
    .list-unstyled li{
    padding: 5px 0px 5px 5px;
    margin-bottom: 5px;
    border-bottom: 1px solid #efefef;
    font-size: 12px;
    }
    .list-unstyled li:last-child{
    border-bottom: 0px;}
 
 </style>
 
</header>
<%-- <link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap1.min.css"
	rel="stylesheet"> --%>
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/resources/css/shop-item.css" rel="stylesheet">

<br>
<br>
<br>

<script>
function lecValidate() {
	if ($('#LecSearchText').val().trim() == null
			|| $('#LecSearchText').val().trim() == "") {
		location.href = "${pageContext.request.contextPath}/lectureList";
	}
	return true;
}
</script>

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
					
						<li class="list-group-item"><a href="${pageContext.request.contextPath}/lectureList?category=L01">JAVA</a></li>
						<li class="list-group-item"><a href="${pageContext.request.contextPath}/lectureList?category=L02">C++</a></li>
						<li class="list-group-item"><a href="${pageContext.request.contextPath}/lectureList?category=L03">JavaScript</a></li>
						<li class="list-group-item"><a href="${pageContext.request.contextPath}/lectureList?category=L04">php</a></li>
						<li class="list-group-item"><a href="${pageContext.request.contextPath}/lectureList?category=L05">Python</a></li>
					
					</div>
				</div>
			</ul>

		
		</div>
		<div class="col-lg-7">
			<br>
			
				<form action="${pageContext.request.contextPath}/lectureList" onsubmit="return lecValidate();">

					<div class="input-group">
						  <input type="text" class="form-control" placeholder="Search" id="LecSearchText" name="LecSearchText">
						  <input type="hidden" name="category" value="${category}"/>
      					  <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
					</div>
				</form>
				<hr>
				<c:forEach items="${lList}" var="lList">
				<div class="row">
					<div class="col-md-3">
						<a class="" id="Detail" href="${pageContext.request.contextPath}/lecture/lectureDetail?lecture_index=${lList.lecture_index}">
						<img class="img-fluid rounded mb-3 mb-md-1" src="${lList.lecture_thumbnail}" alt="">
						</a>
					</div>
					<div class="col-md-6">
						
						
						<input class="index" type="hidden" value="${lList.lecture_index}">
						<a class="" id="Detail" href="${pageContext.request.contextPath}/lecture/lectureDetail?lecture_index=${lList.lecture_index}"><h3>${lList.lecture_title} </h3></a>
						<c:if test="${lList.lecture_total_score == 0}">
          				  <span class="fa fa-star "></span>
				          <span class="fa fa-star "></span>
				          <span class="fa fa-star "></span>
				          <span class="fa fa-star "></span>
				          <span class="fa fa-star "></span>
				          <h5>(등록된 수강평이 없습니다.)</h5>
				          </c:if>
				          <c:if test="${lList.lecture_total_score == 1}">
				          <span class="fa fa-star checked"></span>
				          <span class="fa fa-star "></span>
				          <span class="fa fa-star "></span>
				          <span class="fa fa-star "></span>
				          <span class="fa fa-star"></span>
				          </c:if>
				          <c:if test="${lList.lecture_total_score == 2}">
				          <span class="fa fa-star checked"></span>
				          <span class="fa fa-star checked"></span>
				          <span class="fa fa-star "></span>
				          <span class="fa fa-star "></span>
				          <span class="fa fa-star"></span>
				          </c:if>
				          <c:if test="${lList.lecture_total_score == 3}">
				          <span class="fa fa-star checked"></span>
				          <span class="fa fa-star checked"></span>
				          <span class="fa fa-star checked"></span>
				          <span class="fa fa-star "></span>
				          <span class="fa fa-star"></span>
				          </c:if>
				          <c:if test="${lList.lecture_total_score == 4}">
				          <span class="fa fa-star checked"></span>
				          <span class="fa fa-star checked"></span>
				          <span class="fa fa-star checked"></span>
				          <span class="fa fa-star checked"></span>
				          <span class="fa fa-star"></span>
				          </c:if>
				          <c:if test="${lList.lecture_total_score == 5}">
				          <span class="fa fa-star checked"></span>
				          <span class="fa fa-star checked"></span>
				          <span class="fa fa-star checked"></span>
				          <span class="fa fa-star checked"></span>
				          <span class="fa fa-star checked"></span>
				          </c:if>
				          <c:if test="${ lList.lecture_review_count ne 0 }">
         					 <h4> ${lList.lecture_review_count } 개의 수강평</h4>
							</c:if>
							<c:choose>
							 <c:when test="${fn:length(lList.lecture_intro ) > 50}">
								<p><c:out value="${fn:substring(lList.lecture_intro ,0,49)}"/>....</p>
							</c:when>
							<c:otherwise>
							<p><c:out value="${lList.lecture_intro }"/></p>
							</c:otherwise> 
							</c:choose>	
						
						<button type="button" class="btn btn-warning pull-right lectureUpdate">수정하기</button>
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
      String category=request.getParameter("category");
      String LecSearchText=request.getParameter("LecSearchText");
      if(LecSearchText==null)
    	  LecSearchText="";
      if(category==null)
    	  category="";
      
      int cPage = 1;
      try{
         cPage = Integer.parseInt(cPageTemp);
      } catch(NumberFormatException e){
         
      }
      
   %>
   <%=com.misoot.lar.common.util.Utils.getLecPageBar(totalContents, cPage, numPerPage,category,LecSearchText,"/lar/lectureList") %>
			
				<button class="btn btn-warning pull-right" id="lectureInsert">등록하기</button>
			</div>
<c:import url="/WEB-INF/views/common/_footer.jsp" />