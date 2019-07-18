<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file = "../module/Top.jsp" %>
	
</head>
<body>
<h1>게시판1</h1>
	<div class="row">			
		<div class="" align="center">
	    <strong><input type="button" value="회원관리★" onclick="location.href='/member/status.do'"></strong>
	    <hr>
	    <strong><input type="button" value="관리자 페이지" onclick="location.href='/manager/managerMain.do'"></strong>
	    <hr>
		<a href="${path}/manager/account/account_list.do">회원관리</a>
			<c:choose>
			    <c:when test="${sessionScope.userId == null}">
			        <a href="${path}/member/login.do"><strong>로그인&nbsp;</strong></a>&nbsp;｜&nbsp;
			        <a href="${path}/member/joinMember.do"><strong>회원가입&nbsp;</strong></a>
			    </c:when>
			    <c:otherwise>
			        ${sessionScope.userId}님이 로그인중입니다.&nbsp;
			        ${sessionScope.userId}님의 회원등급은 ${sessionScope.userGrade}.&nbsp;
			        <a href="${path}/member/logout.do"><strong>로그아웃</strong></a>
			    </c:otherwise>
			</c:choose>
		</div>
	</div>
			
</body>
</html>