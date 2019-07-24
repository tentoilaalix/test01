<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>account_list</title>
	<link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet">
	<script src="../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../resources/bootstrap/js/bootstrap.js"></script>
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
	<h1 align="center">${member.account_user}</h1><br>
	<hr>

	
</body>
</html>