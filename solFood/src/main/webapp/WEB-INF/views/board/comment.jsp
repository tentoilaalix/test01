<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> --%>
<%-- <%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> --%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="false"%>
<!DOCTYPE >
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.css">
<link href="../resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<script src="../resources/js/jquery-3.3.1.min.js"></script>
<script src="../resources/bootstrap/bootstrap/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() { //페이지 로딩되면 뜨게 만듬	
		getCommentList();
	});

	function getCommentList() {
		var board_num = document.getElementsByName("board_num")[0].value;
		var json = {
			"board_num" : board_num
		};

		$.ajax({
					type : 'post',
					url : '/board/commentList', //boardControlller에 commentList
					data : json,
					// data:$("#commentForm").serialize(),				// contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
					// data:$("#board_num").serialize(),

					success : function(data) {
						var html = "";
						var commentCount = data.length;
						//console.log(data);

						if (data.length > 0) {
							for (i = 0; i < data.length; i++) {
								html += "<table class='table'><h6><strong>"
										+ data[i].reply_writer
										+ "</strong></h6>";
								html += data[i].reply_num + "  ";
								html += "<div class = 'media text-muted pt-3' id= 'comment"+data[i].reply_num+"'>";
								html += data[i].reply_content;
								html += "<button class='btn btn-xs btn-link' onClick= 'cm_updateForm("
										+ data[i].reply_num + ")'>수정</button>";
								html += "<button  class ='btn btn-xs btn-link' onClick= 'cm_delete("
										+ data[i].reply_num + ")'>삭제</button>";
								html += "<tr><td>";
								html += "</td></tr>";
								html += "</div>";
								html += "</table>";
							}
						} else {

							html += "<div>";
							html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
							html += "</table></div>";
							html += "</div>";
						}

						$("#commentCount").html(commentCount);
						$("#commentList").html(html); // # -> id라는 뜻 

					},
					error : function(request, status, error) {
					}
				});
	}
	/*
	 * 댓글 등록하기(Ajax)
	 */

	//댓글 작성 테스트
	function cm_insert(board_num) { // 
		$.ajax({
			type : 'POST', //POST방식으로 
			url : '/board/commentInsert', //url주소는 클라이언트가 HTTP요청을 보낼 서버의 주소
			data : $("#commentForm").serialize(), // 데이터 HTTP요청과 함께 서버로 보낼 데이터를 전달합니다
			success : function(data) { //HTTP요청이 성공했을때 실행할 함수를 정의
				if (data == "success") //성공하면 
				{
					getCommentList(); //리스트를 뿌려준다
					$("#reply_content").val("");//reply_content를 초기화
				}
			},
			error : function(request, status, error) {
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	//펀션으로 댓글 수정창 나오게 함
	function cm_updateForm(reply_num) {
		alert(reply_num);

		var html = " ";
		html = "<input type='text' width='100' name='reply_reComment"+ reply_num +"' id='reply_reComment"+ reply_num +"'>";
		html += "<button type='button' onClick='reply_updateComment("
				+ reply_num + ")'>수정</button>";
		html += "<button type='button' onClick='getCommentList()'>취소</button>";
		$("#comment" + reply_num).html(html);
	}
	//댓글 수정
	function reply_updateComment(reply_num) {
		var reply_reComment = document.getElementsByName("reply_reComment"
				+ reply_num)[0].value;
		var json = {
			"reply_num" : reply_num,
			"reply_reComment" : reply_reComment
		};

		$.ajax({
			type : 'POST',
			url : '/board/commentUpdate',
			data : json,
			success : function() {
				alert("reply_reComment 성공");
				getCommentList();
				// $("#reply_content").val("");	
			},
			error : function() {
				alert("reply_reComment 실패");
			}
		});
	}

	// 댓글삭제
	function cm_delete(reply_num) {
		var json = {
			"reply_num" : reply_num
		};
		if (confirm("삭제하시겠습니까??")) {
			$.ajax({
				type : 'POST',
				url : '/board/commentDelete',
				data : json,
				success : function() {
					alert("삭제 성공");
					getCommentList();
				},
				error : function() {
					alert("삭제 실패");
				}
			});
		}
	}
</script>
</head>
<body>
	<div class="container">
		<form id="commentForm" name="commentForm" method="post">
			<br>
			<br>
			<div>
				<div>
					<span><strong>Comments</strong></span>
					<p>게시판번호 : ${view.board_num}</p>
					댓글수 : <span id="commentCount"></span> <input type="hidden" id="board_num" name="board_num" value="${view.board_num}" />
				</div>
				<div>
					<table class="table">
						<tr>
							<td><textarea style="width: 1100px" rows="3" cols="30"
									id="reply_content" name="reply_content" placeholder="댓글을 입력하세요"></textarea>
								<br>
								<div>
									<a href='#' onClick="cm_insert('${view.board_num}')"
										class="btn pull-right btn-success">등록</a>
								</div></td>
						</tr>
					</table>
				</div>
			</div>
			<input type="hidden" id="board_num" name="board_num"
				value="${view.board_num }" />
			<%--  <input type="hidden" id="reply_num" name="reply_num" value="${comment.reply_num}"/>이걸 쓰면 작성이 안된다	 --%>
		</form>
	</div>
	<div class="container">
		<form id="commentListForm" name="commentListForm" method="post">
			<div id="commentList"></div>
		</form>
	</div>

	<!-- 모달창 테스트 -->
	<%-- <div class="modal fade" id ="modifyModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">댓글 수정창</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label for="reply_writer">댓글 작성자</label>
					<input class="form-control" id="reply_writer" name="reply_writer" readonly>
				</div>
				
				<div class="form-group">
					<label for="reply_content">수정할 댓글 내용</label>
					<input class="form-control" id="newReply_content" name ="newReply_content" placeholder="수정할 댓글 내용을 입력해주세요">
					댓글값 : ${reply_num}
				</div>
			
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
				<a href='#' onClick="cm_update('${reply_num}')" class="btn pull-right btn-success">수정</a>
				<button type="button" class="btn btn-danger modalDelBtn">삭제</button>
			</div>
		</div>
	</div>
</div> --%>


</body>
</html>
