<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/admin/common/_header.jsp">
	<c:param value="Charts" name="pageTitle" />
</c:import>

<script type="text/javascript">
	google.charts.load("current", {packages:['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawYearlySignupChart);
	google.charts.setOnLoadCallback(drawYearlyPurchaseCountChart);
	google.charts.setOnLoadCallback(drawYearlyPurchaseAmountChart);
	google.charts.setOnLoadCallback(drawYearlyCommuChart);
	google.charts.setOnLoadCallback(drawYearlyCommuReplyChart);
	
	function drawYearlySignupChart() {
		var jsonData = JSON.parse($.ajax({
			url: '/lar/admin/charts/signup/yearly',
			dataType: 'json',
			async: false
		}).responseText);
		
		console.log(jsonData);
		
		var data = new google.visualization.DataTable();
		
		data.addColumn('string', 'Month');
		data.addColumn('number', 'Value');
		
		for(var i=0; i<jsonData.length; i++) {
			data.addRow(jsonData[i]);
		}
		
		var options = {
			title: '누적 회원 가입 수 변화',
			width: 400,
			height: 300,
			curveType: 'function',
			legend: { position: 'bottom' }
		};

		var chart = new google.visualization.LineChart(document.getElementById('YearlySignupChart'));

		chart.draw(data, options);
	}
	
	function drawYearlyPurchaseCountChart() {
		var jsonData = JSON.parse($.ajax({
			url: '/lar/admin/charts/purchase/yearly',
			dataType: 'json',
			data: {
				type: 'count'
			},
			async: false
		}).responseText);
		
		console.log(jsonData);
		
		var data = new google.visualization.DataTable();
		
		data.addColumn('string', 'Month');
		data.addColumn('number', 'Value');
		
		for(var i=0; i<jsonData.length; i++) {
			data.addRow(jsonData[i]);
		}
		
		var options = {
			title: '누적 결제 건 수 변화',
			width: 400,
			height: 300,
			curveType: 'function',
			legend: { position: 'bottom' }
		};

		var chart = new google.visualization.LineChart(document.getElementById('YearlyPurchaseCountChart'));

		chart.draw(data, options);
	}
	
	function drawYearlyPurchaseAmountChart() {
		var jsonData = JSON.parse($.ajax({
			url: '/lar/admin/charts/purchase/yearly',
			data: {
				type: 'amount'
			},
			dataType: 'json',
			async: false
		}).responseText);
		
		console.log(jsonData);
		
		var data = new google.visualization.DataTable();
		
		data.addColumn('string', 'Month');
		data.addColumn('number', 'Value');
		
		for(var i=0; i<jsonData.length; i++) {
			data.addRow(jsonData[i]);
		}
		
		var options = {
			title: '누적 결제 총 액 변화',
			width: 400,
			height: 300,
			curveType: 'function',
			legend: { position: 'bottom' }
		};

		var chart = new google.visualization.LineChart(document.getElementById('YearlyPurchaseAmountChart'));

		chart.draw(data, options);
	}
	
	function drawYearlyCommuChart() {
		var jsonData = JSON.parse($.ajax({
			url: '/lar/admin/charts/commu/yearly',
			dataType: 'json',
			async: false
		}).responseText);
		
		console.log(jsonData);
		
		var data = new google.visualization.DataTable();
		
		data.addColumn('string', 'Month');
		data.addColumn('number', 'Value');
		
		for(var i=0; i<jsonData.length; i++) {
			data.addRow(jsonData[i]);
		}
		
		var options = {
			title: '누적 글 작성 수 변화',
			width: 400,
			height: 300,
			curveType: 'function',
			legend: { position: 'bottom' }
		};

		var chart = new google.visualization.LineChart(document.getElementById('YearlyCommuChart'));

		chart.draw(data, options);
	}
	function drawYearlyCommuReplyChart() {
		var jsonData = JSON.parse($.ajax({
			url: '/lar/admin/charts/commuReply/yearly',
			dataType: 'json',
			async: false
		}).responseText);
		
		console.log(jsonData);
		
		var data = new google.visualization.DataTable();
		
		data.addColumn('string', 'Month');
		data.addColumn('number', 'Value');
		
		for(var i=0; i<jsonData.length; i++) {
			data.addRow(jsonData[i]);
		}
		
		var options = {
			title: '누적 댓글 작성 수 변화',
			width: 400,
			height: 300,
			curveType: 'function',
			legend: { position: 'bottom' }
		};

		var chart = new google.visualization.LineChart(document.getElementById('YearlyCommuReplyChart'));

		chart.draw(data, options);
	}
</script>

<div class="col-lg-12">
	<div class="row">
		<h1 class="page-header">
			Charts
		</h1>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-bar-chart"></i> Charts</li>
		</ol>
	</div>

	<table>
		<tr>
			<td><div id="YearlySignupChart"></div></td>
		</tr>
		<tr>
			<td>
				<div id="YearlyPurchaseCountChart"></div>
			</td>
			<td>
				<div id="YearlyPurchaseAmountChart"></div>
			</td>
		</tr>
		<tr>
			<td><div id="YearlyCommuChart"></div></td>
			<td><div id="YearlyCommuReplyChart"></div></td>
		</tr>
	</table>
	
</div>

<c:import url="/WEB-INF/views/admin/common/_footer.jsp">
</c:import>