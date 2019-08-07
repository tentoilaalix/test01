<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품검색</title>
	<link href="../../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="../../../resources/css/component.css" rel="stylesheet">
	<script src="../../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../../resources/bootstrap/js/bootstrap.min.js"></script>
	
	<%-- 하트 --%>
	<script>
		// 페이지가 로드되면 hear list 표시하기 
		$(document).ready(function(){
			productSearchList();
			heartList();
		});

		//----------------------------------------------------------------
		// 	productSearchList
		//----------------------------------------------------------------
		function productSearchList(){	
			var html= "";
			var account_user= "1809";
			
				$.ajax({
					type: "get",
					url: "/product/productSearch2.do",
					data: json,
					success: function(data){
						for(var i=0; i<data.length; i++){
							html+= "<a href='${path}/product/productInfo.do?product_id="+ data[i].product_id +"'>";
							html+= "<img src='/img/"+ data[i].product_image +"' style='width:200px; height:auto;'/></a><br><br>"+ data[i].product_name +"&nbsp;";
							html+= "<input type='text' hidden='true' name='product_id'>";
							
							// account_user null이면 하트안보이게, 로그인 했으면 하트보이게
							if(account_user==""){
								html+= "";
							} else{
								html+= "<input type='button' id='heartImage' name='heartImage"+ data[i].product_id +"' onclick= 'changeHeart("+ data[i].product_id +",1809)' class='beforeClick' style='width:29px; height:23px;'><br>";
							}
				
							html+= addComma(data[i].product_price) +"원";							
							$("#productSearchList").html(html);
						}
					},
					error: function(){
						alert("productSearch2.do fail");
					}
				});
		}
		
		//----------------------------------------------------------------
		// 	heartState--> 페이지 로드시 heart 상태 표시
		//----------------------------------------------------------------
		function heartList(){
			// var account_user = document.getElementsByName("account_user")[0].value;
			var account_user= "1809";
			var product_id= document.getElementsByName("product_id");
			var html= "";
			
			// heart table 데이터 받아오기
			$.ajax({
				type: "get",
				datatype: "json",
				url: "/heart/heartListForProductList.do",
				
				success: function(data){
					for(var i=0; i<data.length; i++){						
						if(data[i].account_user== account_user && data[i].product_id== product_id[i].value){								
							$("[name='heartImage"+ data[i].product_id +"']").attr({
								'class' : 'afterClick'
							});							 
						}
					}
				},
				error: function(){
					for(var i=0; i<data.length; i++){						
						if(data[i].account_user== account_user){								
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
					url: "/heart/changeHeart.do",
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
					url: "/heart/changeHeart.do",
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
			outline: none;
			background-size: 28px;
		}
		.beforeClick{
			background-image: url("/resources/image/beforelike.PNG");
			border: none;
			outline: none;
			background-size: 28px;
		}
	</style>
	
	<style>
		@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
		div{
			font-family: 'Noto Sans KR', sans-serif !important;
		}
	</style>
	
</head>
<body>
	<%-- header --%>
	<jsp:include page="../module/Top.jsp" flush="false"/>
	<br><br><br>
	
	<%-- account_user받아오기 --%>
	<input type="text" hidden="true" value="${login.account_user}" name="account_user">
	
	<%-- 검색어 --%>
	<div class="container" align="center">
		<h2>"<%= request.getParameter("keyword_p") %>"</h2>
	</div>
	
	<%-- 검색 결과 --%>
	<div class="container" id="allVegeC">
		<div class="col-xs-4" align="center" id="productSearchList">
				
			<%-- ===================  상품 id, 사진, 이름, 찜하기, 가격 순 ======================== 
			
			<input type="text" hidden="true" value= "${product.product_id}" name="product_id"/>
			<a href="${path}/product/productInfo.do?product_id=${product.product_id}"><img src="/img/${product.product_image}" style="width:200px; height:auto;"/></a><br><br>				     
		   	${product.product_name}&nbsp;
				 
		 		<%--  login 값이 없으면 하트 안보이게 
		 		<c:choose>
				    <c:when test="${login.account_user== null}">
						<br>
				    </c:when>
				    <c:otherwise>
				   		<input type="button" id='heartImage' name='heartImage${product.product_id}' onclick= "changeHeart(${product.product_id},${login.account_user})" class='beforeClick' style="width:29px; height:23px;"><br>
				    </c:otherwise>
				</c:choose>

				<a href="${path}/product/productInfo.do?product_id=${product.product_id}"><fmt:formatNumber value="${product.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			--%>
		
		</div>
	</div>
</body>
</html>