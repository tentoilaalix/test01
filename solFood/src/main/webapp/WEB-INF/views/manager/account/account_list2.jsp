<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>account_list</title>
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
	<br><br><br><br>
	
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<h1>회원관리</h1>
	<hr>

	<div class="table-responsive" align="center">
		<table class="table">
			<thead>
				<tr class="info">
					<td class="col-md-1" align="center">USER ACCOUNT</td>
					<td class="col-md-1" align="center">PASSWORD</td>
					<td class="col-md-1" align="center">NAME</td>
					<td class="col-md-2" align="center">TEL</td>
					<td class="col-md-2" align="center">REGISTERED DATE</td>
					<td class="col-md-4" align="center">ADDRESS</td>
					<td class="col-md-1" align="center">ACCOUNT GRADE</td>
					<td class="col-md-1" align="center">AGE</td>
					<td class="col-md-1" align="center">GENDER</td>
					<td class="col-md-2" align="center">EMAIL</td>
					<td class="col-md-2" >CONFIG</td>					
				</tr>	
			</thead>
			<tbody>
				<c:forEach items="${memberList}" var="member">
					<tr>
						<td class="align-middle" align="center">${member.account_user}</td>
						<td align="center" valign="middle">${member.account_password}</td>
						<td align="center">${member.account_name}</td>
						<td align="center">${member.account_tel}</td>
						<td align="center">${member.account_date}</td>
						<td align="center">${member.account_address}</td>
						<td align="center">${member.account_grade}</td>
						<td align="center">${member.account_age}</td>
						<td align="center">${member.account_gender}</td>
						<td align="center">${member.account_email}</td>
						<td align="center">
							<a href="accountUpdate.do?account_user=${member.account_user}">
								<button type="button" id="btnLogin" class="btn btn-info btn-xs">수정</button>
							</a>
							<a href="accountDelete.do?account_user=${member.account_user}">
								<button type="button" id="btnLogin" class="btn btn-danger btn-xs">삭제</button>
							</a>
							
						</td>
					</tr>
				</c:forEach>
			</tbody>	
		</table>
	</div>
	
</body>
</html>