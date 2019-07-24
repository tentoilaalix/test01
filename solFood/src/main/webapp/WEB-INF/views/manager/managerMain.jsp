<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>manager main</title>
	<meta name="viewport" content="width=device-width. initial-scale=1">
	<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
	
	<%-- <%@ include file = "../module/managerTop.jsp" %> --%>
	
</head>
<body>
	<%--■■■■■■■■■■■■■■■■■■■■■■ top & menu ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<jsp:include page="../module/managerTop.jsp"/>
	
	<br>
		
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	
	<div class="container">
	<article class="message is-dark">
	  <div class="message-body">
	    Lorem ipsum dol <strong>Pellentesque risus mi</strong>ravida puruet dictum <a>felis venenatis</a> efficitur. Aenean ac <em>eleifend lacus</em>, in mollis lectsem.
	  </div>
	</article>
	</div>
	
	<section class="section has-background-light">
		<div class="container">
			<h1 class="title">관리자 페이지</h1>				
			<div class="columns">
				<div class="column">
					<div class="notification is-info">
						<h1 class="title is-size-4">111?</h1>
						<p class="is-size-5">
							공지사항1231231231
						</p>
					</div>
				</div>
				
				
				<div class="column">
					<div class="notification is-primary">
						<h1 class="title is-size-4">…222</h1>
						<p class="is-size-5">
							ㅁㄴㅇㄴㅇㅁㄴㅇㅁㄴㅇㄴㅁ
						</p>
					</div>
				</div>
				<div class="column">
					<div class="notification is-warning">
						<h1 class="title is-size-4">333?</h1>
						<p class="is-size-5">
							ㄴㅇㅎㅁㅎㄴㄴㅁㅎㅇㅎㄴㅇㅎㄴㅁ
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	<jsp:include page="../module/managerBottom.jsp" flush="false"/>
</body>
</html>