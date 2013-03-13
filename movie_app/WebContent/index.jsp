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
<% /*
<c:forEach var="s" items="${list}">
	<p><c:out value = "${s}"/></p>
</c:forEach>
*/ %>
    <script>
        /* reads in tsv file, now called by var data */
		d3.tsv("data.tsv", function(error, data) {
          data.forEach(function(d) {
            d.name = d.movietitle;
            d.number = +d.minutes;
          });
         
	 /* defines chart
	  * chart has a fixed height which the y-values are scaled to,
	  * width is based on number of values in tsv
	  */
	 var chart = d3.select("body").append("svg")
        .attr("class", "chart")
        .attr("height", 600)
        .attr("width", 50 + 20 * data.length)
        .append("g")
        .attr("transform", "translate(0, 10)");
        
         /* creats a function y() to dynamically scale numbers to fit graph */
	 var y = d3.scale.linear()
        .domain([0, d3.max(data.map(function(d){return d.number;}))])
        .range([0, 420]);
        
	 /* creates bars */
	 chart.selectAll(".bar")
	   .data(data)
	 .enter().append("rect")
	   .attr("class", "bar")
	   .attr("x", function(d, i) { return i * 20 + 50; })
	   .attr("y", function(d){return 420 - y(d.number);})
	   .attr("height", function(d){return y(d.number);})
	   .attr("width", 20);
        
         /* creates labels for x axis */
         chart.selectAll("text")
	   .data(data)
	 .enter().append("text")
	   .attr("y", function(d, i) { return i * 20 + 62; })
	   .attr("x", -600)
	   .attr("transform", "rotate(-90)")
	   .attr("dx", 170)
	   .style("text-anchor", "end")
	   .text(function(d){return d.name;});
	   
	 /* creates y-axis marks and ticks */ 
	 chart.selectAll(".rule")
	   .data(y.ticks(10))
	 .enter().append("text")
	   .attr("class", "rule")
	   .attr("y", (function(d){return y(d) + 12;}))
	   .attr("x", 0)
	   .attr("dx", 50)
	   .attr("dy", -8)
	   .attr("text-anchor", "end")
	   .text(function(d){return (420/y(1) - d).toPrecision(4) + " -";});
	   
	 /* creates line for y-axis */     
	 chart.append("line")
	   .attr("x1", 50)
	   .attr("x2", 50)
	   .attr("y1", 0)
	   .attr("y2", 420)
	   .style("stroke", "#000");
	  
});        
    </script>
</body>
</html>