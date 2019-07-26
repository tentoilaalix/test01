<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*" %>
<%NumberFormat nf = NumberFormat.getNumberInstance();%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SolFood</title>
	<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="../resources/css/carouselMulti.css" rel="stylesheet">
	<link href="../resources/css/animate.css" rel="stylesheet">
	<link href="../resources/css/wickedcss.min.css" rel="stylesheet">
	<script src="../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="../resources/css/multi.js"></script>
	
	<!-- 상품 뿌리기 ajax -->
	<script>
	$(document).ready(function(){
		product_category1();
	});
	
	function product_category1(){	
		var product_category1= "채소·과일";		
		var json= {"product_category1":product_category1};
		var html= "";
		
			$.ajax({
				type: "post",
				url: "/product/products1_2.do",
				data: json,
				success: function(data){
					for(var i=0; i<4; i++){
						html+= "<div class='col-xs-3'>";
						html+= "<a href='product/productInfo.do?product_id="+ data[i].product_id +"'><img src='/img/"+ data[i].product_image +"'/></a><br><br>";
						html+= "<a href='product/productInfo.do?product_id="+ data[i].product_id +"'><strong>"+ data[i].product_name +"</strong></a><br>";
						html+= data[i].product_price+ "원";
						html+= "</div>";

						$("#productPart").html(html);
					}
				},
				error: function(){
					alert("product_category1 fail");
				}
			});
		}
	</script>
	
	
	<style type="text/css">
		a { text-decoration: none;}
 		a:link { color: black; text-decoration: none !important;}
 		a:active { color: black !important; text-decoration: none !important;}
		a:visited { color: black !important; text-decoration: none !important;}
 		a:hover { color: black !important; text-decoration: none !important;}
	</style>
	<style>
		html{cursor: url(../resources/image/carrot.png), auto}
		body {
		width: 100%;
		font-family: 맑은 고딕;
		font-size: 18px;
		align: center !important;
		}

		#thumb {
			border: 0;
		}
		#eventArea {
			background-color: #EAEAEA;
		}
		
		.recipeHr {
			border: 0;
    		height: 2px;
    		background: #EAEAEA;
		}
	</style>
</head>
<body>

<!--■■■■■■■■■■■■■■■■■■■■■■ Header ■■■■■■■■■■■■■■■■■■■■■■■■222-->

<jsp:include page="module/Top.jsp" flush="false"/>
<br><br>

<!--■■■■■■■■■■■■■■■■■■■■■■ 상단 배너 ■■■■■■■■■■■■■■■■■■■■■■■■-->
	
	<div id="myCarousel" class="carousel slide text-center" data-ride ="carousel">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active" align="center">
				<a href=""><img src="../resources/image/banner1.jpg"></a>
			</div>
			<div class="item" align="center">
				<a href=""><img src="../resources/image/banner2.jpg"></a>
			</div>
			<div class="item" align="center">
				<a href=""><img src="../resources/image/banner3.jpg"></a>
			</div>
		</div>
		<!-- Left and Right Controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		</a>
	</div>
<br><br>

<!--■■■■■■■■■■■■■■■■■■■■■■ 카테고리별 품목들 ■■■■■■■■■■■■■■■■■■■■■■■■-->

<div class="container">
<div align="center"><h2>인기 상품</h2></div><br><br><br>
    <div class="row">
		<div class="col-md-12">
                <div id="Carousel" class="carousel slide">
                <!-- Carousel items -->
                <div class="carousel-inner">
                <div class="item active">
                	<div class="row">
                	 <c:forEach items="${homeProduct}" var="homeProduct" begin="0" end="3">
	                	<div class="col-md-3">
	                		<a href="${path}/product/productInfo.do?product_id=${homeProduct.product_id}" class="thumbnail"><img src="/img/${homeProduct.product_image}" style="max-width:100%;"></a><br>
	                		<a href="${path}/product/productInfo.do?product_id=${homeProduct.product_id}" class="noul"><strong>${homeProduct.product_name}</strong><br><fmt:formatNumber value="${homeProduct.product_price}" pattern="#,###.##"/>원</a>
						</div>
					</c:forEach>
                	</div><!--.row-->
                </div><!--.item-->
                 
                <div class="item">
                	<div class="row">
                	   <c:forEach items="${homeProduct}" var="homeProduct" begin="4" end="7">
	                	<div class="col-md-3">
	                		<a href="${path}/product/productInfo.do?product_id=${homeProduct.product_id}" class="thumbnail"><img src="/img/${homeProduct.product_image}" style="max-width:100%;"></a><br>
	                		<a href="${path}/product/productInfo.do?product_id=${homeProduct.product_id}" class="noul"><strong>${homeProduct.product_name}</strong><br><fmt:formatNumber value="${homeProduct.product_price}" pattern="#,###.##"/>원</a>
						</div>
					</c:forEach>
                	</div><!--.row-->
                </div><!--.item-->
                </div><!--.carousel-inner-->
                <a data-slide="prev" href="#Carousel" class="left slide-control"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
                <a data-slide="next" href="#Carousel" class="right slide-control"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>
                </div><!--.Carousel-->
		</div>
	</div>
</div><!--.container-->

<br><br><br><br>

<div class="container" id="eventArea">
	<div class="col-md-12"><br><br>
		<div align="center"><h1><a href="#">이벤트</a></h1></div>
		<br><br><br>
<div class="col-md-12" align="center">
	<div class="row">
	<div class="col-md-4">
  	<figure class="snip1132">
 		 <img src="../resources/image/event1.jpg" alt="sample22" />
  	<figcaption>
    	<div class="heading">
      		<h3><span>한식 레스토랑</span></h3>
    	</div>
    	<div class="caption">
      		<p><strong>불고기·국물요리 최대 15% 할인</strong></p>
    	</div>
  	</figcaption>
  		<a href="#"></a>
	</figure>
	</div>
	<div class="col-md-4">
  	<figure class="snip1132">
 		 <img src="../resources/image/event2.jpg" alt="sample22" />
  	<figcaption>
    	<div class="heading">
      		<h3><span>정직·신뢰 제품</span></h3>
    	</div>
    	<div class="caption">
      		<p><strong>서강유업 최대 20% 할인</strong></p>
    	</div>
  	</figcaption>
  		<a href="#"></a>
	</figure>
	</div>
	<div class="col-md-4">
  	<figure class="snip1132">
 		 <img src="../resources/image/event3.jpg" alt="sample22" />
  	<figcaption>
    	<div class="heading">
      		<h3><span>삼진어묵 특가전</span></h3>
    	</div>
    	<div class="caption">
      		<p><strong>어묵 5% 할인 & GIFT</strong></p>
    	</div>
  	</figcaption>
  		<a href="#"></a>
	</figure>
	</div>
	</div><%-- div row --%><br><br><br>
	<div class="row">
	<div class="col-md-4">
  	<figure class="snip1132">
 		 <img src="../resources/image/event4.jpg" alt="sample22" />
  	<figcaption>
    	<div class="heading">
      		<h3><span>따끈따끈 브레드</span></h3>
    	</div>
    	<div class="caption">
      		<p><strong>바게트·식빵 최대 30% 할인</strong></p>
    	</div>
  	</figcaption>
  		<a href="#"></a>
	</figure>
	</div>
	<div class="col-md-4">
  	<figure class="snip1132">
 		 <img src="../resources/image/event5.jpg" alt="sample22" />
  	<figcaption>
    	<div class="heading">
      		<h3><span>다이어트의 계절</span></h3>
    	</div>
    	<div class="caption">
      		<p><strong>샐러드·다이어트 식품 30% 할인</strong></p>
    	</div>
  	</figcaption>
  		<a href="#"></a>
	</figure>
	</div>
	<div class="col-md-4">
  	<figure class="snip1132">
 		 <img src="../resources/image/event6.jpg" alt="sample22" />
  	<figcaption>
    	<div class="heading">
      		<h3><span>프리미엄 요거트</span></h3>
    	</div>
    	<div class="caption">
      		<p><strong>요거트·유산균 음료 15% 할인</strong></p>
    	</div>
  	</figcaption>
  		<a href="#"></a>
	</figure>
	</div>
	</div><%-- div row --%><br><br><br>
</div>
</div>
</div>
<br><br><br><br>
<%--■■■■■■■■■■■■■■■■■■■■■■ MD추천 ■■■■■■■■■■■■■■■■■■■■■■■■■--%>
<div class="container">
<div align="center"><h2>MD 추천</h2></div>
<br>
<div align="center"><h5>오늘의 MD 추천 상품은 무엇일까요 ?</h5></div>
<hr class="recipeHr">
<br><br>
<div class="container" align="center">
	<button type="button" class="bttn-fill cate1">채소</button>&nbsp;&nbsp;
	<button type="button" class="bttn-fill cate2">수산·해산</button>&nbsp;&nbsp;
	<button type="button" class="bttn-fill cate3">정육·계란</button>&nbsp;&nbsp;
	<button type="button" class="bttn-fill cate4">국·반찬·요리</button>&nbsp;&nbsp;
	<button type="button" class="bttn-fill cate5">샐러드·간편식</button>&nbsp;&nbsp;
	<button type="button" class="bttn-fill cate6">면·양념·오일</button>&nbsp;&nbsp;
	<button type="button" class="bttn-fill cate7">음료·우유·간식</button>&nbsp;&nbsp;
	<button type="button" class="bttn-fill cate8">베이커리·델리</button>&nbsp;&nbsp;
</div>
<br><br><br><br>
<div class="container">
<div class="cate1Form" id="mdArea">
	<div class="row" align="center">
		<div class="col-xs-3">
			<a href="${path}/product/productInfo.do?product_id=1"><img src="../resources/image/cate1-1.png"></a><br><br>
			<a href="${path}/product/productInfo.do?product_id=1"><strong>감자 1kg/봉</strong></a><br>
			<%=nf.format(2850)%>원
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate1-2.png"></a><br><br>
			<a href=""><strong>GAP 오이 2입</strong></a><br>
			<%=nf.format(1270)%>원	
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate1-3.png"></a><br><br>
			<a href=""><strong>밤고구마 800g/봉</strong></a><br>
			<%=nf.format(5900)%>원
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate1-4.png"></a><br><br>
			<a href=""><strong>오이맛 고추</strong></a><br>
			<%=nf.format(990)%>원
		</div>
	</div>
</div>
<div class="cate2Form" id="mdArea">
	<div class="row" align="center">
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate2-1.png"></a><br><br>
			<a href=""><strong>참치회덮밥</strong></a><br>
			<%=nf.format(11000)%>원
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate2-2.png"></a><br><br>
			<a href=""><strong>[Sea to Table] 물회</strong></a><br>
			<%=nf.format(12500)%>원
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate2-3.png"></a><br><br>
			<a href=""><strong>[삼삼해물] 왕 바지락</strong></a><br>
			<%=nf.format(8200)%>원
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate2-4.png"></a><br><br>
			<a href=""><strong>[연어연구소]곤부지메 숙성연어</strong></a><br>
			<%=nf.format(10000)%>원
		</div>
	</div>
</div>
<div class="cate3Form" id="mdArea">
	<div class="row" align="center">
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate3-1.png"></a><br><br>
			<a href=""><strong>[미트클레버]더 건강한 삼겹살</strong></a><br>
			<%=nf.format(16150)%>원
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate3-2.png"></a><br><br>
			<a href=""><strong>[이베리쿡] 이베리코 레드미트</strong></a><br>
			<%=nf.format(13320)%>원
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate3-3.png"></a><br><br>
			<a href=""><strong>[SolFood] 동물복지 유정란</strong></a><br>
			<%=nf.format(4800)%>원
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate3-4.png"></a><br><br>
			<a href=""><strong>[상하농원] 순백색 유정란</strong></a><br>
			<%=nf.format(5200)%>원
		</div>
	</div>
</div>
<div class="cate4Form" id="mdArea">
	<div class="row" align="center">
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate4-1.png"></a><br><br>
			<a href=""><strong>[고봉] 얼큰한 대구탕</strong></a><br>
			<%=nf.format(13800)%>원
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate4-2.png"></a><br><br>
			<a href=""><strong>[올쿡] 불고기 새싹 비빔밥</strong></a><br>
			<%=nf.format(9810)%>원
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate4-3.png"></a><br><br>
			<a href=""><strong>[동트는농가] 곤드레 된장찌개</strong></a><br>
			<%=nf.format(3910)%>원
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate4-4.png"></a><br><br>
			<a href=""><strong>[모노링크] 치즈 등심 돈까스</strong></a><br>
			<%=nf.format(10000)%>원
		</div>
	</div>
</div>
<div class="cate5Form" id="mdArea">
	<div class="row" align="center">
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate5-1.png"></a><br><br>
			<a href=""><strong>미미네 떡볶이</strong></a><br>
			<%=nf.format(4900)%>원
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate5-2.png"></a><br><br>
			<a href=""><strong>[어게인프레쉬] 샐러드 5종</strong></a><br>
			<%=nf.format(5900)%>원
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate5-3.png"></a><br><br>
			<a href=""><strong>[중앙닭강정] 닭강정 3종</strong></a><br>
			<%=nf.format(12900)%>원
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate5-4.png"></a><br><br>
			<a href=""><strong>[진양횟집] 오징어 물회</strong></a><br>
			<%=nf.format(12900)%>원
		</div>
	</div>
</div>
<div class="cate6Form" id="mdArea">
	<div class="row" align="center" id="productPart">
		<%-- <div class="col-xs-3">
			<a href=""><img src="../resources/image/cate6-1.png"></a><br><br>
			<a href=""><strong>[론소니] 베지 파스타 4종</strong></a><br>
			<%=nf.format(3500)%>원
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate6-2.png"></a><br><br>
			<a href=""><strong>[이케지마] 삼색소면 3종</strong></a><br>
			<%=nf.format(2970)%>원
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate6-3.png"></a><br><br>
			<a href=""><strong>[소라치]잇핀 부타동 소스</strong></a><br>
			<%=nf.format(4140)%>원
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate6-4.png"></a><br><br>
			<a href=""><strong>[신영]페페로치노 홀 18g</strong></a><br>
			<%=nf.format(5900)%>원
		</div> --%>
		
		
		
		
	</div>
</div>
<div class="cate7Form" id="mdArea">
	<div class="row" align="center">
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate7-1.png"></a><br><br>
			<a href=""><strong>[우사기] 일본 모찌 4종</strong></a><br>
			<%=nf.format(4900)%>원
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate7-2.png"></a><br><br>
			<a href=""><strong>[굴리베르] 홈메이드 쿠키 3종</strong></a><br>
			<%=nf.format(4900)%>원
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate7-3.png"></a><br><br>
			<a href=""><strong>[연세우유] 1A 가볍다 우유</strong></a><br>
			<%=nf.format(500)%>원
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate7-4.png"></a><br><br>
			<a href=""><strong>[대학두유] 대학약콩</strong></a><br>
			<%=nf.format(20400)%>원
		</div>
	</div>
</div>
<div class="cate8Form" id="mdArea">
	<div class="row" align="center">
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate8-1.png"></a><br><br>
			<a href=""><strong>[아워홈] 치즈앤올리브 식빵</strong></a><br>
			<%=nf.format(4410)%>원
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate8-2.png"></a><br><br>
			<a href=""><strong>[구선아베이커리]빨미까레</strong></a><br>
			<%=nf.format(7000)%>원
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate8-3.png"></a><br><br>
			<a href=""><strong>[구선아베이커리] 새우감자 크로와상</strong></a><br>
			<%=nf.format(4000)%>원
		</div>
		<div class="col-xs-3">
			<a href=""><img src="../resources/image/cate8-4.png"></a><br><br>
			<a href=""><strong>[사층빵집] 마카롱 10종</strong></a><br>
			<%=nf.format(5000)%>원
		</div>
	</div>
</div>
</div>
</div>
<br><br><br>
<script>
$(document).ready(function() {
	$('.cate1').click();
	$('.cate2Form').hide();
	$('.cate3Form').hide();
	$('.cate4Form').hide();
	$('.cate5Form').hide();
	$('.cate6Form').hide();
	$('.cate7Form').hide();
	$('.cate8Form').hide();
	$('.cate1').click(function() {
		$('.cate1Form').fadeIn(1500);
		$('.cate2Form').hide();
		$('.cate3Form').hide();
		$('.cate4Form').hide();
		$('.cate5Form').hide();
		$('.cate6Form').hide();
		$('.cate7Form').hide();
		$('.cate8Form').hide();
	});
	$('.cate2').click(function() {
		$('.cate2Form').fadeIn(1500);
		$('.cate1Form').hide();
		$('.cate3Form').hide();
		$('.cate4Form').hide();
		$('.cate5Form').hide();
		$('.cate6Form').hide();
		$('.cate7Form').hide();
		$('.cate8Form').hide();
	});
	$('.cate3').click(function() {
		$('.cate3Form').fadeIn(1500);
		$('.cate1Form').hide();
		$('.cate2Form').hide();
		$('.cate4Form').hide();
		$('.cate5Form').hide();
		$('.cate6Form').hide();
		$('.cate7Form').hide();
		$('.cate8Form').hide();
	});
	$('.cate4').click(function() {
		$('.cate4Form').fadeIn(1500);
		$('.cate1Form').hide();
		$('.cate2Form').hide();
		$('.cate3Form').hide();
		$('.cate5Form').hide();
		$('.cate6Form').hide();
		$('.cate7Form').hide();
		$('.cate8Form').hide();
	});
	$('.cate5').click(function() {
		$('.cate5Form').fadeIn(1500);
		$('.cate1Form').hide();
		$('.cate2Form').hide();
		$('.cate3Form').hide();
		$('.cate4Form').hide();
		$('.cate6Form').hide();
		$('.cate7Form').hide();
		$('.cate8Form').hide();
	});
	$('.cate6').click(function() {
		$('.cate6Form').fadeIn(1500);
		$('.cate1Form').hide();
		$('.cate2Form').hide();
		$('.cate3Form').hide();
		$('.cate4Form').hide();
		$('.cate5Form').hide();
		$('.cate7Form').hide();
		$('.cate8Form').hide();
	});
	$('.cate7').click(function() {
		$('.cate7Form').fadeIn(1500);
		$('.cate1Form').hide();
		$('.cate2Form').hide();
		$('.cate3Form').hide();
		$('.cate4Form').hide();
		$('.cate5Form').hide();
		$('.cate6Form').hide();
		$('.cate8Form').hide();
	});
	$('.cate8').click(function() {
		$('.cate8Form').fadeIn(1500);
		$('.cate1Form').hide();
		$('.cate2Form').hide();
		$('.cate3Form').hide();
		$('.cate4Form').hide();
		$('.cate5Form').hide();
		$('.cate6Form').hide();
		$('.cate7Form').hide();
	});
});
</script>
<%--■■■■■■■■■■■■■■■■■■■■■■ MD추천 ■■■■■■■■■■■■■■■■■■■■■■■■■--%>
<br><br><br><br>
<%--■■■■■■■■■■■■■■■■■■■■■■ 레시피 ■■■■■■■■■■■■■■■■■■■■■■■■■--%>
<div class="container">
<div align="center"><h2>SolFood 레시피</h2></div>
<br><hr class="recipeHr">
<div class="row" align="center">
<c:forEach items="${homeRecipe}" var="recipe" begin="0" end="2">
<div class="col-xs-4">
<figure class="snip1436">
  <img src="/img/${recipe.recipe_image}" width="330px" height="220px"/>
  <figcaption>
    <h3>${recipe.recipe_name}</h3>
    <p></p><a href="${path}/recipe.do?recipe_id=${recipe.recipe_id}" class="read-more">자세히 보기</a>
  </figcaption>
</figure>
</div>
</c:forEach>
</div>
</div><br><br><br>
<div class="container" id="recipeInfo">
<div align="center">
	<div class="wiggle">
	<img src="../resources/image/spatula.png" >&nbsp;
	<img src="../resources/image/cleaver.png" >&nbsp;
	<img src="../resources/image/ladle.png" >&nbsp;
	<img src="../resources/image/stew.png" >&nbsp;&nbsp;
	</div>
	<br><br>
	<p style="font-size: 15px; font-weight: bold">SolFood만의 레시피로 건강하고 맛있는 요리를 해보세요 !</p>
</div>
</div>
<%--■■■■■■■■■■■■■■■■■■■■■■ 레시피 ■■■■■■■■■■■■■■■■■■■■■■■■■--%>
<br>
<br>
<br>

<!--■■■■■■■■■■■■■■■■■■■■■■ Bottom ■■■■■■■■■■■■■■■■■■■■■■■■-->
<jsp:include page="module/Bottom.jsp" flush="false"/>

</body>
</html>