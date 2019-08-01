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
	<script src="../resources/css/multi.js"></script>
	<script src="../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
	
	
	<!-- 상품 뿌리기 ajax -->
	<script>
	
	// 숫자에 콤마 넣는 함수
	function addComma(num)
	{
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
	}

	var nData = addComma(nData);
	
	function product_category1(product_category1){	
		var json= {"product_category1":product_category1};
		var html= "";
		
			$.ajax({
				type: "post",
				url: "/product/products1_2.do",
				data: json,
				success: function(data){
					for(var i=0; i<4; i++){
						html+= "<div class='col-xs-3'>";
						html+= "<a href='product/productInfo.do?product_id="+ data[i].product_id +"'><img src='/img/"+ data[i].product_image +"' width='250px' height='320px'/></a><br><br>";
						html+= "<a href='product/productInfo.do?product_id="+ data[i].product_id +"'><strong>"+ data[i].product_name +"</strong></a><br>";
						html+= addComma(data[i].product_price) +"원";
						html+= "</div>";
						$("#mdArea").html(html);
					}
				},
				error: function(){
					alert("product_category1 fail");
				}
			});
		}
	</script>
	
	
	<style type="text/css">
		@import url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap');
		a { text-decoration: none; font-family: 'Nanum Myeongjo', serif;}
 		a:link { color: black; text-decoration: none !important; font-family: 'Nanum Myeongjo', serif;}
 		a:active { color: black !important; text-decoration: none !important; font-family: 'Nanum Myeongjo', serif;}
		a:visited { color: black !important; text-decoration: none !important; font-family: 'Nanum Myeongjo', serif;}
 		a:hover { color: black !important; text-decoration: none !important; font-family: 'Nanum Myeongjo', serif;}
	</style>
	<style>
		@import url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap');
		html{cursor: url(../resources/image/carrot.png), auto}
		body {
			width: 100%;
			font-family: 'Nanum Myeongjo', serif;
			font-size: 18px;
			align: center !important;
		}
		h2{
			font-family: 'Nanum Myeongjo', serif !important;
		}
		h3{
			font-family: 'Nanum Myeongjo', serif !important;
		}
		h4{
			font-family: 'Nanum Myeongjo', serif !important;
		}
		p{
			font-family: 'Nanum Myeongjo', serif !important;
		}
		input{
			font-family: 'Nanum Myeongjo', serif !important;
		}
		#mdArea{
			font-family: 'Nanum Myeongjo', serif !important;
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
<div align="center"><h2><strong>인기 상품</strong></h2></div><br><br><br>
    <div class="row">
		<div class="col-md-12">
                <div id="Carousel" class="carousel slide">
                <!-- Carousel items -->
                <div class="carousel-inner">
                <div class="item active">
                	<div class="row">
                	 <c:forEach items="${homeProduct}" var="homeProduct" begin="0" end="3">
	                	<div class="col-md-3">
	                		<a href="${path}/product/productInfo.do?product_id=${homeProduct.product_id}" class="thumbnail"><img src="/img/${homeProduct.product_image}" style="max-width:100%; height: 315px;"></a><br>
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
		<div align="center"><h2><a href="#"><strong>이벤트</strong></a></h2></div>
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
<div align="center"><h2><strong>MD 추천</strong></h2></div>
<br>
<div align="center"><h4>오늘의 MD 추천 상품은 무엇일까요 ?</h4></div>
<hr class="recipeHr">
<br><br>
<div class="container" align="center">
	<input type="button" class="bttn-fill cate1" onclick= "product_category1('채소·과일')" value="채소.과일"/>&nbsp;&nbsp;
	<input type="button" class="bttn-fill cate1" onclick= "product_category1('국·반찬·요리')" value="국·반찬·요리"/>&nbsp;&nbsp;	
	<input type="button" class="bttn-fill cate1" onclick= "product_category1('면·양념·오일')" value="면·양념·오일"/>&nbsp;&nbsp;	
	<input type="button" class="bttn-fill cate1" onclick= "product_category1('정육·계란')" value="정육·계란"/>&nbsp;&nbsp;	
	<input type="button" class="bttn-fill cate1" onclick= "product_category1('수산·해산')" value="수산·해산"/>&nbsp;&nbsp;	
	<input type="button" class="bttn-fill cate1" onclick= "product_category1('샐러드·간편식')" value="샐러드·간편식"/>&nbsp;&nbsp;	
	<input type="button" class="bttn-fill cate1" onclick= "product_category1('음료·우유·간식')" value="음료·우유·간식"/>&nbsp;&nbsp;	
	<input type="button" class="bttn-fill cate1" onclick= "product_category1('베이커리·델리')" value="베이커리·델리"/>&nbsp;&nbsp;	
</div>
<br><br><br><br>
<div class="container">
<div class="row" align="center">
<div class="cate1Form" id="mdArea" align="center">
	
</div>
</div>
</div>
</div>
<br><br><br>


<%--■■■■■■■■■■■■■■■■■■■■■■ MD추천 ■■■■■■■■■■■■■■■■■■■■■■■■■--%>
<br><br><br><br>
<%--■■■■■■■■■■■■■■■■■■■■■■ 레시피 ■■■■■■■■■■■■■■■■■■■■■■■■■--%>
<div class="container">
<div align="center"><h2><strong>SolFood 레시피</strong></h2></div>
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
<%@ include file = "module/Bottom.jsp" %>

</body>
</html>