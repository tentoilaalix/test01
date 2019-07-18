<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SolFood</title>
	<link href="../../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="../../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../../resources/bootstrap/js/bootstrap.min.js"></script>
	<script>
		function insertToCart(product_id, account_user){			
			var purchase_count= document.getElementsByName("purchase_count")[0].value;
			var json= {"product_id":product_id, "account_user":account_user, "purchase_count":purchase_count};
			
			$.ajax({
				type: "post",
				url: "/cart/cartInsert.do",
				data: json,
				beforeSend: function(xmlHttpRequest){
					xmlHttpRequest.setRequestHeader("AJAX", "true");
				},
				success: function(){					
					alert("장바구니 넣기 완료");

					var result= confirm("장바구니로 이동하시겠습니까?");
					if(result){
						window.location.href= "${path}/cart/cartList.do?account_user="+ account_user;
					}			
				},
				error: function(){
					alert("장바구니 넣기 실패- 로그인을 하고 다시 시도하세요");
				}
			});
		}

	</script>
</head>
<style>
	.name {
		font-size: 25px;
	}
	.content {
		font-weight: normal;
		font-size: 12px;
	}
	.productInfo {
		font-weight: normal;
	}

</style>
<body>
<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Header ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<header>
		<%@ include file = "../module/Top.jsp" %>
	</header>
	<br><br><br><br>
	<c:set var="id" value="${param.product_id}"/>
	
	<%--======================== 상품 정보 ===========================--%>
	<div class="container">
		<div class="row">
			<div class="col-xs-offset-1 col-xs-3">
				<img src="../resources/image/cate1-1.png" width="350px" height="500px;">
			</div>
			
			<div class="col-xs-offset-2 col-xs-4" align="left">
				<c:forEach items="${productList}" var="productList">
					<div class="name">${productList.product_name}</div><br>
					<div class="content">
					${productList.product_category1} -> ${productList.product_category2}<br><br><br>
					</div>
					
					<table class="productInfo">
						<tr>
							<th width="120px" height="30px">판매가</th>
							<td width="200px" height="30px" align="right"><b><del><fmt:formatNumber>${productList.product_price}</fmt:formatNumber> 원</del> → <fmt:formatNumber>${productList.product_price - (productList.product_price * productList.product_discountrate / 100)}</fmt:formatNumber> 원</b></td>
						</tr>
						<tr>
							<th width="120px" height="30px">할인금액</th>
							<td width="200px" height="30px" align="right"><fmt:formatNumber>${productList.product_price * productList.product_discountrate / 100}</fmt:formatNumber> 원</td>
						</tr>
					</table>
					<hr>
					<table>
						<tr>
							<th width="120px" height="30px">재고</th>
							<td width="200px" height="30px" align="right">${productList.product_count}</td>
						</tr>
					</table>
					<hr>
					<table>
						<tr>
							<th width="120px" height="30px">개입</th>
							<td width="200px" height="30px" align="right">${productList.product_ea}</td>
						</tr>
						<tr>
							<th width="120px" height="30px">보관</th>
							<td width="200px" height="30px" align="right">${productList.product_package}</td>
						</tr>
					</table>
					<hr>
					<table>
						<tr>
							<th width="120px" height="30px">상품설명</th>
							<td width="200px" height="30px" align="right">${productList.product_content}</td>
						</tr>
					</table>
					<hr>
					<table>
						<tr>
							<th width="120px" height="30px">유통기한</th>
							<td width="200px" height="30px" align="right">${productList.product_date}</td>
						</tr>
					</table>
					<hr>
					<table>
						<tr>
							<th width="120px" height="30px">구매수량</th>
							<td width="200px" height="30px" align="right"><input type="number" min="1" max="100" value="1" name="purchase_count"></td>
							
							<%--======================== 장바구니 버튼 ===========================--%>
							<td width="200px" height="30px" align="right"><input type="button" class="btn btn-md btn-success" onClick="insertToCart(${productList.product_id},${login.account_user})" value="장바구니"></td>
						</tr>
					</table>
				</c:forEach>
			</div>
		</div>
	</div>
	<hr>
	
	<h2 align="center">여기부터 상세 설명</h2>
	<div class="container">
		곤약무침 곤약무침 
	 	존맛탱구리
	
	
	
	</div>
	
	
<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Footer ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<footer>
	<%@ include file = "../module/Bottom.jsp" %>
	</footer>
</body>
</html>