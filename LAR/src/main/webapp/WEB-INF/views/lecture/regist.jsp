<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/common/_header.jsp">
	<c:param value="강의등록 신청" name="pageTitle" />
</c:import>
<link href="${pageContext.request.contextPath}/resources/css/one-page-wonder.min.css" rel="stylesheet">
<link	href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"	rel="stylesheet">
<link	href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"	rel="stylesheet">

<header>
	<div class="jumbotron" style="width: 100%; padding-top: 200px; padding-bottom: 75px; background-image: url('/lar/resources/images/giphy.gif');">
		<div class="container">
			<h1>Hello, world!</h1>
			<p>
				<a class="btn btn-primary btn-lg" href="https://goo.gl/forms/ZUlXON1NAg14vUFi2" role="button" target="_blank">강의 등록 신청</a>
			</p>
		</div>
	</div>
</header>

<div class="wrapper" style="margin-top: 50px; margin-bottom: 50px;">
	<div class="container" >
		<div class="row align-items-center col-md-10 col-sm-10">
			<div class="row">
				<div class="col-md-5 col-sm-5">
					<div class="p-5">
						<img class="img-fluid rounded-circle" src="/lar/resources/images/01.jpg" alt="????">
					</div>
				</div>
				<div class="col-md-5 col-sm-5">
					<div class="p-5">
						<h2 class="display-4">For those about to rock...</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Quod aliquid, mollitia odio veniam sit iste esse assumenda amet
							aperiam exercitationem, ea animi blanditiis recusandae! Ratione
							voluptatum molestiae adipisci, beatae obcaecati.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-5 col-sm-5">
				<div class="p-5">
					<h2 class="display-4">We salute you!</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Quod aliquid, mollitia odio veniam sit iste esse assumenda amet
						aperiam exercitationem, ea animi blanditiis recusandae! Ratione
						voluptatum molestiae adipisci, beatae obcaecati.</p>
				</div>
				</div>
				<div class="p-5">
				<div class="col-md-5 col-sm-5">
					<img class="img-fluid rounded-circle" src="/lar/resources/images/02.jpg" alt="????">
				</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-5 col-sm-5">
					<div class="p-5">
						<img class="img-fluid rounded-circle" src="/lar/resources/images/03.jpg" alt="????">
					</div>
				</div>
				<div class="col-md-5 col-sm-5">
					<div class="p-5">
						<h2 class="display-4">Let there be rock!</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Quod aliquid, mollitia odio veniam sit iste esse assumenda amet
							aperiam exercitationem, ea animi blanditiis recusandae! Ratione
							voluptatum molestiae adipisci, beatae obcaecati.</p>
					</div>
				</div>
			</div>
		</div>

<br>
<br>
<br>

<c:import url="/WEB-INF/views/common/inquire.jsp"/>
<c:import url="/WEB-INF/views/common/_footer.jsp" />



