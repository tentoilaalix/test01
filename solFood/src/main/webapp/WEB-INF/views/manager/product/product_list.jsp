<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>product_list</title>
	
	<link href="../../../resources/bootstrap/css/bootstrap.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
	
	<script src="../../../resources/bootstrap/js/bootstrap.js"></script>
	<style>
	td {
		vertical-align: middle !important;
	}
	table {
		font-family: 'SpoqaHanSans-kr';
	}
	</style>
</head>
<body>
	<%--■■■■■■■■■■■■■■■■■■■■■■ top & menu ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<jsp:include page="../../module/managerTop.jsp"/>
	<br>
	
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<div class="container">
		<div class="title" style="vertical-align: bottom;">
			상품현황<a href="${path}/manager/product/product_register.do"><span class="icon"><i class="fas fa-home"></i></span></a>
			
			
			<a class="button is-info" href="${path}/manager/product/product_register.do" style="font-size: small;">상품등록</a>
		</div>
	
		<hr>

		<table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth is-dark">
			<thead>
				<tr>
					<th class="is-dark col-md-1"><abbr title="Product ID">ID.</abbr></th>
					<th class="is-dark col-md-1">NAME</th>
					<th class="is-dark col-md-1">CATEGORY1</th>
					<th class="is-dark col-md-1">CATEGORY2</th>
					<th class="is-dark col-md-1">PRICE</th>
					<th class="is-dark col-md-1"><abbr title="Discount Rate">DIS%</abbr></th>
					<th class="is-dark col-md-1"><abbr title="Total Product Count">CNT</abbr></th>
					<th class="is-dark col-md-1"><abbr title="Thumbnail Image">IMG</abbr></th>
					<th class="is-dark col-md-1"><abbr title="Packaging Type">PACK</abbr></th>
					<th class="is-dark col-md-1"><abbr title="Count per Product">EA</abbr></th>
					<th class="is-dark col-md-1">CONTENT</th>
					<th class="is-dark col-md-1">DATE</th>
					<th class="is-dark col-md-2">CONFIG</th>						
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
						
						<td align="center">${product.product_package}</td>
						<td align="center">${product.product_ea}</td>
						<td align="center">${product.product_content}</td>
						<td align="center">${product.product_date}</td>
						
						<td align="center">
							<a href="productUpdate.do?product_id=${product.product_id}">
								<button type="button" class="button is-info is-small">수정</button>
							</a>
							<a href="productDelete.do?product_id=${product.product_id}">
								<button type="button" class="button is-danger is-small">삭제</button>
							</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>	
		</table>
	</div>
	<jsp:include page="../../module/managerBottom.jsp" flush="false"/>
</body>
</html>