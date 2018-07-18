<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/common/_header.jsp" >
	<c:param value="강의등록 신청" name="pageTitle"/>
</c:import>

<br><br><br><br><br>
<br><br>
<div class=container>
<div class="row">
    <div class="col-lg-10 col-md-10 col-sm-10">
    	<h3>강의등록 신청</h3>
		
	</div>
	
	<div class="col-lg-2 col-md-2 col-sm-2">
		<div><img src="${pageContext.request.contextPath}/resources/images/ad.JPG"></img></div>
	</div>
</div>
</div>
<br><br><br>
<c:import url="/WEB-INF/views/common/_footer.jsp"/>