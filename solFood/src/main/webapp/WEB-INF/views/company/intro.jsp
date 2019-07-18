<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SolFood소개</title>


	<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/css/default.css" rel="stylesheet" type="text/css">
	<link href="resources/css/subpage.css" rel="stylesheet" type="text/css">
	<!-- services 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be4510b5ceacfed090ef51cbd4b0466f&libraries=services"></script>
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be4510b5ceacfed090ef51cbd4b0466f&libraries=services,clusterer,drawing"></script>
	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	
	
	<style type="text/css">
		a { text-decoration: none;}
 		a:link { color: black; text-decoration: none !important;}
 		a:active { color: black !important; text-decoration: none !important;}
		a:visited { color: black !important; text-decoration: none !important;}
 		a:hover { color: black !important; text-decoration: none !important;}
 		.intro-text{ color: gray!important; text-decoration: none !important;}
 		
 		.sidebar{	font-size: 20px;  }
 		.sub-menu-li{ margin: 10px;}
	</style>
	
	

	
</head>
<body>
<jsp:include page="../module/Top.jsp" flush="false"/>
<br><br><br><br>
<div class ="container">

<img src="resources/image/intro4.png" style="max-width:100%;">
<br>
<p align="center" style="font-size:50px;">SolFood</p>
<br>
<p class="intro-text" align="center" Style="font-size:19px;">
"<br>
이 세상에는 참 다양한 푸드마켓이 있습니다.<br>
하지만 우리와 꼭 맞는 마음을 가진 푸드마켓을 찾기란 쉽지 않았습니다.<br>
‘그렇다면 우리가 직접 만들어보면 어떨까?’ <br>
2015년 'SolFood'는 그렇게 시작되었습니다.<br>
"

<br>
<br>
<br>
<img src="resources/image/intro2.jpg" style="max-width:100%;">
<br>
<br>
<br>
"<br>
맛있는 음식이 삶의 가장 큰 즐거움이라 믿는 사람들이 뜻을 합쳤죠.<br>
Solfood의 팀원들은 이미 팀을 꾸리기 전부터 좋은 재료를 위해서라면 해외 직구, 백화점, 동네 마트, 재래 시장,<br>
 더 나아가 전국 방방곡곡의 산지를 찾아 다니며 품질과 가격을 비교하던 깐깐한 소비자였습니다.<br>
이렇게 찾아낸 훌륭한 생산자와 최상의 먹거리들을 나와 내 가족만 알고 있기에는 너무 아쉬웠습니다. <br>
"

<br>
<br>
<br>
<img src="resources/image/intro1.jpg" style="max-width:100%;">
<br>
<br>
<br>
"<br>
비싼 식자재만이 좋은 음식일 것이라고 막연하게 생각하고 있는<br>
 소비자에게는 진짜 맛을 소개해드리고 싶었고,<br>
뚝심 하나로 산골 오지에서 수십 년간 묵묵히 장을 담그는 명인, <br>
시들어서 버릴지언정 무농약을 고집하는 농부에게는 안정적인 판매 활로를 찾아드리고 싶었습니다.<br>
생산자와 소비자, 판매자까지 모두 행복하고 맛있는 삶을 살 수 있도록<br>
 Solfood는 오늘도 열심히 발로 뛰며 고민합니다.<br>
 "</p>

<br>
<br>
<br>







<h2>찾아오시는 길</h2><br>
<div id="map" style="width:900px;height:500px;" align="center"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e26a97d51b2b2fd2fe9efb58f595c75a"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(37.569473, 126.986126), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption);

// 마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(37.569473, 126.986126); 

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;"> SolFood <br><a href="http://map.daum.net/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new daum.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
</script>

<p>코리아IT아카데미  서울특별시 강남구 테헤란로 146 현익빌딩 4층 (신한은행건물)<br>연락처: 02-6901-7001</p>
	
	
	</div>
	

	



		
		



	
	



<jsp:include page="../module/Bottom.jsp" flush="false"/>

</body>
</html>