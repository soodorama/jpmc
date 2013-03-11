<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
	.chart rect {
		stroke: white;
		fill: steelblue;
	}
</style>
<script type="text/javascript" src="http://d3js.org/d3.v3.min.js"></script>
<title>Our Site</title>
</head>
<body>
<c:forEach var="s" items="${list}">
	<p><c:out value = "${s}"/></p>
</c:forEach>
<script>
var data = [4, 8, 15, 16, 23, 42];
var chart = d3.select("body").append("svg")
	.attr("class", "chart")
	.attr("height", 420)
	.attr("width", 20 * data.length);
var y = d3.scale.linear()
	.domain([0, d3.max(data)])
	.range([0, 420]);
chart.selectAll(".bar")
	.data(data)
	.enter().append("rect")
	.attr("class", "bar")
	.attr("x", function(d, i) { return i * 20; })
	.attr("y", y)
	.attr("height", 420)
	.attr("width", 20);
</script>
</body>
</html>