<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h1 align="center">${view.board_title}의게시글 수정</h1>
		<br>
		<form class="form-horizontal" method="post">
			<input type="hidden" name="board_num" value="${view.board_num}" />
			<div class="form-group">
				<label class="control-label col-sm-2">제목</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="board_title"
						value="${view.board_title}" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">작성자</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="account_user"
						value="${view.account_user}" readonly="readonly" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">작성날짜</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="board_date"
						value="<fmt:formatDate value="${view.board_date}" pattern="yyyy-MM-dd" />"
						readonly="readonly" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">내용</label>
				<div class="col-sm-3">
					<textarea rows="5" cols="50" name="board_content">${view.board_content}</textarea>
				</div>
			</div>
			<div>
				<div class=" control-label col-sm-3">
					<button type="submit" class="btn btn-primary">수정</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>