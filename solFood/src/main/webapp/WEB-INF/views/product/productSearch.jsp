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
	<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
		type="text/css" />
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="../module/Top.jsp" flush="false"/>
<br>
	<br>
	<br>
	검색어  <%= request.getParameter("keyword_p") %>
	<%-- <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth is-dark">
		<thead>
			<tr>
				<!-- <th class="is-dark col-md-1"><abbr title="Product ID">ID.</abbr></th> -->
				<th class="is-dark col-md-1">NAME</th>
				<th class="is-dark col-md-1">CATEGORY1</th>
				<th class="is-dark col-md-1">CATEGORY2</th>
				<th class="is-dark col-md-1">PRICE</th>
				<th class="is-dark col-md-1"><abbr title="Discount Rate">DIS%</abbr></th>
				<th class="is-dark col-md-1"><abbr title="Total Product Count">CNT</abbr></th>
				<th class="is-dark col-md-1"><abbr title="Thumbnail Image">IMG</abbr></th>
			</tr>	
		</thead>
		<tbody>
			<c:forEach items="${productList}" var="product">
				<tr class="is-size-7">
					<td align="center">${product.product_id}</td>
					<td align="center">${product.product_name}</td>
					<td align="center">${product.product_category1}</td>
					<td align="center">${product.product_category2}</td>
					<td align="center">${product.product_price}</td>
					<td align="center">${product.product_discountrate}%</td>
					<td align="center">${product.product_count}</td>
					<td align="center"><abbr title="${product.product_image}"><img src="/img/${product.product_image}" style="width:50px; height:auto;"/></abbr></td>
					
				</tr>
			</c:forEach>
		</tbody>	
	</table> --%>
	<div class="container" id="allVegeC">
				<c:forEach items="${productList}" var="product">
			
					<div class="col-xs-4" align="center">
				
						<!--===================  상품 id, 사진, 이름, 찜하기, 가격 순 ========================-->
						<input type="text" hidden="true" value= "${product.product_id}" name="product_id"/>
						<a href="${path}/product/productInfo.do?product_id=${product.product_id}"><img src="/img/${product.product_image}" style="width:200px; height:auto;"/></a><br><br>				     
				      	${product.product_name}&nbsp;
				 
				 		<!-- login 값이 없으면 하트 안보이게 -->
				 		<c:choose>
						    <c:when test="${login.account_user== null}">
								<br>
						    </c:when>
						    <c:otherwise>
						   		<input type="button" id='heartImage' name='heartImage${product.product_id}' onclick= "changeHeart(${product.product_id},1809)" class='beforeClick' style="width:29px; height:23px;"><br>
						    </c:otherwise>
						</c:choose>

						<a href="${path}/product/productInfo.do?product_id=${product.product_id}"><fmt:formatNumber value="${product.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
					</div>
				</c:forEach>
				</div>
</body>
</html>