<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리별 상품</title>
	<link href="../../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="../../../resources/css/component.css" rel="stylesheet">
	<script src="../../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../../resources/bootstrap/js/bootstrap.min.js"></script>
	<script>
		// 페이지가 로드되면 hear list 표시하기 
		$(document).ready(function(){
			heartList();
		});

		//----------------------------------------------------------------
		// 	heartState--> 페이지 로드시 heart 상태 표시
		//----------------------------------------------------------------
		function heartList(){
			/* var account_user= document.getElementById('account_user').value; */
			var account_user= "1809";
			var product_id;
			var heartList;
			
			// heart table 데이터 받아오기
			$.ajax({
				type: "GET",
				datatype: "json",
				url: "/product/heartList.do",
				
				success: function(data){
					// 로그인한 아이디가 heart table에 있는 거랑 같은 아이디일때만 그 해당 아이디가 heart누른 product_id를 heartList에 집어넣기
					alert("heartList success"+ data.length);
					
					for(var i=0; i<data.length; i++){						
						if(data[i].account_user== account_user){								
							// data[i].product_id= heartList[i];	
							$("[name='heartImage"+ data[i].product_id +"']").attr({
								'class' : 'afterClick'
							});							 
						}
					}
				},
				error: function(){
					alert("heartList fail"+ data.length);
					for(var i=0; i<data.length; i++){						
						if(data[i].account_user== account_user){								
							// data[i].product_id= heartList[i];	
							$("[name='heartImage"+ data[i].product_id +"']").attr({
								'class' : 'afterClick'
							});							 
						}
					}
				}
			});
		}
		
		//----------------------------------------------------------------
		// 	changeHeart--> heart 상태 변경 및 테이블에서 insert or delete
		//----------------------------------------------------------------
		function changeHeart(product_id, account_user){	
			var json;	
			var state;

			// beforeClick이면 afterClick으로, 아니면 그 반대로 해주는거
			$("[name='heartImage"+ product_id +"']").toggleClass("beforeClick afterClick");

			// name에 따른 class 이름 구하기
			var class_by_name= $("[name='heartImage"+ product_id +"']").attr('class');

			// toggleClass하고 나서 afterClick이 되면 heart 테이블에 들어가야하는 거니까 json에 state="click" 보내서 insertHeart가 실행되게 하기
			if(class_by_name== "afterClick"){
				state= "click";
				json= {"product_id":product_id, "state":state, "account_user":account_user};
				
				$.ajax({
					type: "post",
					url: "/product/changeHeart.do",
					data: json,
					success: function(){
					},
					error: function(){
					}
				});

			// afterClick이었다가 beforeClick으로 바뀌면 state="unclick"으로 보내서 deleteHeart가 실행되게 하기 
			} else if(class_by_name== "beforeClick"){
				state= "unclick";
				json= {"product_id":product_id, "state":state, "account_user":account_user};
				
				$.ajax({
					type: "post",
					url: "/product/changeHeart.do",
					data: json,
					success: function(){
					},
					error: function(){
					}
				});
			}
		}

	</script>

	<style>
		.afterClick{
			background-image: url("/resources/image/afterlike.PNG");
			border: none;
			background-size: 28px;
		}
		.beforeClick{
			background-image: url("/resources/image/beforelike.PNG");
			border: none;
			background-size: 28px;
		}
	</style>
</head>
<body>
<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Header ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<header>
		<%@ include file = "../module/Top.jsp" %>
	</header>
	<br><br><br>
<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 채소·과일 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>
<div class="container">
	<!-- account_user 받기 -->
	<input type="text" hidden="true" value= "${login.account_user}" id="account_user"/> 
	<c:set value="${login.account_user}" var="account_user"/>
	
	
	<!--  상품 -->
	<c:set var="cate" value="${param.product_category1}"/>
	<c:choose>
	<c:when test="${cate eq '채소·과일'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
			<div class="row">
				<div class="col-xs-offset-2">
					<button class="bttn-stretch bttn-md bttn-primary" id="allVege">전체보기</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="koFruit">국산과일</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="foFruit">수입과일</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="basicVege">기본채소</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="simpleVege">쌈·간편채소</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="mushroom">콩나물·버섯류</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="onion">양파·마늘·생강·파</button>
				</div>
			</div>
			<br><br><br>
			<%-- Category 분류 jQuery 접어두는걸 추천 --%>
			<script>
			$('#allVege').click(function(){
				$('#allVegeC').load('http://localhost:8080/product/products1.do?product_category1=채소·과일 #allVegeC');
			});
			$('#koFruit').click(function(){
				$('#allVegeC').load('http://localhost:8080/product/products2.do?product_category2=국산과일 #koFruitC');
			});
			$('#foFruit').click(function(){
				$('#allVegeC').load('http://localhost:8080/product/products2.do?product_category2=수입과일 #foFruitC');
			});
			$('#basicVege').click(function(){
				$('#allVegeC').load('http://localhost:8080/product/products2.do?product_category2=기본채소 #basicVegeC');
			});
			$('#simpleVege').click(function(){
				$('#allVegeC').load('http://localhost:8080/product/products2.do?product_category2=쌈·간편채소 #simpleVegeC');
			});
			$('#mushroom').click(function(){
				$('#allVegeC').load('http://localhost:8080/product/products2.do?product_category2=콩나물·버섯류 #mushroomC');
			});
			$('#onion').click(function(){
				$('#allVegeC').load('http://localhost:8080/product/products2.do?product_category2=양파·마늘·생강·파 #onionC');
			});
			</script>
	
				<div class="row" id="allVegeC">
				<c:forEach items="${products}" var="products">
					<div class="col-xs-4" align="center">
					
						<!-- 상품 id, 사진, 이름, 찜하기, 가격 순 -->
						<input type="text" hidden="true" value= "${products.product_id}" name="product_id"/>
						
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:200px; height:auto;"/></a><br><br>				     
				      	${products.product_name}&nbsp;
				 
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id},1809)" 
				      	class='beforeClick' style="width:29px; height:23px;"><br>
						
						${products.product_price}원<br><br><br><br>
				    </div>
				</c:forEach>
			  	</div>
		</c:when>
	</c:choose>

		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '국산과일'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allVege">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="koFruit">국산과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="foFruit">수입과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="basicVege">기본채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="simpleVege">쌈·간편채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mushroom">콩나물·버섯류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="onion">양파·마늘·생강·파</button>
			</div>
		</div>
		<script>
		$('#allVege').click(function(){
			$('#koFruitC').load('http://localhost:8080/product/products1.do?product_category1=채소·과일 #allVegeC');
		});
		$('#koFruit').click(function(){
			$('#koFruitC').load('http://localhost:8080/product/products2.do?product_category2=국산과일 #koFruitC');
		});
		$('#foFruit').click(function(){
			$('#koFruitC').load('http://localhost:8080/product/products2.do?product_category2=수입과일 #foFruitC');
		});
		$('#basicVege').click(function(){
			$('#koFruitC').load('http://localhost:8080/product/products2.do?product_category2=기본채소 #basicVegeC');
		});
		$('#simpleVege').click(function(){
			$('#koFruitC').load('http://localhost:8080/product/products2.do?product_category2=쌈·간편채소 #simpleVegeC');
		});
		$('#mushroom').click(function(){
			$('#koFruitC').load('http://localhost:8080/product/products2.do?product_category2=콩나물·버섯류 #mushroomC');
		});
		$('#onion').click(function(){
			$('#koFruitC').load('http://localhost:8080/product/products2.do?product_category2=양파·마늘·생강·파 #onionC');
		});
		</script>
		<br><br><br>
			<div class="row" id="koFruitC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			    	${products.product_image}<br>
			    	${products.product_name}<br>
			      	${products.product_price}<br>
			      	${products.product_content}<br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '수입과일'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allVege">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="koFruit">국산과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="foFruit">수입과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="basicVege">기본채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="simpleVege">쌈·간편채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mushroom">콩나물·버섯류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="onion">양파·마늘·생강·파</button>
			</div>
		</div>
		<script>
		$('#allVege').click(function(){
			$('#foFruitC').load('http://localhost:8080/product/products1.do?product_category1=채소·과일 #allVegeC');
		});
		$('#koFruit').click(function(){
			$('#foFruitC').load('http://localhost:8080/product/products2.do?product_category2=국산과일 #koFruitC');
		});
		$('#foFruit').click(function(){
			$('#foFruitC').load('http://localhost:8080/product/products2.do?product_category2=수입과일 #foFruitC');
		});
		$('#basicVege').click(function(){
			$('#foFruitC').load('http://localhost:8080/product/products2.do?product_category2=기본채소 #basicVegeC');
		});
		$('#simpleVege').click(function(){
			$('#foFruitC').load('http://localhost:8080/product/products2.do?product_category2=쌈·간편채소 #simpleVegeC');
		});
		$('#mushroom').click(function(){
			$('#foFruitC').load('http://localhost:8080/product/products2.do?product_category2=콩나물·버섯류 #mushroomC');
		});
		$('#onion').click(function(){
			$('#foFruitC').load('http://localhost:8080/product/products2.do?product_category2=양파·마늘·생강·파 #onionC');
		});
		</script>
		<br><br><br>
			<div class="row" id="foFruitC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      ${products.product_name}<br>
			      ${products.product_price}<br>
			      ${products.product_content}<br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '기본채소'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allVege">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="koFruit">국산과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="foFruit">수입과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="basicVege">기본채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="simpleVege">쌈·간편채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mushroom">콩나물·버섯류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="onion">양파·마늘·생강·파</button>
			</div>
		</div>
		<script>
		$('#allVege').click(function(){
			$('#basicVegeC').load('http://localhost:8080/product/products1.do?product_category1=채소·과일 #allVegeC');
		});
		$('#koFruit').click(function(){
			$('#basicVegeC').load('http://localhost:8080/product/products2.do?product_category2=국산과일 #koFruitC');
		});
		$('#foFruit').click(function(){
			$('#basicVegeC').load('http://localhost:8080/product/products2.do?product_category2=수입과일 #foFruitC');
		});
		$('#basicVege').click(function(){
			$('#basicVegeC').load('http://localhost:8080/product/products2.do?product_category2=기본채소 #basicVegeC');
		});
		$('#simpleVege').click(function(){
			$('#basicVegeC').load('http://localhost:8080/product/products2.do?product_category2=쌈·간편채소 #simpleVegeC');
		});
		$('#mushroom').click(function(){
			$('#basicVegeC').load('http://localhost:8080/product/products2.do?product_category2=콩나물·버섯류 #mushroomC');
		});
		$('#onion').click(function(){
			$('#basicVegeC').load('http://localhost:8080/product/products2.do?product_category2=양파·마늘·생강·파 #onionC');
		});
		</script>
		<br><br><br>
			<div class="row" id="basicVegeC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      ${products.product_name}<br>
			      ${products.product_price}<br>
			      ${products.product_content}<br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '쌈·간편채소'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allVege">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="koFruit">국산과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="foFruit">수입과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="basicVege">기본채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="simpleVege">쌈·간편채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mushroom">콩나물·버섯류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="onion">양파·마늘·생강·파</button>
			</div>
		</div>
		<script>
		$('#allVege').click(function(){
			$('#simpleVegeC').load('http://localhost:8080/product/products1.do?product_category1=채소·과일 #allVegeC');
		});
		$('#koFruit').click(function(){
			$('#simpleVegeC').load('http://localhost:8080/product/products2.do?product_category2=국산과일 #koFruitC');
		});
		$('#foFruit').click(function(){
			$('#simpleVegeC').load('http://localhost:8080/product/products2.do?product_category2=수입과일 #foFruitC');
		});
		$('#basicVege').click(function(){
			$('#simpleVegeC').load('http://localhost:8080/product/products2.do?product_category2=기본채소 #basicVegeC');
		});
		$('#simpleVege').click(function(){
			$('#simpleVegeC').load('http://localhost:8080/product/products2.do?product_category2=쌈·간편채소 #simpleVegeC');
		});
		$('#mushroom').click(function(){
			$('#simpleVegeC').load('http://localhost:8080/product/products2.do?product_category2=콩나물·버섯류 #mushroomC');
		});
		$('#onion').click(function(){
			$('#simpleVegeC').load('http://localhost:8080/product/products2.do?product_category2=양파·마늘·생강·파 #onionC');
		});
		</script>
		<br><br><br>
			<div class="row" id="simpleVegeC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      ${products.product_name}<br>
			      ${products.product_price}<br>
			      ${products.product_content}<br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '콩나물·버섯류'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allVege">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="koFruit">국산과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="foFruit">수입과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="basicVege">기본채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="simpleVege">쌈·간편채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mushroom">콩나물·버섯류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="onion">양파·마늘·생강·파</button>
			</div>
		</div>
		<script>
		$('#allVege').click(function(){
			$('#mushroomC').load('http://localhost:8080/product/products1.do?product_category1=채소·과일 #allVegeC');
		});
		$('#koFruit').click(function(){
			$('#mushroomC').load('http://localhost:8080/product/products2.do?product_category2=국산과일 #koFruitC');
		});
		$('#foFruit').click(function(){
			$('#mushroomC').load('http://localhost:8080/product/products2.do?product_category2=수입과일 #foFruitC');
		});
		$('#basicVege').click(function(){
			$('#mushroomC').load('http://localhost:8080/product/products2.do?product_category2=기본채소 #basicVegeC');
		});
		$('#simpleVege').click(function(){
			$('#mushroomC').load('http://localhost:8080/product/products2.do?product_category2=쌈·간편채소 #simpleVegeC');
		});
		$('#mushroom').click(function(){
			$('#mushroomC').load('http://localhost:8080/product/products2.do?product_category2=콩나물·버섯류 #mushroomC');
		});
		$('#onion').click(function(){
			$('#mushroomC').load('http://localhost:8080/product/products2.do?product_category2=양파·마늘·생강·파 #onionC');
		});
		</script>
		<br><br><br>
			<div class="row" id="mushroomC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      ${products.product_name}<br>
			      ${products.product_price}<br>
			      ${products.product_content}<br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '양파·마늘·생강·파'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allVege">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="koFruit">국산과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="foFruit">수입과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="basicVege">기본채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="simpleVege">쌈·간편채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mushroom">콩나물·버섯류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="onion">양파·마늘·생강·파</button>
			</div>
		</div>
		<script>
		$('#allVege').click(function(){
			$('#onionC').load('http://localhost:8080/product/products1.do?product_category1=채소·과일 #allVegeC');
		});
		$('#koFruit').click(function(){
			$('#onionC').load('http://localhost:8080/product/products2.do?product_category2=국산과일 #koFruitC');
		});
		$('#foFruit').click(function(){
			$('#onionC').load('http://localhost:8080/product/products2.do?product_category2=수입과일 #foFruitC');
		});
		$('#basicVege').click(function(){
			$('#onionC').load('http://localhost:8080/product/products2.do?product_category2=기본채소 #basicVegeC');
		});
		$('#simpleVege').click(function(){
			$('#onionC').load('http://localhost:8080/product/products2.do?product_category2=쌈·간편채소 #simpleVegeC');
		});
		$('#mushroom').click(function(){
			$('#onionC').load('http://localhost:8080/product/products2.do?product_category2=콩나물·버섯류 #mushroomC');
		});
		$('#onion').click(function(){
			$('#onionC').load('http://localhost:8080/product/products2.do?product_category2=양파·마늘·생강·파 #onionC');
		});
		</script>
		<br><br><br>
			<div class="row" id="onionC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      ${products.product_name}<br>
			      ${products.product_price}<br>
			      ${products.product_content}<br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
</div>
<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 채소·과일 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>



<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 국·반찬·요리 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>
<div class="container">
		<c:set var="cate" value="${param.product_category1}"/>
		<c:choose>
		<c:when test="${cate eq '국·반찬·요리'}">
	
	<div class="col-xs-offset-1">
	<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
	</div>
	<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFood">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="stew">국·탕·찌개</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="sideDish">밑반찬</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="kimchi">김치·장아찌·젓갈</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="tofu">두부·어묵</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mainDish">메인요리</button>
			</div>
		</div>
		<br><br><br>
		
		<%-- Category 분류 jQuery 접어두는걸 추천 --%>
		<script>
		$('#allFood').click(function(){
			$('#allFoodC').load('http://localhost:8080/product/products1.do?product_category1=국·반찬·요리 #allFoodC');
		});
		$('#stew').click(function(){
			$('#allFoodC').load('http://localhost:8080/product/products2.do?product_category2=국·탕·찌개 #stewC');
		});
		$('#sideDish').click(function(){
			$('#allFoodC').load('http://localhost:8080/product/products2.do?product_category2=밑반찬 #sideDishC');
		});
		$('#kimchi').click(function(){
			$('#allFoodC').load('http://localhost:8080/product/products2.do?product_category2=김치·장아찌·젓갈 #kimchiC');
		});
		$('#tofu').click(function(){
			$('#allFoodC').load('http://localhost:8080/product/products2.do?product_category2=두부·어묵 #tofuC');
		});
		$('#mainDish').click(function(){
			$('#allFoodC').load('http://localhost:8080/product/products2.do?product_category2=메인요리 #mainDishC');
		});
		</script>
		<br><br><br>
	

			<div class="row" id="allFoodC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      <a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:200px; height:auto;"/></a><br><br>
			      ${products.product_name}<br>
			      ${products.product_price}<br>
			      ${products.product_content}<br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '국·탕·찌개'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFood">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="stew">국·탕·찌개</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="sideDish">밑반찬</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="kimchi">김치·장아찌·젓갈</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="tofu">두부·어묵</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mainDish">메인요리</button>
			</div>
		</div>
		<script>
		$('#allFood').click(function(){
			$('#stewC').load('http://localhost:8080/product/products1.do?product_category1=국·반찬·요리 #allFoodC');
		});
		$('#stew').click(function(){
			$('#stewC').load('http://localhost:8080/product/products2.do?product_category2=국·탕·찌개 #stewC');
		});
		$('#sideDish').click(function(){
			$('#stewC').load('http://localhost:8080/product/products2.do?product_category2=밑반찬 #sideDishC');
		});
		$('#kimchi').click(function(){
			$('#stewC').load('http://localhost:8080/product/products2.do?product_category2=김치·장아찌·젓갈 #kimchiC');
		});
		$('#tofu').click(function(){
			$('#stewC').load('http://localhost:8080/product/products2.do?product_category2=두부·어묵 #tofuC');
		});
		$('#mainDish').click(function(){
			$('#stewC').load('http://localhost:8080/product/products2.do?product_category2=메인요리 #mainDishC');
		});
		
		</script>
		<br><br><br>
			<div class="row" id="stewC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      ${products.product_name}<br>
			      ${products.product_price}<br>
			      ${products.product_content}<br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '밑반찬'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFood">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="stew">국·탕·찌개</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="sideDish">밑반찬</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="kimchi">김치·장아찌·젓갈</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="tofu">두부·어묵</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mainDish">메인요리</button>
			</div>
		</div>
		<script>
		$('#allFood').click(function(){
			$('#sideDishC').load('http://localhost:8080/product/products1.do?product_category1=국·반찬·요리 #allFoodC');
		});
		$('#stew').click(function(){
			$('#sideDishC').load('http://localhost:8080/product/products2.do?product_category2=국·탕·찌개 #stewC');
		});
		$('#sideDish').click(function(){
			$('#sideDishC').load('http://localhost:8080/product/products2.do?product_category2=밑반찬 #sideDishC');
		});
		$('#kimchi').click(function(){
			$('#sideDishC').load('http://localhost:8080/product/products2.do?product_category2=김치·장아찌·젓갈 #kimchiC');
		});
		$('#tofu').click(function(){
			$('#sideDishC').load('http://localhost:8080/product/products2.do?product_category2=두부·어묵 #tofuC');
		});
		$('#mainDish').click(function(){
			$('#sideDishC').load('http://localhost:8080/product/products2.do?product_category2=메인요리 #mainDishC');
		});
		</script>
		<br><br><br>
			<div class="row" id="sideDishC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      ${products.product_name}<br>
			      ${products.product_price}<br>
			      ${products.product_content}<br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '김치·장아찌·젓갈'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFood">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="stew">국·탕·찌개</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="sideDish">밑반찬</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="kimchi">김치·장아찌·젓갈</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="tofu">두부·어묵</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mainDish">메인요리</button>
			</div>
		</div>
		<script>
		$('#allFood').click(function(){
			$('#kimchiC').load('http://localhost:8080/product/products1.do?product_category1=국·반찬·요리 #allFoodC');
		});
		$('#stew').click(function(){
			$('#kimchiC').load('http://localhost:8080/product/products2.do?product_category2=국·탕·찌개 #stewC');
		});
		$('#sideDish').click(function(){
			$('#kimchiC').load('http://localhost:8080/product/products2.do?product_category2=밑반찬 #sideDishC');
		});
		$('#kimchi').click(function(){
			$('#kimchiC').load('http://localhost:8080/product/products2.do?product_category2=김치·장아찌·젓갈 #kimchiC');
		});
		$('#tofu').click(function(){
			$('#kimchiC').load('http://localhost:8080/product/products2.do?product_category2=두부·어묵 #tofuC');
		});
		$('#mainDish').click(function(){
			$('#kimchiC').load('http://localhost:8080/product/products2.do?product_category2=메인요리 #mainDishC');
		});
		</script>
		<br><br><br>
			<div class="row" id="kimchiC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      ${products.product_name}<br>
			      ${products.product_price}<br>
			      ${products.product_content}<br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '두부·어묵'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFood">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="stew">국·탕·찌개</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="sideDish">밑반찬</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="kimchi">김치·장아찌·젓갈</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="tofu">두부·어묵</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mainDish">메인요리</button>
			</div>
		</div>
		<script>
		$('#allFood').click(function(){
			$('#tofuC').load('http://localhost:8080/product/products1.do?product_category1=국·반찬·요리 #allFoodC');
		});
		$('#stew').click(function(){
			$('#tofuC').load('http://localhost:8080/product/products2.do?product_category2=국·탕·찌개 #stewC');
		});
		$('#sideDish').click(function(){
			$('#tofuC').load('http://localhost:8080/product/products2.do?product_category2=밑반찬 #sideDishC');
		});
		$('#kimchi').click(function(){
			$('#tofuC').load('http://localhost:8080/product/products2.do?product_category2=김치·장아찌·젓갈 #kimchiC');
		});
		$('#tofu').click(function(){
			$('#tofuC').load('http://localhost:8080/product/products2.do?product_category2=두부·어묵 #tofuC');
		});
		$('#mainDish').click(function(){
			$('#tofuC').load('http://localhost:8080/product/products2.do?product_category2=메인요리 #mainDishC');
		});
		</script>
		<br><br><br>
			<div class="row" id="tofuC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      ${products.product_name}<br>
			      ${products.product_price}<br>
			      ${products.product_content}<br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '메인요리'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFood">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="stew">국·탕·찌개</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="sideDish">밑반찬</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="kimchi">김치·장아찌·젓갈</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="tofu">두부·어묵</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mainDish">메인요리</button>
			</div>
		</div>
		<script>
		$('#allFood').click(function(){
			$('#mainDishC').load('http://localhost:8080/product/products1.do?product_category1=국·반찬·요리 #allFoodC');
		});
		$('#stew').click(function(){
			$('#mainDishC').load('http://localhost:8080/product/products2.do?product_category2=국·탕·찌개 #stewC');
		});
		$('#sideDish').click(function(){
			$('#mainDishC').load('http://localhost:8080/product/products2.do?product_category2=밑반찬 #sideDishC');
		});
		$('#kimchi').click(function(){
			$('#mainDishC').load('http://localhost:8080/product/products2.do?product_category2=김치·장아찌·젓갈 #kimchiC');
		});
		$('#tofu').click(function(){
			$('#mainDishC').load('http://localhost:8080/product/products2.do?product_category2=두부·어묵 #tofuC');
		});
		$('#mainDish').click(function(){
			$('#mainDishC').load('http://localhost:8080/product/products2.do?product_category2=메인요리 #mainDishC');
		});
		</script>
		<br><br><br>
			<div class="row" id="mainDishC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      ${products.product_name}<br>
			      ${products.product_price}<br>
			      ${products.product_content}<br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
</div>
<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 국·반찬·요리 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>


<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 정육·계란 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>
<div class="container">
		<c:set var="cate" value="${param.product_category1}"/>
		<c:choose>
		<c:when test="${cate eq '정육·계란'}">
	
	<div class="col-xs-offset-1">
	<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
	</div>
	<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allMeat">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="beaf">소고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="pork">돼지고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="lamb">양고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="chicken">닭·오리고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="egg">계란·돈까스</button>
			</div>
		</div><br><br><br>
		<%-- Category 분류 jQuery 접어두는걸 추천 --%>
		<script>
		$('#allMeat').click(function(){
			$('#allMeatC').load('http://localhost:8080/product/products1.do?product_category1=정육·계란 #allMeatC');
		});
		$('#beaf').click(function(){
			$('#allMeatC').load('http://localhost:8080/product/products2.do?product_category2=소고기 #beafC');
		});
		$('#pork').click(function(){
			$('#allMeatC').load('http://localhost:8080/product/products2.do?product_category2=돼지고기 #porkC');
		});
		$('#lamb').click(function(){
			$('#allMeatC').load('http://localhost:8080/product/products2.do?product_category2=양고기 #lambC');
		});
		$('#chicken').click(function(){
			$('#allMeatC').load('http://localhost:8080/product/products2.do?product_category2=닭·오리고기 #chickenC');
		});
		$('#egg').click(function(){
			$('#allMeatC').load('http://localhost:8080/product/products2.do?product_category2=계란·돈까스 #eggC');
		});
		</script>
		<br><br><br>

			<div class="row" id="allMeatC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      ${products.product_name}<br>
			      ${products.product_price}<br>
			      ${products.product_content}<br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '소고기'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allMeat">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="beaf">소고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="pork">돼지고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="lamb">양고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="chicken">닭·오리고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="egg">계란·돈까스</button>
			</div>
		</div>
		<script>
		$('#allMeat').click(function(){
			$('#beafC').load('http://localhost:8080/product/products1.do?product_category1=정육·계란 #allMeatC');
		});
		$('#beaf').click(function(){
			$('#beafC').load('http://localhost:8080/product/products2.do?product_category2=소고기 #beafC');
		});
		$('#pork').click(function(){
			$('#beafC').load('http://localhost:8080/product/products2.do?product_category2=돼지고기 #porkC');
		});
		$('#lamb').click(function(){
			$('#beafC').load('http://localhost:8080/product/products2.do?product_category2=양고기 #lambC');
		});
		$('#chicken').click(function(){
			$('#beafC').load('http://localhost:8080/product/products2.do?product_category2=닭·오리고기 #chickenC');
		});
		$('#egg').click(function(){
			$('#beafC').load('http://localhost:8080/product/products2.do?product_category2=계란·돈까스 #eggC');
		});
		</script>
		<br><br><br>
			<div class="row" id="beafC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      ${products.product_name}<br>
			      ${products.product_price}<br>
			      ${products.product_content}<br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '돼지고기'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allMeat">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="beaf">소고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="pork">돼지고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="lamb">양고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="chicken">닭·오리고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="egg">계란·돈까스</button>
			</div>
		</div>
		<script>
		$('#allMeat').click(function(){
			$('#porkC').load('http://localhost:8080/product/products1.do?product_category1=정육·계란 #allMeatC');
		});
		$('#beaf').click(function(){
			$('#porkC').load('http://localhost:8080/product/products2.do?product_category2=소고기 #beafC');
		});
		$('#pork').click(function(){
			$('#porkC').load('http://localhost:8080/product/products2.do?product_category2=돼지고기 #porkC');
		});
		$('#lamb').click(function(){
			$('#porkC').load('http://localhost:8080/product/products2.do?product_category2=양고기 #lambC');
		});
		$('#chicken').click(function(){
			$('#porkC').load('http://localhost:8080/product/products2.do?product_category2=닭·오리고기 #chickenC');
		});
		$('#egg').click(function(){
			$('#porkC').load('http://localhost:8080/product/products2.do?product_category2=계란·돈까스 #eggC');
		});
		</script>
		<br><br><br>
			<div class="row" id="porkC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      ${products.product_name}<br>
			      ${products.product_price}<br>
			      ${products.product_content}<br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '양고기'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allMeat">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="beaf">소고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="pork">돼지고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="lamb">양고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="chicken">닭·오리고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="egg">계란·돈까스</button>
			</div>
		</div>
		<script>
		$('#allMeat').click(function(){
			$('#lambC').load('http://localhost:8080/product/products1.do?product_category1=정육·계란 #allMeatC');
		});
		$('#beaf').click(function(){
			$('#lambC').load('http://localhost:8080/product/products2.do?product_category2=소고기 #beafC');
		});
		$('#pork').click(function(){
			$('#lambC').load('http://localhost:8080/product/products2.do?product_category2=돼지고기 #porkC');
		});
		$('#lamb').click(function(){
			$('#lambC').load('http://localhost:8080/product/products2.do?product_category2=양고기 #lambC');
		});
		$('#chicken').click(function(){
			$('#lambC').load('http://localhost:8080/product/products2.do?product_category2=닭·오리고기 #chickenC');
		});
		$('#egg').click(function(){
			$('#lambC').load('http://localhost:8080/product/products2.do?product_category2=계란·돈까스 #eggC');
		});
		</script>
		<br><br><br>
			<div class="row" id="lambC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      ${products.product_name}<br>
			      ${products.product_price}<br>
			      ${products.product_content}<br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '닭·오리고기'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allMeat">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="beaf">소고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="pork">돼지고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="lamb">양고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="chicken">닭·오리고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="egg">계란·돈까스</button>
			</div>
		</div>
		<script>
		$('#allMeat').click(function(){
			$('#chickenC').load('http://localhost:8080/product/products1.do?product_category1=정육·계란 #allMeatC');
		});
		$('#beaf').click(function(){
			$('#chickenC').load('http://localhost:8080/product/products2.do?product_category2=소고기 #beafC');
		});
		$('#pork').click(function(){
			$('#chickenC').load('http://localhost:8080/product/products2.do?product_category2=돼지고기 #porkC');
		});
		$('#lamb').click(function(){
			$('#chickenC').load('http://localhost:8080/product/products2.do?product_category2=양고기 #lambC');
		});
		$('#chicken').click(function(){
			$('#chickenC').load('http://localhost:8080/product/products2.do?product_category2=닭·오리고기 #chickenC');
		});
		$('#egg').click(function(){
			$('#chickenC').load('http://localhost:8080/product/products2.do?product_category2=계란·돈까스 #eggC');
		});
		</script>
		<br><br><br>
			<div class="row" id="chickenC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      ${products.product_name}<br>
			      ${products.product_price}<br>
			      ${products.product_content}<br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '계란·돈까스'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allMeat">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="beaf">소고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="pork">돼지고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="lamb">양고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="chicken">닭·오리고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="egg">계란·돈까스</button>
			</div>
		</div>
		<script>
		$('#allMeat').click(function(){
			$('#eggC').load('http://localhost:8080/product/products1.do?product_category1=정육·계란 #allMeatC');
		});
		$('#beaf').click(function(){
			$('#eggC').load('http://localhost:8080/product/products2.do?product_category2=소고기 #beafC');
		});
		$('#pork').click(function(){
			$('#eggC').load('http://localhost:8080/product/products2.do?product_category2=돼지고기 #porkC');
		});
		$('#lamb').click(function(){
			$('#eggC').load('http://localhost:8080/product/products2.do?product_category2=양고기 #lambC');
		});
		$('#chicken').click(function(){
			$('#eggC').load('http://localhost:8080/product/products2.do?product_category2=닭·오리고기 #chickenC');
		});
		$('#egg').click(function(){
			$('#eggC').load('http://localhost:8080/product/products2.do?product_category2=계란·돈까스 #eggC');
		});
		</script>
		<br><br><br>
			<div class="row" id="eggC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      ${products.product_name}<br>
			      ${products.product_price}<br>
			      ${products.product_content}<br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
</div>
<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 정육·계란 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>


<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 샐러드·간편식 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>
<div class="container">
		<c:set var="cate" value="${param.product_category1}"/>
		<c:choose>
		<c:when test="${cate eq '샐러드·간편식'}">
	
	<div class="col-xs-offset-1">
	<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
	</div>
	<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFresh">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="salad">샐러드·도시락</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="frozenFood">간편식·냉동식품</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="soup">죽·수프</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="cereal">선식·시리얼·그래놀라</button>
			</div>
		</div>
		<br><br><br>
		<%-- Category 분류 jQuery 접어두는걸 추천 --%>
		<script>
		$('#allFresh').click(function(){
			$('#allFreshC').load('http://localhost:8080/product/products1.do?product_category1=샐러드·간편식 #allFreshC');
		});
		$('#salad').click(function(){
			$('#allFreshC').load('http://localhost:8080/product/products2.do?product_category2=샐러드·도시락 #saladC');
		});
		$('#frozenFood').click(function(){
			$('#allFreshC').load('http://localhost:8080/product/products2.do?product_category2=간편식·냉동식품 #frozenFoodC');
		});
		$('#soup').click(function(){
			$('#allFreshC').load('http://localhost:8080/product/products2.do?product_category2=죽·수프 #soupC');
		});
		$('#cereal').click(function(){
			$('#allFreshC').load('http://localhost:8080/product/products2.do?product_category2=선식·시리얼·그래놀라 #cerealC');
		});
		</script>
		<br><br><br>

			<div class="row" id="allFreshC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      ${products.product_name}<br>
			      ${products.product_price}<br>
			      ${products.product_content}<br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '샐러드·도시락'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFresh">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="salad">샐러드·도시락</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="frozenFood">간편식·냉동식품</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="soup">죽·수프</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="cereal">선식·시리얼·그래놀라</button>
			</div>
		</div>
		<script>
		$('#allFresh').click(function(){
			$('#saladC').load('http://localhost:8080/product/products1.do?product_category1=샐러드·간편식 #allFreshC');
		});
		$('#salad').click(function(){
			$('#saladC').load('http://localhost:8080/product/products2.do?product_category2=샐러드·도시락 #saladC');
		});
		$('#frozenFood').click(function(){
			$('#saladC').load('http://localhost:8080/product/products2.do?product_category2=간편식·냉동식품 #frozenFoodC');
		});
		$('#soup').click(function(){
			$('#saladC').load('http://localhost:8080/product/products2.do?product_category2=죽·수프 #soupC');
		});
		$('#cereal').click(function(){
			$('#saladC').load('http://localhost:8080/product/products2.do?product_category2=선식·시리얼·그래놀라 #cerealC');
		});
		</script>
		<br><br><br>
			<div class="row" id="saladC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      ${products.product_name}<br>
			      ${products.product_price}<br>
			      ${products.product_content}<br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '간편식·냉동식품'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFresh">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="salad">샐러드·도시락</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="frozenFood">간편식·냉동식품</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="soup">죽·수프</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="cereal">선식·시리얼·그래놀라</button>
			</div>
		</div>
		<script>
		$('#allFresh').click(function(){
			$('#frozenFoodC').load('http://localhost:8080/product/products1.do?product_category1=샐러드·간편식 #allFreshC');
		});
		$('#salad').click(function(){
			$('#frozenFoodC').load('http://localhost:8080/product/products2.do?product_category2=샐러드·도시락 #saladC');
		});
		$('#frozenFood').click(function(){
			$('#frozenFoodC').load('http://localhost:8080/product/products2.do?product_category2=간편식·냉동식품 #frozenFoodC');
		});
		$('#soup').click(function(){
			$('#frozenFoodC').load('http://localhost:8080/product/products2.do?product_category2=죽·수프 #soupC');
		});
		$('#cereal').click(function(){
			$('#frozenFoodC').load('http://localhost:8080/product/products2.do?product_category2=선식·시리얼·그래놀라 #cerealC');
		});
		</script>
		<br><br><br>
			<div class="row" id="frozenFoodC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      ${products.product_name}<br>
			      ${products.product_price}<br>
			      ${products.product_content}<br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '죽·수프'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFresh">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="salad">샐러드·도시락</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="frozenFood">간편식·냉동식품</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="soup">죽·수프</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="cereal">선식·시리얼·그래놀라</button>
			</div>
		</div>
		<script>
		$('#allFresh').click(function(){
			$('#soupC').load('http://localhost:8080/product/products1.do?product_category1=샐러드·간편식 #allFreshC');
		});
		$('#salad').click(function(){
			$('#soupC').load('http://localhost:8080/product/products2.do?product_category2=샐러드·도시락 #saladC');
		});
		$('#frozenFood').click(function(){
			$('#soupC').load('http://localhost:8080/product/products2.do?product_category2=간편식·냉동식품 #frozenFoodC');
		});
		$('#soup').click(function(){
			$('#soupC').load('http://localhost:8080/product/products2.do?product_category2=죽·수프 #soupC');
		});
		$('#cereal').click(function(){
			$('#soupC').load('http://localhost:8080/product/products2.do?product_category2=선식·시리얼·그래놀라 #cerealC');
		});
		</script>
		<br><br><br>
			<div class="row" id="soupC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      ${products.product_name}<br>
			      ${products.product_price}<br>
			      ${products.product_content}<br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '선식·시리얼·그래놀라'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFresh">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="salad">샐러드·도시락</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="frozenFood">간편식·냉동식품</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="soup">죽·수프</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="cereal">선식·시리얼·그래놀라</button>
			</div>
		</div>
		<script>
		$('#allFresh').click(function(){
			$('#cerealC').load('http://localhost:8080/product/products1.do?product_category1=샐러드·간편식 #allFreshC');
		});
		$('#salad').click(function(){
			$('#cerealC').load('http://localhost:8080/product/products2.do?product_category2=샐러드·도시락 #saladC');
		});
		$('#frozenFood').click(function(){
			$('#cerealC').load('http://localhost:8080/product/products2.do?product_category2=간편식·냉동식품 #frozenFoodC');
		});
		$('#soup').click(function(){
			$('#cerealC').load('http://localhost:8080/product/products2.do?product_category2=죽·수프 #soupC');
		});
		$('#cereal').click(function(){
			$('#cerealC').load('http://localhost:8080/product/products2.do?product_category2=선식·시리얼·그래놀라 #cerealC');
		});
		</script>
		<br><br><br>
			<div class="row" id="cerealC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      ${products.product_name}<br>
			      ${products.product_price}<br>
			      ${products.product_content}<br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
</div>
<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 샐러드·간편식 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>

<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Footer ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<footer>
	<%@ include file = "../module/Bottom.jsp" %>
	</footer>
</body>
</html>