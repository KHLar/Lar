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
								<h3>${ lectureQ.lecture_q_title }</h3>
								<small>${ lectureQ.user_nickname }</small>
							</div>
						</div>

						<div class="panel-body">
							${ lectureQ.lecture_q_content }
						</div>

						<div class="panel-footer" style="text-align: right;">
							<small>${ lectureQ.lecture_q_upload_date }</small>
						</div>
					</div>
					<c:forEach items="${ lectureA }" var="a">
					<div class="panel">
						<div class="panel-heading" style="border-bottom: 1px solid gray;">
							<div class="text-left">							
								<h2 style="display: inline-block;">↳</h2>&nbsp;<small>${ a.user_nickname }</small>
							</div>
						</div>

						<div class="panel-body">
							${ a.lecture_a_content }
						</div>

						<div class="panel-footer" style="text-align: right;">
							<small>${ a.lecture_a_upload_date }</small>
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
				<form action="/lar/lecture/QnA/insertA">
					<div id="summernote"></div>
					<input type="hidden" id="lecture_a_lecture_q_index" value="${ lectureQ.lecture_q_index }"/>
					<input type="hidden" id="lecture_a_content"/>
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
			 
			function inputcontent(){
				document.getElementById("lecture_a_content").value=$('#summernote').summernote('code');
			}
		</script>
			<c:import url="/WEB-INF/views/common/_footer.jsp" />