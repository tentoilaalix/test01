<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>chart</title>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/series-label.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<link href="../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

	<style>
		#container {
			min-width: 310px;
			max-width: 800px;
			height: 400px;
			margin: 0 auto
		}
	</style>
	
	<script>
		$(function () {
	        var processed_json = new Array();   
	        $.getJSON('/chart/chart_mostSelllingProducts_201907.do', function(data) {
	            for (i= 0; i <data.length; i++){
	                processed_json.push([data[i].product_name, data[i].buy_count]);
	            }
	         
	            // draw chart
	            $('#container').highcharts({
	            chart: {
	                type: "column"
	            },
	            title: {
	                text: "2019년 최다 판매량"
	            },
	            xAxis: {
	                type: 'category',
	                allowDecimals: false,
	                title: {
	                    text: ""
	                }
	            },
	            yAxis: {
	                title: {
	                    text: "판매량"
	                }
	            },
	            series: [{
	                name: 'Subjects',
	                data: processed_json
	            }]
	        }); 
	    });
	});
	</script>
</head>
<body>
	<div style="width: 800px; margin: 2em auto; padding: 1em; border: 1px solid red; border-radius: 0.5em">
		Highcharts data load from a JSON using manual JSON Processing
	</div>
    <div id="container" style="height: 400px">
    
    </div>
</body>
</html>