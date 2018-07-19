x<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<title> 강의 등록 하기</title>
<c:import url="/WEB-INF/views/common/_header.jsp">
</c:import>
</header>
<script
	src="${pageContext.request.contextPath}/resources/summernote/summernote.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/summernote/summernote.css"
	rel="stylesheet">

<div class="container-fluid">
	<div class="row">
		<div class="col-md-10 col-sm-10">
			<div class="container">
				<h1 class="">강의 등록하기</h1>
				<form id="defaultForm" method="post" class="form-horizontal" enctype="multipart/form-data" action="${pageContext.request.contextPath}/lecture/lectureInsert">
					<div class="form-group">
						<br /><br /><br />
						<div class="col-sm-8">
							<div class="form0-row">
							<input type="text" class="form-control md-6 mb-3" placeholder="강의명" name="lecture_title" required/>
							<input type="hidden" class="form-control" >
							<input type="hidden" name="lecture_instructor_index" value="${session_user.user_index}"  reqired/>
							
							</div>
							<br />
							<div class="form-inline">
							<label for="staticEmail" class=" col-form-label">카테고리 :</label>&nbsp;&nbsp;	 
							<select class="form-control form-control mb-2 mr-sm-2" name="lecture_category_index" reqired>
 						 	<option>L01</option>
 						 	<option>L02</option>
 						 	<option>L03</option>
 						 	<option>L04</option>
 						 	<<option>L05</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label for="staticEmail" class=" col-form-label">난이도 :</label>&nbsp;&nbsp;
							<select class="form-control form-control mb-2 mr-sm-2" name="lecture_level"reqired>
 						 	<option>상</option>
 						 	<option>중</option>
 						 	<option>하</option>
							</select>
								 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp
						
							<label for="staticEmail" class=" col-form-label">가격 :</label>&nbsp;&nbsp;
							 <input type="number" class="form-control mb-2 mr-sm-2"  name="lecture_price"   required/>
  			
							</div>
							<br />	
							
							<div class="form-group">
    						<label for="exampleFormControlTextarea1">intro</label>
    						<input type="hidden" id="lecture_intro" name="lecture_intro"/>
   							<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" ></textarea>
  							</div>
								
							<div id="summernote" ></div>
							<input type="hidden"  id="lecture_content" name="lecture_content"  value="뀨" "required />
							<button type="submit" class="btn btn-wanrming pull-right" onclick="funcNote();">제출하기 </button>
						</div>
					</div>
				</form>
			</div>
		</div>

<script>
	$(function() {
		$('#summernote').summernote({
			height : 300, // 기본 높이값
			minHeight : null, // 최소 높이값(null은 제한 없음)
			maxHeight : null, // 최대 높이값(null은 제한 없음)
			focus : true, // 페이지가 열릴때 포커스를 지정함
			lang : 'ko-KR' // 한국어 지정(기본값은 en-US)
		});
	});
	 function funcNote(){
		 $('#lecture_intro').val($('#exampleFormControlTextarea1').val());
         document.getElementById("lecture_content").value=$('#summernote').summernote('code');
         //alert(document.getElementById("commu_Content").value);
     }
	 
</script>
<c:import url="/WEB-INF/views/common/_footer.jsp" />