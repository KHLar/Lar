<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>LAR : Admin-${param.pageTitle}</title>

		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

		<link href="${pageContext.request.contextPath}/resources/css/lar-admin.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
	</head>
	<body>
		<div id="wrapper">
			<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#admin-nav-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/lar/admin/"><span class="fa fa-fw fa-home"></span> LAR : Admin</a>
				</div>

				<ul class="nav navbar-right top-nav">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
						<ul class="dropdown-menu alert-dropdown">
							<li>
								<a href="#">Alert Name <span class="label label-default">Alert Badge</span></a>
							</li>
							<li>
								<a href="#">Alert Name <span class="label label-primary">Alert Badge</span></a>
							</li>
							<li>
								<a href="#">Alert Name <span class="label label-success">Alert Badge</span></a>
							</li>
							<li>
								<a href="#">Alert Name <span class="label label-info">Alert Badge</span></a>
							</li>
							<li>
								<a href="#">Alert Name <span class="label label-warning">Alert Badge</span></a>
							</li>
							<li>
								<a href="#">Alert Name <span class="label label-danger">Alert Badge</span></a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="#">View All</a>
							</li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> John Smith <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li>
								<a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
							</li>
							<li>
								<a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
							</li>
							<li>
								<a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
							</li>
						</ul>
					</li>
				</ul>

				<div class="collapse navbar-collapse" id="admin-nav-collapse">
					<ul class="nav navbar-nav side-nav">
						<li>
							<a href="/lar/admin/charts"><i class="fa fa-fw fa-bar-chart-o"></i> Charts</a>
						</li>
						<li>
							<a href="/lar/admin/tables"><i class="fa fa-fw fa-table"></i> Tables</a>
						</li>
						<li>
							<a href="/lar/admin/users"><i class="fa fa-fw fa-address-book"></i> Users</a>
						</li>
						<li>
							<a href="/lar/admin/lectures"><i class="fa fa-fw fa-book"></i> Lectures</a>
						</li>
						<li>
							<a data-toggle="collapse" data-target="#commuDropdown"><i class="fa fa-fw fa-globe"></i> Community <i class="fa fa-fw fa-caret-down"></i></a>
							<ul id="commuDropdown" class="collapse">
								<li>
									<a href="/lar/admin/commu/notice">Notice</a>
								</li>
								<li>
									<a href="/lar/admin/commu/board">Board</a>
								</li>
								<li>
									<a href="/lar/admin/commu/qa">Q & A</a>
								</li>
								<li>
									<a href="/lar/admin/commu/info">Info</a>
								</li>
							</ul>
						</li>
					</ul>
				</div> <!-- /.navbar-collapse -->
			</nav>

			<div id="page-wrapper">
				<div class="container-fluid">