<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file = "../module/Top.jsp" %>
	<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" align="center">
		<br><br>
		<h2>회원가입 완료</h2>
	
    	<h3>${account_name}님 환영합니다.</h3><br>
    	<button type="button" class="btn-md btn-success">로그인하기</button>
		<button type="button" class="btn-md btn-primary">메인으로</button>
		<br><br>
	</div>
	<%--========================= bottom ========================= --%>
	<%@ include file = "../module/Bottom.jsp" %>
</body>
</html>