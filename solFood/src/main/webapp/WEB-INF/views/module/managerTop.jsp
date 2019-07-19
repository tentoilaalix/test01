<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.*" %>

<!DOCTYPE html>
<html class="has-navbar-fixed-top">
<head>
	<meta charset="UTF-8">
	<title>manager main page</title>
	 
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:700" rel="stylesheet">
	<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.5/css/bulma.min.css">
    <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
 	
 	<style type="text/css">
	 	body {
	 		font-family: 'Nanum Gothic Coding';
	 		font-size: ;
	 	}
	 	p {
	 		vertical-align: middle;
	 	}
 	</style>
 	
</head>
<body>

<nav class="navbar is-black is-fixed-top" style="border-radius: 0px; width: 100%;" id="navbar">
	<div class="container is-black">
		<div class="navbar-brand">
			<a class="navbar-item" href="${path}/manager/managerMain.do">
				<img src="${path}/resources/image/logo0.png" width="95" height="35">
			</a>
		</div>
		
		<div class="navbar-burger burger" onclick="document.querySelector('.navbar-menu').classList.toggle('is-active');">
			<span></span>
			<span></span>
			<span></span>
		</div>

		<div class="navbar-menu">
			<div class="navbar-start">
				<div class="navbar-item has-dropdown is-hoverable">
					
					<a class="navbar-link" href="${path}/manager/product/product_page.do">
						상품관리
					</a>
					
					<div class="navbar-dropdown " data-style="width: 18rem;">
						<a class="navbar-item" href="${path}/manager/product/product_page.do">
							상품현황
						</a>
						<a class="navbar-item" href="${path}/manager/product/product_register.do">
							상품등록
						</a>
					</div>
				</div>
				
				<a class="navbar-item" href="${path}/manager/account/account_page.do">
					회원관리
				</a>
				
				<a class="navbar-item" href="${path}/manager/buy/buy_list.do">
					구매관리
				</a>
				<div class="navbar-item has-dropdown is-hoverable">
					<a class="navbar-link " href="http://bulma.io/blog/">
						통계
					</a>
					<div class="navbar-dropdown " data-style="width: 18rem;">
						<a class="navbar-item" href="/">
							월간 통계
						</a>
		
						<a class="navbar-item" href="/">
							상품 통계
						</a>
					</div>
				</div>
				
				
				
				
			</div>


			<div class="navbar-end">
				<a class="navbar-item" href="${path}/">
					SHOP
					&ensp;
					<span class="icon"><i class="fas fa-home fa-lg"></i></span>
				</a>
				
				<div class="navbar-item has-dropdown is-hoverable">
					
					<p class="navbar-link">
						ADMIN
					</p>
					<div class="navbar-dropdown">
						<p class="navbar-item">관리자 : ${login.account_name}</p>
				        <p class="navbar-item">관리등급 : ${login.account_grade}</p>
				        
				        <hr class="navbar-divider">
						<a href="${path}/member/logout.do" class="navbar-item">Logout</a>
						<form id="logout-form" action="" method="#" style="display: none;"></form>
					</div>
				</div>
			</div>
		</div>
	</div>
</nav>

<div id="blank" style="display:none;">

</div>


</body>

<%-- <body data-spy= "scroll" data-target=".navbar" data-offset="50">

	<jsp:include page="./topMemberCheck.jsp"/>
	=================================== header menu ==============================================
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${path}/manager/managerMain.do">Management</a>
			</div>
			
	=================================== menu ==============================================
			
						
	================================= 관리자 account_name 보여주기 =========================================
						<li id="administer">
							<a href="">관리자: <%= session.getAttribute("userName") %>님</a>
							
						</li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	
	

</body> --%>
</html>