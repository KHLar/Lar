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
    	<div class="col-lg-10 col-md-10 col-sm-10" style="padding-right: 8px">
    		<div class="orderby_recomand" style="padding-bottom: 50px">
    			<h4>추천 순</h4>
    			<div class="row">
   				<c:forEach var="i" begin="1" end="6" step="1">
					<div class="container col-xs-12 col-sm-6 col-md-4 col-lg-3" style="padding: 3px; width:170px;">
						<div style="float: left; margin-right:3px">
							<small>${ i }</small>
						</div>
						<div class="thumbnail container-fluid" style="height:190px; width:140px; float:left">
							<img src="https://img.youtube.com/vi/_yj_D-pIO40/sddefault.jpg">
							<div class="caption">
								<small>Thumbnail label</small>
								<p>
									<a id="thumb-cart" class="pull-right"><span class="glyphicon glyphicon-shopping-cart"></span></a>&nbsp;&nbsp;&nbsp;
									<a id="thumb-hart" class="pull-right"><span class=" glyphicon glyphicon-heart"></span></a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>	
    		</div>
    		<div class="orderby_date" style="border-top:1px solid lightgray; padding-top: 40px; margin-bottom: 50px">
    			<h4>최신 순</h4>
    			<div class="row">
   				<c:forEach items="recomandedList" var="l">
   					<c:set value="1" var="i"/>
					<div class="container col-xs-12 col-sm-6 col-md-4 col-lg-3" style="padding: 3px; width:170px;">
						<div style="float: left; margin-right:3px">
							<small>${ i }</small>
						</div>
						<div class="thumbnail container-fluid" style="height:190px; width:140px; float:left">
							<img src="${l}">
							<div class="caption">
								<small>${latest.lecture_title}</small>
								<p>
									<a id="thumb-cart" class="pull-right"><span class="glyphicon glyphicon-shopping-cart"></span></a>&nbsp;&nbsp;&nbsp;
									<a id="thumb-hart" class="pull-right"><span class=" glyphicon glyphicon-heart"></span></a>
								</p>
							</div>
						</div>
					</div>
					<c:set value="${i}+1" var="i"/>
				</c:forEach>
				</div>	
    		</div>
    		<div class="orderby_review" style="border-top:1px solid lightgray; padding-top: 40px; margin-bottom: 50px">
    			<h4>후기 순</h4>
   				<div class="row">
   				<c:forEach var="i" begin="1" end="6" step="1">
					<div class="container col-xs-12 col-sm-6 col-md-4 col-lg-3" style="padding: 3px; width:170px;">
						<div style="float: left; margin-right:3px">
							<small>${ i }</small>
						</div>
						<div class="thumbnail container-fluid" style="height:190px; width:140px; float:left">
							<img src="http://placehold.it/250x250/EEE">
							<div class="caption">
								<small>Thumbnail label</small>
								<p>
									<a id="thumb-cart" class="pull-right"><span class="glyphicon glyphicon-shopping-cart"></span></a>&nbsp;&nbsp;&nbsp;
									<a id="thumb-hart" class="pull-right"><span class=" glyphicon glyphicon-heart"></span></a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>	
    		</div>
    		<div class="orderby_score" style="border-top:1px solid lightgray; padding-top: 40px; margin-bottom: 50px">
    			<h4>별점 순</h4>	
    			<div class="row">
   				<c:forEach var="i" begin="1" end="6" step="1">
					<div class="container col-xs-12 col-sm-6 col-md-4 col-lg-3" style="padding: 3px; width:170px;">
						<div style="float: left; margin-right:3px">
							<small>${ i }</small>
						</div>
						<div class="thumbnail container-fluid" style="height:190px; width:140px; float:left">
							<img src="http://placehold.it/250x250/EEE">
							<div class="caption">
								<small>Thumbnail label</small>
								<p>
									<a id="thumb-cart" class="pull-right"><span class="glyphicon glyphicon-shopping-cart"></span></a>&nbsp;&nbsp;&nbsp;
									<a id="thumb-hart" class="pull-right"><span class=" glyphicon glyphicon-heart"></span></a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
    		</div>
    		<div class="orderby_students" style="border-top:1px solid lightgray; padding-top: 40px; margin-bottom: 50px">
    			<h4>인기 순</h4>
    			<div class="row">
   				<c:forEach var="i" begin="1" end="6" step="1">
					<div class="container col-xs-12 col-sm-6 col-md-4 col-lg-3" style="padding: 3px; width:170px;">
						<div style="float: left; margin-right:3px">
							<small>${ i }</small>
						</div>
						<div class="thumbnail container-fluid" style="height:190px; width:140px; float:left">
							<img src="http://placehold.it/250x250/EEE">
							<div class="caption">
								<small>Thumbnail label</small>
								<p>
									<a id="thumb-cart" class="pull-right"><span class="glyphicon glyphicon-shopping-cart"></span></a>&nbsp;&nbsp;&nbsp;
									<a id="thumb-hart" class="pull-right"><span class=" glyphicon glyphicon-heart"></span></a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
    		</div>    				
		</div>
<c:import url="/WEB-INF/views/common/_footer.jsp"/>