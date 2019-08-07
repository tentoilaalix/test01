<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시물 목록</title>
	<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<%--■■■■■■■■■■■■■■■■■■■■■■ top & menu ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<jsp:include page="../module/managerTop.jsp"/>
	<br>	
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<div class="container">
		<h1 class="title">게시물관리</h1>
		<hr>
		
		<form class="form-horizontal" method="post">
			<div class="form-group">
				<label class="control-label col-sm-2">제목</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="board_title"
						value="${view.board_title}" readonly="readonly" />
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
					<input type="text" name="board_date"
						value="<fmt:formatDate value="${view.board_date}" pattern="yyyy-MM-dd" />"
						readonly="readonly" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">내용</label>
				<div class="col-sm-3">
					<textarea rows="5" cols="50" name="board_content"
						readonly="readonly">${view.board_content} </textarea>
				</div>
			</div>
			<div class="control-label col-sm-3">
				<a href="/board/managerBoard_update?board_num=${view.board_num}" class="btn btn-primary">수정</a> 
				<a href="/board/delete?board_num=${view.board_num}" class="btn btn-primary">삭제</a> 
				<a href="/board/managerBoard_listPage" class="btn btn-primary">리스트</a>
			</div>
		</form>
	</div>

	<jsp:include page="./comment.jsp" />
	<!-- 댓글 include -->


	<jsp:include page="../module/managerBottom.jsp" flush="false"/>
</body>
</html>