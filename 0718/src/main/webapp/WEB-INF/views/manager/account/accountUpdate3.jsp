<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
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
	<h2>회원정보수정</h2>
	<hr>
	
	<div class="container">
		<form class="form-horizontal" method="post">
		
 			<div class="form-group">
				<label class="col-md-4 control-label">회원등급</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_grade" maxlength="20" value="${accountUpdate.account_grade}">
					
				</div>
			<h6>1:일반회원&emsp;&emsp;9:관리자</h4>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">가입날짜</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_date" maxlength="20" value="${accountUpdate.account_date}" readonly="readonly">
				</div>
			</div>
			
 			<hr>
			<div class="form-group">
				<label class="col-md-4 control-label">아이디</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="" maxlength="20" value="${accountUpdate.account_user}" readonly="readonly">
					
				</div>
			</div>
			<div class="form-group">
				<label for="" class="col-md-4 control-label">비밀번호</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_password" maxlength="20" value="${accountUpdate.account_password}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">이름</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_name" maxlength="20" value="${accountUpdate.account_name}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">전화번호</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_tel" maxlength="20" value="${accountUpdate.account_tel}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">주소</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_address" maxlength="50" value="${accountUpdate.account_address}" >
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">생년월일</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_age" maxlength="20" value="${accountUpdate.account_age}" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">성별</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_gender" maxlength="20" value="${accountUpdate.account_gender}" readonly="readonly">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-md-4 control-label">E-Mail</label>
				
				<div class="col-md-4">
					<div class="input-group">
						<input type="text" class="form-control" name="account_email" maxlength="20" placeholder="Enter E-mail" aria-label="Amount (to the nearest dollar)"  aria-describedby="basic-addon2" value="${accountUpdate.account_email}" >
						<span class="input-group-addon" id="basic-addon2">@</span>
						<input type="text" class="form-control" name="account_email2" maxlength="20" placeholder=".com">
					</div>
				</div>
			</div> 
			
			<hr>
			
			<div class="form-group" align="center">
				<button type="submit" class="btn btn-success"><b>수정완료22</b></button>
			</div>		
		</form>
	</div>
		
		
</body>
</html>