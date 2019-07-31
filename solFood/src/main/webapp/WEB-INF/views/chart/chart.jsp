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
	<script src="../resources/js/jquery-3.3.1.min.js"></script>
	<style>
		#container {
			min-width: 310px;
			max-width: 800px;
			height: 400px;
			margin: 0 auto
		}
	</style>
</head>
<body>
	<div id="container">
	<h2>hi</h2>
	
	<script type="text/javascript">
	// chartController에서 productList 받아오는 script
		$.ajax({
			type: "get",
			url: "/chart/chart_mostSelllingProducts_201907.do",
			data: json,
			success: function(data){
				for(var i=0; i<data.length; i++){
					
				}
			},
			error: function(){
			}
		});
	</script>
		
	<script>
	// highChart script 
	Highcharts.chart('container', {
	    chart: {
	        type: 'column'
	    },
	    title: {
	        text: '2019년 최다 판매 상품'
	    },
	    subtitle: {
	        text: ''
	    },
	    xAxis: {
	        type: 'category',
	        labels: {
	            rotation: -45,
	            style: {
	                fontSize: '13px',
	                fontFamily: 'Verdana, sans-serif'
	            }
	        }
	    },
	    yAxis: {
	        min: 0,
	        title: {
	            text: '판매량'
	        }
	    },
	    legend: {
	        enabled: false
	    },
	    tooltip: {
	        pointFormat: '판매량: <b>{point.y:.1f} </b>'
	    },
	    series: [{
	        name: '판매량',
	        data: [
				
		        
	            ['Shanghai', ${product}],
	            ['Beijing', 20.8],
	            ['Karachi', 14.9],
	            ['Shenzhen', 13.7],
	            ['Guangzhou', 13.1],
	            ['Istanbul', 12.7],
	            ['Mumbai', 12.4],
	            ['Moscow', 12.2],
	            ['São Paulo', 12.0],
	            ['Delhi', 11.7],
	            ['Kinshasa', 11.5],
	            ['Tianjin', 11.2],
	            ['Lahore', 11.1],
	            ['Jakarta', 10.6],
	            ['Dongguan', 10.6],
	            ['Lagos', 10.6],
	            ['Bengaluru', 10.3],
	            ['Seoul', 9.8],
	            ['Foshan', 9.3],
	            ['Tokyo', 9.3]
	        ],
	        dataLabels: {
	            enabled: true,
	            rotation: -90,
	            color: '#FFFFFF',
	            align: 'right',
	            format: '{point.y:.1f}', // one decimal
	            y: 10, // 10 pixels down from the top
	            style: {
	                fontSize: '13px',
	                fontFamily: 'Verdana, sans-serif'
	            }
	        }
	    }]
	});
	</script>
	</div>
	
	<%-- <c:forEach items="${productList}" var= "product">
		<c:set var="" value="">
	</c:forEach> --%>
	
</body>
</html>