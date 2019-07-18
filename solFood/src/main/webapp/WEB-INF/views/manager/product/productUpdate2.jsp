<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>product update</title>
	<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<%--■■■■■■■■■■■■■■■■■■■■■■ top & menu ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<jsp:include page="../../module/managerTop.jsp"/>
	<br><br><br>
	
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>
	<h2 align="center">상품 정보 수정</h2>
	
	<div class="container">
	<form method="post" name="productUpdateForm" action="/productUpdatePro">
		<table class="table table-bordered table-striped nanum table-hover">
			<colgroup>
				<col class="col-sm-1">
				<col class="col-sm-3">
			</colgroup>
			
			<tr>
				<td>ID</td>
				<td align="left">
					<input type="text" size="50" maxlength="50" name="product_id" value="${productById.product_id}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>NAME</td>
				<td align="left">
					<input type="text" size="50" maxlength="50" name="product_name" value="${productById.product_name}">
				</td>
			</tr>
			<tr>
				<td>CATEGORY1</td>
				<td align="left">
					<input type="text" size="50" maxlength="50" name="product_category1" value="${productById.product_category1}">
				</td>
			</tr>
			<tr>
				<td>CATEGORY2</td>
				<td align="left">
					<input type="text" size="50" maxlength="50" name="product_category2" value="${productById.product_category2}">
				</td>
			</tr>
			<tr>
				<td>PRICE</td>
				<td align="left">
					<input type="text" size="50" maxlength="50" name="product_price" value="${productById.product_price}">
				</td>
			</tr>
			<tr>
				<td>DISCOUNT RATE</td>
				<td align="left">
					<input type="text" size="50" maxlength="50" name="product_discountrate" value="${productById.product_discountrate}">
				</td>
			</tr>
			<tr>
				<td>COUNT</td>
				<td align="left">
					<input type="text" size="50" maxlength="50" name="product_count" value="${productById.product_count}">
				</td>
			</tr>
			<tr>
				<td>IMAGE</td>
				<td align="left">
					<input type="text" size="50" maxlength="50" name="product_image" value="${productById.product_image}">
				</td>
			</tr>
			<tr>
				<td>PACKAGE</td>
				<td align="left">
					<input type="text" size="50" maxlength="50" name="product_package" value="${productById.product_package}">
				</td>
			</tr>
			<tr>
				<td>EA</td>
				<td align="left">
					<input type="text" size="50" maxlength="50" name="product_ea" value="${productById.product_ea}">
				</td>
			</tr>
			<tr>
				<td>CONTENT</td>
				<td align="left">
					<input type="text" size="50" maxlength="50" name="product_content" value="${productById.product_content}">
				</td>
			</tr>
			<tr>
				<td>DATE</td>
				<td align="left">
					<input type="text" size="50" maxlength="50" name="product_date" value="${productById.product_date}">
				</td>
			</tr>
			
			<%--========================== 수정/ 취소 버튼 =================================--%>
			<tr class="info">
				<td colspan="2" align="center">
					<input type="submit" class="btn btn-primary" value="수정"	>
					<a href="product_list"><input type="button" class="btn btn-warning" value="취소"></a>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>