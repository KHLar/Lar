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
	google.charts.setOnLoadCallback(drawVisualization);

	function drawVisualization() {
		var data = new google.visualization.DataTable();

		data.addColumn('string', 'years');
		data.addColumn('number', 'value');
		data.addRows([['2014', 22], ['2015', 23]]);

		var options = {
			title: 'Company Performance',
			width: 400,
			height: 300,
			curveType: 'function',
			legend: { position: 'bottom' }
		};

		var chart = new google.visualization.LineChart(document.getElementById('users-weekly-chart'));

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
			<td><div id="users-weekly-chart"></div></td>
			<td><div id="users-monthly-chart"></div></td>
		</tr>
		<tr>
			<td><div id="purchase-daily-chart"></div></td>
			<td><div id="purchase-weekly-chart"></div></td>
			<td><div id="purchase-monthly-chart"></div></td>
		</tr>
		<tr>
			<td><div id="lectures-daily-chart"></div></td>
			<td><div id="lectures-weekly-chart"></div></td>
			<td><div id="lectures-monthly-chart"></div></td>
		</tr>
	</table>
	
</div>

<c:import url="/WEB-INF/views/admin/common/_footer.jsp">
</c:import>