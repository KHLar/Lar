<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/common/_header.jsp" >
</c:import>
 <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery1.min.js"></script>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap2.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/blog-post.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
<br><br><br><br><br>
<br><br>

    <!-- Page Content -->
    <div class="container" style="height:auto;">
      <div class="row">
    
        <!-- Post Content Column -->
        <div class="col-md-9">

          <!-- Title -->
          <h1 class="mt-4">강의명</h1>

          <!-- Author -->
          <p class="lead"> by
            <a href="#">강사 닉네임</a>
          </p>
        q

          <!-- Date/Time -->
          <p>sysdate</p>
          <hr>
          <!-- Preview Image -->
          <div class="col-sm-12">
          	<iframe style="width:100%;height: 400px;" src="https://www.youtube.com/embed/HJy2AzhWHxo/" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
          <br><br>
          </div>
          

          <!-- Post Content -->
          
          <h3>강좌소계</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut, tenetur natus doloremque laborum quos iste ipsum rerum obcaecati impedit odit illo dolorum ab tempora nihil dicta earum fugiat. Temporibus, voluptatibus.</p>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, doloribus, dolorem iusto blanditiis unde eius illum consequuntur neque dicta incidunt ullam ea hic porro optio ratione repellat perspiciatis. Enim, iure!</p>
         
            <h3>강좌 특징</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error, nostrum, aliquid, animi, ut quas placeat totam sunt tempora commodi nihil ullam alias modi dicta saepe minima ab quo voluptatem obcaecati?</p>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Harum, dolor quis. Sunt, ut, explicabo, aliquam tenetur ratione tempore quidem voluptates cupiditate voluptas illo saepe quaerat numquam recusandae? Qui, necessitatibus, est!</p>
            <h3>이 강좌로 할 수 있는 것들</h3>
            ㅁㄴㅇㅁㄴㅇ
            
            <h4>참고 자료</h4>
            자바 파이선 등등등
          <hr>
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
                        <td colspan="6">Chapter 1 -Introduction</td>
                    </tr>
                    <c:forEach items="${Blist}" var="bl" >
                  	<tr>
                        <td class="play_icons"><a class="lectureView"><img src="${pageContext.request.contextPath}/resources/images/play-icon.png"></td>
                        <td class="play_title"><a class="lectureView">${bl.lecture_board_title}</a></td> 
                        <td class="preview"> <img src="${pageContext.request.contextPath}/resources/images/free.png"></td>  
                        <td class="time" >${bl.lecture_board_upload_date }</td>
                        <td class="attachment"><img src="${pageContext.request.contextPath}/resources/images/attachment.png"></td>
                    </tr>	
                    </c:forEach>
                </tbody>
            </table>
            </div>
            <button class="btn btn-warning pull-right" id="lectureBoardInsert">등록하기</button>
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
 				  <p> 이름</p>
 				  <ul class="list-group list-group-flush">
   				   <li class="list-group-item">가격</li>
		 		   <li class="list-group-item">난이도</li>
		           <li class="list-group-item">n개의 강의, 총 N시간</li>
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