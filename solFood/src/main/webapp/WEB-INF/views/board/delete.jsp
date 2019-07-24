<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- ============================================================================================ -->

<!DOCTYPE html>

<html>

<head>
<title>게시물 목록</title>

<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</head>


<body>
	<div class="container">
		<h1 align="center">${view.board_title}의게시글 삭제</h1>
		<br>
		<form class="form-horizontal" method="post">
			<input type="hidden" name="board_num" value="${view.board_num}" />

			<div class="form-group">
				<label class="control-label col-sm-2">제목</label>
				<div class="col-sm-3">
					<input type="text" name="board_title" value="${view.board_title}" readonly="readonly" />
				</div>
			</div>

			<br>
			<br> <br>
			<br>
			<br>

			<h4 align="center">정말로 삭제 하시겠습니까?</h4>
			<div class="control-label- col-sm-8" align="right">
				<button type="submit" class="btn btn-danger">삭제</button>
			</div>

		</form>
	</div>
</body>

</html>
