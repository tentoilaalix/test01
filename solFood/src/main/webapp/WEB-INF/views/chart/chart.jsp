<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>CHART</title>
    
    
<style>

body{
  margin-top: 100px;
  font-family: 'Trebuchet MS', serif;
  line-height: 1.6
}
.container{
  width: 1000px;
  margin: 0 auto;
}
 
 
#chart_title{
	  width: 800px;
	  margin: 2em auto; 
	  padding: 1em;
	  border: 1px solid red; 
	  border-radius: 0.5em;
	  align: center;	
	
}
ul.tabs{
  margin: 0px;
  padding: 0px;
  list-style: none;
}
ul.tabs li{
  background: none;
  color: #222;
  display: inline-block;
  padding: 10px 15px;
  cursor: pointer;
}
 
ul.tabs li.current{
  background: #ededed;
  color: #222;
}
 
.tab-content{
  display: none;
  background: #ededed;
  padding: 15px;
}
 
.tab-content.current{
  display: inherit;
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
                    text: "찜 Top.5"
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


<!-- ■■■■■■■■■■■ 탭 메뉴 시작 ■■■■■■■■■■■ -->
 <div class="container">
 
  <ul class="tabs">
    <li class="tab-link current" data-tab="tab-1">최다 판매 상품</li>
    <li class="tab-link" data-tab="tab-2">카테고리별 </li>
    <li class="tab-link" data-tab="tab-3">찜찜찜</li>
  </ul>
 
 
 <!--  ■■■■■■■■■ 1번탭 메뉴 ■■■■■■■■■ -->
  <div id="tab-1" class="tab-content current">
  
  <%-- 2019최다 판매 제품 --%>
   	<div id="chart_title">
		<p>2019년 최다 판매 제품 top 5</p>
	</div>
    <div id="container1" style="height: 400px">
    </div>
    
  </div>
  
  <!--  ■■■■■■■■■ 2번탭 메뉴 ■■■■■■■■■ -->
  <div id="tab-2" class="tab-content">
   <%-- 2019카테고리별 판매 수량 --%>
	<div id="chart_title">
		<p>2019카테고리별 판매 수량</p>
	</div>
    <div id="container2" style="height: 400px">
    </div>
  </div>
  
  <!--  ■■■■■■■■■ 3번탭 메뉴 ■■■■■■■■■ -->
  <div id="tab-3" class="tab-content">
  <%-- 가장 많이 찜한 상품 --%>
   	<div id="chart_title">
		<p>가장 많이 찜한 상품</p>
	</div>
    <div id="container3" style="height: 400px">
    </div>
  </div>
 
</div>


 	
    
    
   
    
    


<%-- 텝 메뉴 --%>
<script>

$(document).ready(function(){
	   
	  $('ul.tabs li').click(function(){
	    var tab_id = $(this).attr('data-tab');
	 
	    $('ul.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');
	 
	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	  })
	 
	})
	
</script>
</body>
</html>