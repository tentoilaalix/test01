<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>cart list</title>
	<link href="../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>   
	<script>
		$(document).ready(function(){
			cartList();
		});
		
		// cart에서 삭제하고 다시 cartList 불러옴	
		$(".deleteFromCart").click(function(){
			deleteFromCart();
		});
				
		//------------------------------------------------------------------
		//	cartList--> 해당 유저의 cart list 불러오는 메소드
		//------------------------------------------------------------------
		function cartList(){
			var account_user = document.getElementsByName("account_user")[0].value;
			
			$.ajax({
				type: "post",
				url: "/cart/cartList2.do?account_user="+ account_user,
				success: function(data){
					var html= "";
					var cnt= data.length;
					
					// table에 cart list 붙이기
					if(cnt> 0){	
						for(i=0; i<cnt; i++){
							html+= "<tr height='50' class='info'>";
							html+= "<td align='center' width='100'><button class='btn' onClick='deleteFromCart("+ data[i].product_id+","+ account_user +")'>삭제</button></td>";
							html+= "<td align='center' width='100'><button class='btn' onClick='cartPlus("+ account_user+","+ data[i].product_id+","+ data[i].cart_count+")'>+</button></td>";
							html+= "<td align='center' width='100'><button class='btn' onClick='cartMinus("+ account_user+","+ data[i].product_id+","+ data[i].cart_count+")'>-</button></td>";
							html+= "<td align='center' width='100'>"+ data[i].cart_date+ "</td>";
							html+= "<td align='center' width='100'>"+ data[i].product_name+ "</td>";
							html+= "<td align='center' width='100'>"+ data[i].cart_count+ "</td>";
							html+= "<td align='center' width='100'>"+ data[i].product_count+ "</td>";
							html+= "<td align='center' width='100'>"+ data[i].product_price+ "</td>";
							html+= "<td align='center' width='100'>"+ data[i].product_image+ "</td>";
							html+= "</tr>";		
						}
						$("#cartList").html(html);
						html= "";
					} else{
						$("#cartList").html(html);
					}
					
					
					// selectedPrice--> 각각의 상품 금액 표시 
					html= "";
					var total= 0;
					
					for(i=0; i<cnt; i++){
						html+= "<h5>"+ data[i].product_name +" X "+ data[i].cart_count +"="+ (data[i].product_price* data[i].cart_count) +"</h5> ";				
						total+= (data[i].product_price* data[i].cart_count);
					}
					html+= "<h4>"+ total +"</h4>" 
					
					$("#selectedPrice").html(html);
					
					
					// totalPrice--> 총 금액 표시
					html= "";
					var all_total= total+ 10;
					html+= "<h4>"+ all_total +"</h4>"; 
					html+= "<c:set var='all_total' value='"+ all_total +"'/>";
					
					$("#saleBtn").attr({
						'href' : '${path}/cart/pay.do?account_user='+ account_user+ '&totalPrice=' +all_total
					});
					
					$("#totalPrice").html(html);
				},
				
				error: function(request, status, error){
					alert("데이터 cartList 뿌리기 실패");
				} 
			});
		}
		
		//------------------------------------------------------------------
		//	deleteFromCart--> cart에서 상품 삭제하는 메소드
		//------------------------------------------------------------------
		function deleteFromCart(product_id, account_user){			
			var json= {"product_id":product_id, "account_user":account_user};
			
			$.ajax({
				type: "post",
				url: "/cart/cartDelete.do",
				data: json,
				success: function(){
					cartList();
				},
				error: function(){
					alert("카트에서 삭제 실패");
				}
			});
		}
		
		//------------------------------------------------------------------
		//	deleteOutOfStock()--> cart에서 상품 삭제하는 메소드
		//------------------------------------------------------------------
		function deleteOutOfStock(account_user){	
			var json= {"account_user":account_user};
			
			$.ajax({
				type: "post",
				url: "/cart/cartDeleteOutOfStock.do",
				data: json,
				success: function(data){
					cartList();
				},
				error: function(){
					cartList();
				}
			});
		}
		
		
		//------------------------------------------------------------------
		//	cartPlus()--> cart에서 상품 추가하는 메소드
		//------------------------------------------------------------------
		function cartPlus(account_user, product_id, cart_count){
			var json= {"account_user":account_user, "product_id":product_id, "cart_count":cart_count};
			
			$.ajax({
				type: "post",
				url: "/cart/cartPlus.do",
				data: json,
				success: function(data){
					cartList();
				},
				error: function(){
					cartList();
				}
			});
		}
		
		//------------------------------------------------------------------
		//	cartMinus()--> cart에서 상품 삭제하는 메소드
		//------------------------------------------------------------------
		function cartMinus(account_user, product_id, cart_count){	
			var json= {"account_user":account_user, "product_id":product_id, "cart_count":cart_count};
			
			$.ajax({
				type: "post",
				url: "/cart/cartMinus.do",
				data: json,
				success: function(data){
					cartList();
				},
				error: function(){
					cartList();
				}
			});
		}
		
		//------------------------------------------------------------------
		//	cartToBuy()--> cart에서 buy로 넘어가기 
		//------------------------------------------------------------------
		function cartToBuy(account_user){
			var json= {"account_user":account_user}
						
			$.ajax({
				type: "post",
				url: "/cart/cartToBuy.do",
				data: json,
				success: function(){
				},
				error: function(){
				}
			});
		}
		
	</script>
</head>
<style>
	body {
		padding: 30px 20px 0px 20px;
		width: 1417px;
		font-family: 굴림체;
	}
	th {
		font-style: bold;
	}
	#line {
		border: 0;
    	height: 1px;
    	background: #050099;
	}
	#valign {
		vertical-align: middle;
	}
	#count {
		width: 30px;
		text-align: center;
	}
	#plusminus {
		border: 0;
		outline: 0;
		background: #FFFFFF;
	}
	<%--
	#price {
		width: 150px;
   		height: 150px;
  		border: 2px solid #050099;
   		border-radius: 10px;
	}
	#buyInfo {
		width: 450px;
		height: 65px;
		border: 0;
		background: #E7E7E7;
	}
	--%>
</style>
<body>
	<%-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Header ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>
	<header>
		<jsp:include page="../module/Top.jsp" flush="false"/>
	</header>

	<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■--%>
	<div align="center"><h2><label><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;장바구니</label></h2></div><br>
	<div align="center">
		<h5>
			**주문하실 상품명 및 수량을 정확하게 확인해 주세요.**<br><br>
			**구매하기 버튼을 누를 때, 품절 상품은 구매되지 않습니다**
		</h5>
	</div><br><hr id="line">
	
	<%--  ================================== 품절상품 삭제 버튼 ================================ --%>
	<div class="row">
		<div class="col-md-6">
			<c:forEach items="${cartList}" var="cart" >
				<c:set var= "account_user" value="${cart.account_user}"/>
			</c:forEach>
			
			<input type="button" id="deleteOutOfStock" value="품절 상품 삭제" onClick="deleteOutOfStock(${account_user})"/>
		</div>
	</div>
	<br><br><br>
	
	<%-- ================================== cartList column ==================================== --%>
	<div class="container">
	<table class="table">
		<tr height="50" class="info">
			<%-- 삭제, 수량조정 버튼--%>
			<td align= "center" width="50">삭제</td>
			<td align= "center" width="50">수량+</td>
			<td align= "center" width="50">수량-</td>
			
			<%-- cart 상품 list --%>
			<td align= "center" width="50">일시</td>
			<td align= "center" width="50">상품명</td>
			<td align= "center" width="50">담은 수량</td>
			<td align= "center" width="50">재고 수량</td>
			<td align= "center" width="50">가격</td>
			<td align= "center" width="50">사진</td>
		</tr>
	</table>
	</div>
	
	<%-- ================================== cartList value ==================================== --%>
	<div class="container">
		<%-- cartList에 있는거 추출 --%>
		<c:forEach items="${cartList}" var="cart" varStatus="status">
			<input type="text" hidden="true" id="product_id" name="product_id" value="${cart.product_id}">
			<input type="text" hidden="true" id="account_user" name="account_user" value="${cart.account_user}">
			<input type="text" hidden="true" id="cart_date" name="cart_date" value="${cart.cart_date}">
			<input type="text" hidden="true" id="product_name" name="product_name" value="${cart.product_name}">
			<input type="text" hidden="true" id="cart_count" name="cart_count" value="${cart.cart_count}">
			<input type="text" hidden="true" id="product_count" name="product_count" value="${cart.product_count}">
			<input type="text" hidden="true" id="product_price" name="product_price" value="${cart.product_price}">
			<input type="text" hidden="true" id="product_image" name="product_image" value="${cart.product_image}">
		</c:forEach>
		
		<table id = "cartList" class="table">
		</table>
	</div>
	<hr>

	<%--  ====================================== 총 상품 금액 계산 ==================================== --%>	
	<%-- 장바구니에 담겨있는 상품들의 총 금액 --%>
	<div class="row" id="valign">
		<div class="col-sm-offset-1 col-md-2">
			<label id="price"><br><br>상품금액</label>
			<p id="selectedPrice">
			
			</p>
		</div>
		<div class="col-sm-1">
			<br><br><br><img src="../resources/image/minus.jpg">
		</div>
		
		
		<%-- 할인금액 --%>
		<div class="col-md-2">
			<label id="price"><br><br>할인금액</label>
			<p id="discountPrice">
				<h5>0</h5>
			</p>
		</div>
		<div class="col-sm-1">
			<br><br><br><img src="../resources/image/plus.jpg">
		</div>
		
		
		<%-- 배송금액 --%>
		<div class="col-md-2">
			<label id="price"><br><br>배송비</label>
			<p id="shippingPrice">
				<h5>2500</h5>
			</p>
		</div>
		<div class="col-sm-1">
			<br><br><br><img src="../resources/image/result.jpg">
		</div>
		
		
		<%-- 총 결제 금액 --%>
		<div class="col-md-2">
			<label id="price"><br><br>총 결제예정금액</label>
			<p id="totalPrice">
			
			</p>
		</div>
	</div>
	<br><br><br>
	
	<%--=================================== 구매버튼// 누르고 장바구니 비우기 ========================================== --%>
	<div align="center">
		<%-- <a href="${path}/cart/pay.do?account_user=${account_user}&totalPrice="><input type="button" class="btn btn-primary" onClick="cartToBuy(${account_user})" value="구매구매"></a> --%>
		<a id="saleBtn"><input type="button" class="btn btn-primary" onClick="cartToBuy(${account_user})" value="구매구매"></a>
	</div>
	<br>
	
	
	<%--======================================= 부가설명 ========================================== --%>
	<div class="col-md-offset-8">
		<h5><span class="glyphicon glyphicon-hand-right"></span>&nbsp;쿠폰, 적립금은 다음화면인'주문서'에서 확인가능합니다.</h5>
	</div>
	<br><br>
		
	<div align="center">
		<label id="buyInfo">
			<h6 align="center">
				주문 취소는 샛별지역:배송일 전날 19시까지/택배지역:배송일 전날 18시까지<br><br>
				고객센터(1644-1107) 1:1문의 게시판/카카오톡으로 취소 요청 바랍니다.
			</h6>
		</label>
	</div>
	
	<%-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Footer ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>
	<footer>
		<jsp:include page="../module/Bottom.jsp" flush="false"/>
	</footer>
</body>
</html>