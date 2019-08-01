<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>Highcharts data from JSON Response</title>
		<style>
		body{
			margin-top: 30px;
			margin-left:40px;
		}
		</style>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>		
	<script src="http://code.highcharts.com/highcharts.js"></script>
	<script type="text/javascript">
        $(function () {
                var processed_json = new Array();   
                $.getJSON('/chart/chart_mostSelllingProducts_201907.do', function(data) {
                    // Populate series
                    for (i = 0; i <data.length; i++){
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
                            text: "Scores"
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
		2019년 최다 판매 제품 top 5
	</div>
    <div id="container" style="height: 400px"></div>
    
</body>
</html>