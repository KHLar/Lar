<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	<html>
	<head>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/lar.js"></script>
	
	
    <title>강의 동영상</title>
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.mini.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/portfolio-item.css" rel="stylesheet">
 
    <style>
    .youtubeWrap {
  position: relative;
  width: 100%;
  padding-bottom: 56.25%;
}
.youtubeWrap iframe {
  position: absolute;
  width: 100%;
  height: 100%;
}
    body{
    background-color: purple;
    }
    
    }
    
    
    </style>
    </head>
    <body>
 <!-- Page Content -->
    <div class="container">
      <h1 class="my-4">${bLecture.lecture_board_title }
      </h1>

      <!-- Portfolio Item Row -->
      <div class="row">
		
		<div class="col-md-1">
		   버튼
		</div>
         <div class="col-md-9 youtubeWrap">
        	${bLecture.lecture_board_content} 이게 아이프레임인데 크기 조절 어떻게 하지>>??????
          
          <br><br>
          
          </div>
          <div class="col-md-1">
		   버튼
		</div>
          <h3 class="col-my-10"></h3>
            <div class="col-md-10"> 
             <h3> 강좌 교육 과정</h3>
            <table class="table table-hover">
                <tbody>
                        <c:forEach items="${blist}" var="bl">
                        <c:if test="${!empty bl}">
 						<tr class="lecture_section" scope="col">
                    		<td>${bl.LECTURE_BOARD_CHAPTER }</td> 
                    	</tr>
                    	</c:if>
                    		
                 			<td class="play_icons"><!-- <a class="lectureView"> --><img src="${pageContext.request.contextPath}/resources/images/play-icon.png"></td>
                           <td class="play_title"><a class="lectureView">${bl.LECTURE_BOARD_TITLE}</a>
                           <input type="hidden"  value="${bl.LECTURE_BOARD_INDEX}" class="my_boardLecture_index"/>
                           <input type="hidden" value="${lecture_index}"  class="my_lecture_index"/></td> 
                           <td class="preview"> <img src="${pageContext.request.contextPath}/resources/images/free.png"></td>  
                           <td class="time" >${bl.LECTURE_BOARD_UPLOAD_DATE }</td>
                           <td class="attachment">
                           <c:if test="${bl.LECTURE_ATTACH_RENAMEDFILENAME ne null}">
                              <a href="${pageContext.request.contextPath}/resources/uploadFiles/BoardLecture/${bl.LECTURE_ATTACH_RENAMEDFILENAME}" download><img src="${pageContext.request.contextPath}/resources/images/attachment.png"></a>
                           </c:if>
                           	<c:set var="name" value="${bl.LECTURE_INSTRUCTOR_INDEX}" />
                          	<c:set var="name2" value="${session_user.user_index}"/>
                          	<c:if test="${ name eq name2}">
                          
                            <button class="btn btn-warning pull-right" id="lectureBoardDelete">삭제하기</button>
                            </c:if>
                           </td>
                       </tr>   
                    </c:forEach>
                </tbody>
            </table>
            </div>
          
            </div>
        </div>

      </div>
      </body>
     
  
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </html>