<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>CHART</title>
		<style>
		body{
			margin-top: 30px;
			margin-left:40px;
		}

		</style>
		
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>		
	<script src="http://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/highcharts-more.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	
	<%-- 2019최다 판매 그래프 --%>
	<script type="text/javascript">
        $(function () {
                var processed_json = new Array();   
                $.getJSON('/chart/chart_mostSelllingProducts_201907.do', function(data) {
                    // Populate series
                    for (i = 0; i <data.length; i++){
                        processed_json.push([data[i].product_name, data[i].buy_count]);
                    }
                 
                    // draw chart
                    $('#container1').highcharts({
                    chart: {
                        type: "column"
                    },
                    title: {
                        text: "2019년 최다 판매 상품 TOP 5"
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
                            text: "총 판매개수"
                        }
                    },
                    series: [{
	                    name: '제품명',
                        data: processed_json
                    }]
                }); 
            });
        });
    </script>
    
    <%-- 2019카테고리별 판매 수량 --%>
    <script type="text/javascript">
    $(function () {
        var processed_json = new Array();   
        $.getJSON('/chart/chart_sellingProductsByCategory_201907', function(data) {
            for (i = 0; i <data.length; i++){
                processed_json.push([data[i].product_category1, data[i].buy_count]);
            }
         
            $('#container2').highcharts({
            	chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45
                    }
                },
                title: {
                    text: "2019년 카테고리별 판매 수량"
                },
                plotOptions: {
                    pie: {
                        innerSize: 100,
                        depth: 45
                    }
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
                        text: "총 판매개수"
                    }
                },
                series: [{
                    name: '판매개수',
                    data: processed_json
                }]
            }); 
        });
    });
    </script>
    
    
 <%-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --%> 
 
    <script type="text/javascript">


    $(function () {
        var processed_json = new Array();   
        $.getJSON('/chart/chart_mostLikedProducts', function(data) {
            for (i = 0; i <data.length; i++){
                processed_json.push([data[i].product_name, data[i].product_count]);                
            }
         
            $('#container3').highcharts({
            	chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45
                    }
                },
                title: {
                    text: "Zzim King Top.5"
                },
                plotOptions: {
                    pie: {
                        innerSize: 100,
                        depth: 45
                    }
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
                        text: "총 판매개수"
                    }
                },
                series: [{
                    name: '♥ :',
                    data: processed_json
                }]
            }); 
        });
    });
   
    </script>
</head>
<body>
 	<%-- 2019최다 판매 제품 --%>
   	<div style="width: 800px; margin: 2em auto; padding: 1em; border: 1px solid red; border-radius: 0.5em">
		2019년 최다 판매 제품 top 5
	</div>
    <div id="container1" style="height: 400px">
    </div>
    
    
    <%-- 2019카테고리별 판매 수량 --%>
   	<div style="width: 800px; margin: 2em auto; padding: 1em; border: 1px solid red; border-radius: 0.5em">
		2019카테고리별 판매 수량 ㅌㅊ
	</div>
    <div id="container2" style="height: 400px">
    </div>
    
    <%-- 가장 많이 찜한 상품 --%>
   	<div style="width: 800px; margin: 2em auto; padding: 1em; border: 1px solid red; border-radius: 0.5em">
		가장 많이 찜한 상품
	</div>
    <div id="container3" style="height: 400px">
    </div>

</body>
</html>