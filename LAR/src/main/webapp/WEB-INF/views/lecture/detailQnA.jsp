<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/views/common/_header.jsp">
	<c:param value="QnA작성" name="pageTitle" />
</c:import>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>
</header>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-10 col-sm-10">
			<div class="row">
				<div id="postlist">
					<div class="panel">
						<div class="panel-heading" style="border-bottom: 1px solid gray;">
							<div class="text-left">							
								<h3>Title</h3>
								<small>nickname</small>
							</div>
						</div>

						<div class="panel-body">
							Lorem ipsum dolor sit amet, consectetur adipisicing elit, <br>sed do
							eiusmod tempor incididunt ut labore et dolore<br> magna aliqua. Ut
							enim ad minim veniam, quis <br>nostrud exercitation ullamco laboris
							nisi ut aliquip ex ea <br>commodo consequat. Duis aute irure dolor
							in... <a href="#">Read more</a>
						</div>

						<div class="panel-footer" style="text-align: right;">
							<small>2014-07-30 18:30:00</small>
						</div>
					</div>
					<c:forEach var="i" begin="1" end="3">
					<div class="panel">
						<div class="panel-heading" style="border-bottom: 1px solid gray;">
							<div class="text-left">							
								<h2 style="display: inline-block;">↳</h2>&nbsp;<small>nickname</small>
							</div>
						</div>

						<div class="panel-body">
							Lorem ipsum dolor sit amet, consectetur adipisicing elit, <br>sed do
							eiusmod tempor incididunt ut labore et dolore<br> magna aliqua. Ut
							enim ad minim veniam, quis <br>nostrud exercitation ullamco laboris
							nisi ut aliquip ex ea <br>commodo consequat. Duis aute irure dolor
							in... <a href="#">Read more</a>
						</div>

						<div class="panel-footer" style="text-align: right;">
							<small>2014-07-30 18:30:00</small>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
			
			<div>
				<button type="button" class="btn btn-default pull-right reply_btn" style="margin-top:10px; margin-bottom:10px;">답글작성</button>
				<button type="button" class="btn btn-default pull-right reply_cancel_btn" style="margin-top:10px; margin-bottom:10px; display:none;">작성취소</button>
			</div>
			
			<div class="row write_reply" style="display: none; margin-top: 50px">
				<form action="">
					<div id="summernote"></div>
					<button type="submit" class="btn btn-default pull-right" style="margin-top: 10px">작성완료</button>
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
			
			 $('.reply_btn').on('click', function(){
				 $('.write_reply').css('display','');
				 $('.reply_cancel_btn').css('display','');
				 $('.reply_btn').css('display', 'none');
			 });
			 
			 $('.reply_cancel_btn').on('click', function(){
				 $('.write_reply').css('display','none');
				 $('.reply_cancel_btn').css('display','none');
				 $('.reply_btn').css('display', '');
				 $('#summernote').summernote('reset');
			 });
		</script>
			<c:import url="/WEB-INF/views/common/_footer.jsp" />