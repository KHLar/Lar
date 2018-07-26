<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/common/_header.jsp" >
	<c:param value="추천 강좌" name="pageTitle"/>
</c:import>

</header>

<div class="container-fluid">
<div class="row">
    <div class="col-lg-10 col-md-10 col-sm-10">
    	<h3>추천 강좌</h3>
	</div>
<c:import url="/WEB-INF/views/common/_footer.jsp"/>