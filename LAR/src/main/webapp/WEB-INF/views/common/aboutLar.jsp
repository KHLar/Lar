<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<c:import url="/WEB-INF/views/common/_header.jsp">
	<c:param value="About" name="pageTitle"/>
</c:import>

</header>

<!-- !important. div[class=container-fluid] ~ div[class=col-md-10 col-sm-10] -->
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-10 col-md-10 col-sm-10">
			<!-- 
				this is left area. with out advertising area. 
				if you wanna add like section, use to div[class=row]
			-->
			<div class="row">
				<!-- like this. -->
			</div>

			<!-- 
			<div class="row">
			
			</div>
			-->
		</div> <!-- end div[class=col-md-10 col-sm-10] : left area end -->

<c:import url="/WEB-INF/views/common/_footer.jsp"/>