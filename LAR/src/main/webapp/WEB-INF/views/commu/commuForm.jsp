<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/views/common/_header.jsp">
	<c:param value="장바구니" name="pageTitle" />
</c:import>
</header>

<script
	src="${pageContext.request.contextPath}/resources/js/tagInput.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tagInput.css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>
<script>
	$(document).ready(function() {
		$('#tags').tagInput();
	});
	function validate() {
		var content = $("#commu_Content").val();
		if (content.trim().length == 0) {
			alert("내용을 입력하세요");
			return false;
		}
		if ($('#commu_Writer_Index').val() == ""
				|| $('#commu_Writer_Index').val() == null) {
			alert('로그인 먼저해주세요^^');
			return false;
		}
		return true;
	}
	/*부트스트랩 : file 변경시 파일명 보이기 */
	$(function() {
		$('[name=upFile]').on('change', function() {
			var fileName = $(this).prop('files')[0].name;//파일명
			console.log($(this).val());
			$(this).next('.custom-file-label').html(fileName);
		});
	});
</script>
<c:set var="req" value="" />
<c:if test="${commu_Category_Index eq 'B03'}">
	<c:set var="req" value="required" />
</c:if>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-10 col-sm-10">
			<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10" style="border-right: none; padding-right: 0%;">
			<form name="commuFrm" action="${pageContext.request.contextPath}/commu/commuFormEnd" method="POST" onsubmit="return validate();" enctype="multipart/form-data">
			
					<div class="form-group">
						<label for="commu_title">제목</label>
						<c:if test="${commu ne null }">
						<input type="text" class="form-control" id="commu_Title" name="commu_Title" placeholder="제목" value="${commu.commu_Title }" required>
						</c:if>
						<c:if test="${commu eq null}">
						<input type="text" class="form-control" id="commu_Title" name="commu_Title" placeholder="제목" required>
						</c:if>
					</div>
					
					<div class="form-group">
						<label for="commu_file">파일</label>
						<div class="custom-file">
						<c:if test="${commu eq null }">
							<input type="file" class="custom-file-input" name="upFile" id="upFile" multiple ${req}>
						</c:if>
						<c:if test="${commu ne null}">
							<label>파일은 수정불가하옵니다.</label>
						</c:if>
						</div>
					</div>
					<div class="bootstrap-tagsinput form-group">
						<div class="form-control tags" id="tags">
						<c:if test="${commu ne null }">
						<input type="text" class="labelinput" value="${commu.commu_tags }"/>
						</c:if>
						<c:if test="${commu eq null }">
						<input type="text" class="labelinput" placeholder="태그를 입력하세요" />
						</c:if>
							<input type="hidden" value="" name="result" />
						</div>
					</div>
					<div class="form-group">
						<div id="summernote">
						<c:if test="${commu ne null }">
						${commu.commu_Content }
						</c:if>
						
						</div>
						
						
					</div>
					<button type="submit" class="btn btn-primary pull-right" onclick="funcNote();">작성완료</button>
					<input type="hidden" id="commu_Category_Index" name="commu_Category_Index" value="${commu_Category_Index}" />
					<input type="hidden" id="commu_Content" name="commu_Content" />
					<input type="hidden" id="commu_Writer_Index" name="commu_Writer_Index" value="${session_user.user_index}" />
					<input type="hidden" id="commu_Index" name="commu_Index" value="${commu_Index}"/>
					
				</form>
			</div>
		</div>
		
		<script>
			$('#summernote').summernote({
				placeholder : '내용을 자유롭게 작성해주세요(너무 자유로우면 제재함)',
				tabsize : 2,
				height : 300,
			});
			function funcNote() {
				document.getElementById("commu_Content").value = $(
						'#summernote').summernote('code');
				//alert(document.getElementById("commu_Content").value);
			}
		</script>

		<c:import url="/WEB-INF/views/common/_footer.jsp" />