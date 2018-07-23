<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-122666585-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-122666585-1');
</script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>LAR : ${param.pageTitle}</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- Bootstrap Core CSS -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom Fonts -->
	<link href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
	<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

	<!-- Theme CSS -->
	<link href="${pageContext.request.contextPath}/resources/css/agency.min.css" rel="stylesheet">
	    
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lar.css" />
	<script src="${pageContext.request.contextPath}/resources/js/lar.js"></script>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/megadrop.css" />    
	<style>
		.navbar-default .navbar-nav>.open>a,
		.navbar-default .navbar-nav>.open>a:hover {
			color: tomato;
			background-color: #4C0B5;
		}
	</style>
</head>
<body>

	<script>
		console.log("${session_user}");
	</script>

	<!-- Navigation -->
	<nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#nav-collapse-menu">
					<span class="sr-only">Toggle navigation</span> <i class="fa fa-bars"></i> Menu 
				</button>
				<a class="navbar-brand" href="/lar"><i>Learn And Run</i></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="nav-collapse-menu" style="overflow:hiddne; max-height:380px;">
				<ul class="nav navbar-nav navbar-right">
					<li>
						<a href="/lar/lecture/recommanded">추천 강좌</a>
					</li>
					<li class="dropdown mega-dropdown">
						<a class="dropdown-toggle" id="lecture-dropdown" data-toggle="dropdown" role="button">분류별 <span class="caret"></span></a>
						<ul class="dropdown-menu mobile-dropdown" aria-labelledby="lecture-dropdown"">
							<li><a>Web</a></li>
							<li><a>Android</a></li>
							<li><a>Database</a></li>
						</ul>
						<div class="container-3 mega-dropdownmenu">
							<div class="col1" style="border-right:1px solid #222;">
								<ul>
									<li><h3><a>Web</a></h3></li>
									<li><a href="#">Tomatoes</a></li>
									<li><a href="#">Squash</a></li>
									<li><a href="#">Zucchini</a></li>
									<li><a href="#">Cucumbers</a></li>
									<li><a href="#">Green Beans</a></li>
									<li><a href="#">Lima Beans</a></li>
								</ul>
							</div>
							<div class="col1" style="border-right:1px solid #222;">
								<ul>
									<li><h3><a>Android</a></h3></li>
									<li><a href="#">Apples</a></li>
									<li><a href="#">Blueberries</a></li>
									<li><a href="#">Cranberries</a></li>
									<li><a href="#">Raspberries</a></li>
									<li><a href="#">Strawberries</a></li>
								</ul>
							</div>
							<div class="col1">								
								<ul>
									<li><h3><a>Database</a></h3></li>
									<li><a href="#">Apples</a></li>
									<li><a href="#">Blueberries</a></li>
									<li><a href="#">Cranberries</a></li>
									<li><a href="#">Raspberries</a></li>
									<li><a href="#">Strawberries</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li>
						<a class="lectureRegist" href="/lar/lecture/regist">강의등록 신청</a>
					</li>
					<li>
						<a href="/lar/commu/commuMain">커뮤니티</a>
					</li>
					<c:if test="${empty session_user}">
					<li>
						<a id="nav-signin" data-toggle="modal" data-target=".dynamicModal" onclick="getModal('signin');"><span class="glyphicon glyphicon-user"></span> Sign In</a>
					</li>
					</c:if>
					<c:if test="${!empty session_user}">
					<li class="dropdown">
						<a class="dropdown-toggle" role="button" id="user-btn" data-toggle="dropdown" style="color:#ffe484;" aria-haspopup="true" aria-expanded="true"><span class="glyphicon glyphicon-education"></span> ${session_user.user_nickname} <span class="caret"></span></a>
						<ul class="dropdown-menu" aria-labelledby="user-btn">
							<li><a href="/lar/mypage" style="color:black;"><span class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
							<li><a href="/lar/user/cart" style="color:black;"><span class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a></li>
							<li><a href="/lar/user/signout" style="color:black;"><span class="glyphicon glyphicon-log-out"></span> 접속해제</a></li>
						</ul>
					</li>
					</c:if>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	
	<div class="wrapper">
		<header>