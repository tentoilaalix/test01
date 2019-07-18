<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>buy_list</title>
		
	<link href="../../../resources/bootstrap/css/bootstrap.css" rel="stylesheet">
	<script src="../../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../../resources/bootstrap/js/bootstrap.js"></script>
	<style>
	td {
		vertical-align: middle !important;
	}
	</style>
</head>
<body>
	<%--■■■■■■■■■■■■■■■■■■■■■■ top & menu ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<jsp:include page="../../module/managerTop.jsp"/>
	<br>
	
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<div class="container">
	<h1 class="title">판매관리</h1>
	<hr>

		<table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth is-dark">
			<thead>
				<tr>
					<th class="is-dark"><abbr title="Buy ID">no.</abbr></th>
					<th class="is-dark">DATE</th>
					<th class="is-dark">ADDRESS</th>
					
					<th class="is-dark">TEL</th>
					<th class="is-dark">DELIVERY</th>
					<th class="is-dark"><abbr title="Total Price">PRICE</abbr></th>
					
					<th class="is-dark">NAME</th>
					<th class="is-dark"><abbr title="Ordered User">USER</abbr></th>
					<th class="is-dark"><abbr title="Orederd Product">PRODUCT</abbr></th>
					
					
					
					<th class="is-dark">PRO</th>
					
					
					<th class="is-dark">CONFIG</th>						
					
					<th class="is-dark"><abbr title="Ordered Product Count">CNT</abbr></th>
					<th class="is-dark"><abbr title="Count per Product">EA</abbr></th>
				</tr>	
			</thead>
			<tbody>
				<c:forEach items="${productList}" var="product">
					<tr class="is-size-7">
						
						<td align="center">
							<a href="productUpdate.do?product_id=${buy.buy_id}">
								<button type="button" class="button is-info is-small">수정</button>
							</a>
							<a href="productDelete.do?product_id=${buy.buy_id}">
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