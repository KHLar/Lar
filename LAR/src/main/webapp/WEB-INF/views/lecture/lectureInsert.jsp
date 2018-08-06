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
				<form id="defaultForm" method="post" class="form-horizontal" enctype="multipart/form-data" action="${pageContext.request.contextPath}/lecture/lectureInsert" onsubmit="return validate();">
					<div class="form-group">
						<br /><br /><br />
						<div class="col-sm-8">
							<div class="form-row">
							<input type="text" class="form-control md-6 mb-3" placeholder="강의명" name="lecture_title" required/>
							<input type="hidden" class="form-control" >
							 <input type="hidden"  id="lecture_instructor_index" name="lecture_instructor_index" value="${session_user.user_index}"  required/> 
							
							</div>
							<br />
							<div class="form-inline">
							<label for="staticEmail" class=" col-form-label">카테고리 :</label>&nbsp;&nbsp;	 
							<select class="form-control form-control mb-2 mr-sm-2" name="lecture_category_index" required>
 						 	<option value="L01">JAVA</option>
 						 	<option value="L02">C++</option>
 						 	<option value="L03">JavaScript</option>
 						 	<option value="L04">PHP</option>
 						 	<option value="L05">Python</option>
 						 	<option value="L06">SWIFT</option>
 						 	<option value="L07">FireBase</option>
 						 	<option value="L08">Android Studio</option>
 						 	<option value="L09">Raspberries</option>
 						 	<option value="L10">Hybrid</option>
 						 	<option value="L11">Oracle</option>
 						 	<option value="L12">Mysql</option>
 						 	<option value="L13">MSsql</option>
 						 	<option value="L14">Nosql</option>
 						 	
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label for="staticEmail" class=" col-form-label">난이도 :</label>&nbsp;&nbsp;
							<select class="form-control form-control mb-2 mr-sm-2" name="lecture_level"required>
 						 	<option>상</option>
 						 	<option>중</option>
 						 	<option>하</option>
							</select>
								 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								  &nbsp;&nbsp;&nbsp;&nbsp;
						
							<label for="staticEmail" class=" col-form-label">가격 :</label>&nbsp;&nbsp;
							 <input type="number" class="form-control mb-2 mr-sm-2"  name="lecture_price"   required/>
  							
  							
							</div>
							<br />
							<div class="form-inline">
							<label for="staticEmail" class=" col-form-label">유저 아이디:</label>&nbsp;&nbsp;
							 <input type="email" class="form-control mb-1 mr-sm-1"  id="user_id" name="user_id" value=""  required/>
							
							</div>	
							
						
    						<label for="exampleFormControlTextarea1">intro</label>
    						<input type="hidden" id="lecture_intro" name="lecture_intro"/>
   							<textarea class="form-control" id="exampleFormControlTextarea1" rows="4" ></textarea>
  							
							<br />	
							
							<div id="summernote" >
								<h3>1. 소개글<br></h3>
								<h3>2. 강의특징<br></h3>
								<h3>3. 참고자료<br></h3>
							</div>
							<input type="hidden"  id="lecture_content" name="lecture_content"  value="" required />
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
      
     }
	 function validate() {
			var intro = $("#lecture_intro").val();
			if (intro.trim().length == 0) {
				alert("intro 내용을 입력하세요");
				return false;
			}
		
			var content = $('#summernote').summernote('code');
			
			if(content.indexOf('<iframe') == -1 ){
				alert("동영상을 등록해주세요");
				return false;
			}
			
			/* if ($('#lecture_instructor_index').val() == ""
					|| $('#lecture_instructor_index').val() == null) {
				alert('로그인 먼저해주세요^^');
				return false;
			} */
			return true;
		}
	 
	 
</script>
<c:import url="/WEB-INF/views/common/_footer.jsp" />