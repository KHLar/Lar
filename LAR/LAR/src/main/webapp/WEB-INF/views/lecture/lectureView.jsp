<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

    <title>강의 동영상</title>
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.mini.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/portfolio-item.css" rel="stylesheet">
   
    <style>
    body{
    background-color: skyblue;
    }
    
    
    </style>
 <!-- Page Content -->
    <div class="container">
      <h1 class="my-4">강의명 받아오기
      </h1>

      <!-- Portfolio Item Row -->
      <div class="row">

         <div class="col-md-7">
          	<iframe style="width:100%;height: 400px;" src="https://www.youtube.com/embed/HJy2AzhWHxo/" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
          <br><br>
          </div>

        <div class="col-md-3">
          <h3 class="my-3">프로잭트 기본 정보</h3>
          <p>햄스터가 감옥을 탈출해요 !! 뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨 뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨뀨ㅠ뀨뀨ㅠ뀪뀨</p>
          </div>
          <h3 class="col-my-10"></h3>
            <div class="col-md-10"> 
            	 강좌 교육 과정
            <table class="table table-hover">
                <tbody>
                    <tr class="lecture_section" scope="col">
                        <td colspan="6">Chapter 1 -Introduction</td>
                    </tr>
                       <c:forEach items="${list}" var="b"> 
     					<tr id="${b.boardNo}">
         				<td>${b.boardNo}</td>
         				<td>${b.boardTitle}</td>
         				<td>${b.boardWriter}</td>
         				<td>${b.boardDate}</td>
         				<td align="center">
            			<c:if test="${b.fileCount>0}">
               			<img alt="첨부파일" src="${pageContext.request.contextPath}/resources/images/file.png" width=16px>
            			</c:if>
         </td>
         <td>${b.readCount }</td>
      </tr>
      </c:forEach>    
                    <tr>
                        <td class="play_icons"><img src="${pageContext.request.contextPath}/resources/images/play-icon.png"></td>
                        <td class="play_title"><a class="lectureView">자바를 배워보자 나의 자바</a></td> 
                        <td class="preview"> <img src="${pageContext.request.contextPath}/resources/images/free.png"></td>  
                        <td class="time" >08:00</td>
                        <td class="attachment"><img src="${pageContext.request.contextPath}/resources/images/attachment.png"></td>
                    </tr>
                    <tr>
                        <td class="play_icons"><img src="${pageContext.request.contextPath}/resources/images/play-icon.png"></td>
                        <td class="play_title"><a href="#">자바를 배워보자 나의 자바</a></td> 
                        <td class="preview"> <img src="${pageContext.request.contextPath}/resources/images/free.png"></td>  
                        <td class="time" >08:00</td>
                        <td class="attachment"></td>
                    </tr>
                <tr>
                        <td class="play_icons"><img src="${pageContext.request.contextPath}/resources/images/play-icon.png"></td>
                        <td class="play_title"><a href="#">자바를 배워보자 나의 자바</a></td> 
                        <td class="preview"></td>  
                        <td class="time" >08:00</td>
                        <td class="attachment"></td>
                    </tr>
                </tbody>
                
            </table>
            </div>
        </div>

      </div>
     
  
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>