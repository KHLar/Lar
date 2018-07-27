<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/common/_header.jsp" >
</c:import>
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/blog-post.css" rel="stylesheet">
<style>
    * {box-sizing: border-box;}
    
    body {
        font-family: Arial;
       
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

    <!-- Page Content -->
    
    <div class="container" style="height:auto;">
      <div class="row">
    
        <!-- Post Content Column -->
        <div class="col-md-9">

          <!-- Title -->
          <h1 class="mt-4">${lecture.lecture_title}</h1>

          <!-- Author -->
          <p class="lead"> by
            <a href="#">${lecture.user_nickname}</a>
            
          </p>
        

          <!-- Date/Time -->
          <p>업로드 날짜:${lecture.lecture_upload_date }</p>
          <hr>
          <!-- Preview Image -->
          <div class="col-sm-12">
          	${lecture.lecture_content }
          <br><br>
          </div>
          

          <!-- Post Content -->
          
        
    
          <!-- User Rating -->
          <span class="heading">강좌 평가</span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star"></span>
          <p>4.1 average based on 254 reviews.</p>
          <hr style="border:3px solid #f1f1f1">

          <div class="row">
            <div class="side">
              <div>5 star</div>
            </div>
            <div class="middle">
              <div class="bar-container">
                <div class="bar-5"></div>
              </div>
            </div>
            <div class="side right">
              <div>150</div>
            </div>
            <div class="side">
              <div>4 star</div>
            </div>
            <div class="middle">
              <div class="bar-container">
                <div class="bar-4"></div>
              </div>
            </div>
            <div class="side right">
              <div>63</div>
            </div>
            <div class="side">
              <div>3 star</div>
            </div>
            <div class="middle">
              <div class="bar-container">
                <div class="bar-3"></div>
              </div>
            </div>
            <div class="side right">
              <div>15</div>
            </div>
            <div class="side">
              <div>2 star</div>
            </div>
            <div class="middle">
              <div class="bar-container">
                <div class="bar-2"></div>
              </div>
            </div>
            <div class="side right">
              <div>6</div>
            </div>
            <div class="side">
              <div>1 star</div>
            </div>
            <div class="middle">
              <div class="bar-container">
                <div class="bar-1"></div>
              </div>
            </div>
            <div class="side right">
              <div>20</div>
            </div>
          </div>

          <!-- Comments Form -->
          <div class="card my-4">
            <h5 class="card-header">수강 후기 : </h5>
            <div class="star-rating" style="display: inline-block; margin-left: 15px; margin-top: 7px; cursor: pointer;">
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star"></span>
            <span class="fa fa-star"></span>
          </div>
            <div class="card-body">
              <form>
                <div class="form-group">
                  <textarea class="form-control" rows="3"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">등록</button>
              </form>
            </div>
          </div>
          <!-- Single Comment -->
          <div class="media mb-2">
            <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
            <div class="media-body">
              <h5 class="mt-0">Commenter Name</h5>
              Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
            </div>
        
          </div>
           
          <!-- Comment with nested comments -->
             <div class=""> 
            <h3> 강좌 교육 과정</h3>
            <table class="table table-hover">
                <tbody>
                  <tr class="lecture_section" scope="col">
                     
         			
                    </tr>
                    <c:forEach items="${blist}" var="bl" >
                     	<tr>                  		
	                        <td class="play_icons"><!-- <a class="lectureView"> --><img src="${pageContext.request.contextPath}/resources/images/play-icon.png"></td>
	                        <td class="play_title"><a class="lectureView">${bl.LECTURE_BOARD_TITLE}</a>
	                        <input type="hidden"  value="${bl.LECTURE_BOARD_INDEX}" class="my_boardLecture_index"/>
	                  		<input type="hidden" value="${lecture.lecture_index}"  class="my_lecture_index"/></td> 
	                        <td class="preview"> <img src="${pageContext.request.contextPath}/resources/images/free.png"></td>  
	                        <td class="time" >${bl.LECTURE_BOARD_UPLOAD_DATE }</td>
	                        <td class="attachment">
	                        <c:if test="${bl.LECTURE_ATTACH_RENAMEDFILENAME ne null}">
	                        	<a href="${pageContext.request.contextPath}/resources/uploadFiles/BoardLecture/${bl.LECTURE_ATTACH_RENAMEDFILENAME}" download><img src="${pageContext.request.contextPath}/resources/images/attachment.png"></a>
	                        </c:if>
	                        </td>
                    	</tr>	
                    </c:forEach>
                </tbody>
            </table>
            </div>
            <input type="hidden" id="my_lecture_index" value="${lecture.lecture_index}" /> 
            <button class="btn btn-warning pull-right" id="lectureBoardInsert">등록하기</button>
            <button class="btn btn-warning pull-right" id="lectureBoardDelete">삭제하기</button>&nbsp;
            <button class="btn btn-warning pull-right" id="lectureBoardModify">수정하기</button>&nbsp;
        </div>

        <!-- Sidebar Widgets Column -->
        <div class="col-md-3">
          <!-- Categories Widget -->
          <div class="card ">
          	<div class="card-header" style="text-align=center;">
    		 강좌 정보
 		 	</div>
            <div class="card-body">
            <div class="text-center">
 				 <img src="${pageContext.request.contextPath}/resources/images/play-icon.png" class="rounded-circle" alt="..." width="125" height="125">
 				  <p>${lecture.user_nickname}</p>
 				  <ul class="list-group list-group-flush">
   				   <li class="list-group-item">${lecture.lecture_price}원</li>
		 		   <li class="list-group-item">${lecture.lecture_level }</li>
		           <li class="list-group-item">n개의 강의, 총 N시간</li>
		           <input type="hidden" value="${lecutre.lecture_index }" />
		          </ul>
			</div>
		</div>
          </div>

          <!-- Side Widget -->
          <div class="card my-3">
            <h6 class="card-header">다른 강좌 보기 : 강사닉</h6>
            <div class="card-body">
                 <ul class="list-group list-group-flush">
   				   <li class="list-group-item">Cras justo odio</li>
		 		   <li class="list-group-item">Dapibus ac facilisis in</li>
		           <li class="list-group-item">Vestibulum at eros</li>
		          </ul>
            </div>
          </div>
         </div>
      <!-- /.row -->
    </div>
    <!-- /.container -->
  </div>
</div>
	

<br><br><br>
 <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundler.min.js"></script>
<c:import url="/WEB-INF/views/common/_footer.jsp"/>