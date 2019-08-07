<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>managerBoard</title>
<link href="../resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script src="../resources/js/jquery-3.3.1.min.js"></script>
<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<%--■■■■■■■■■■■■■■■■■■■■■■ top & menu ■■■■■■■■■■■■■■■■■■■■■■■■--%>
	<jsp:include page="../module/managerTop.jsp" />
	<br>
	<br>
	<br>
	<br>

	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>
	<!-- ========================================================================================================== -->
	<div class="row">
		<!-- left category -->
		<div class="col-md-2 sidebar">
			<br>
			<br>
			<br>
			<ul class="nav nav-sidebar" align="center">
				<li class=" active"><a href="/board/listPage"
					style="color: #3273dc">BOARD CATEGORY<span class="sr-only">(current)</span></a></li>
				<li><a
					href="/board/managerBoard_category?board_category=notice"
					style="color: #3273dc"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;&nbsp;공지사항</a></li>
				<li><a href="/board/managerBoard_category?board_category=event"
					style="color: #3273dc"><span class="glyphicon glyphicon-gift"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이벤트</a></li>
				<li><a
					href="/board/managerBoard_category?board_category=proposal"
					style="color: #3273dc"><span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;상품제안</a></li>
				<li><a
					href="/board/managerBoard_category?board_category=question"
					style="color: #3273dc"><span
						class="glyphicon glyphicon-question-sign"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q&A</a></li>
				<li><a href="/board/managerBoard_category?board_category=manager_notice"
					style="color: #3273dc"><span
						class="glyphicon glyphicon-eye-open"></span>관리자게시판</a></li>
			</ul>
		</div>
		<!-- ===================매니져 게시글 검색기능================================================================================================` -->
		<div class="col-md-10">
			<div class="container">
				<div align="right">
					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>전체</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>제목</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>내용</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>작성자</option>
						<option value="tc"
							<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>제목+
							내용</option>
						<option value="cw"
							<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>내용
							+ 작성자</option>
						<option value="tcw"
							<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>제목
							+ 내용 + 작성자</option>
					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
					<button type="button" id='searchBtn2' class="btn btn-primary">검색</button>
				</div>
				<!-- ==================매니져게시글=========================================================================================== -->
				<table class="table table-hover">

					<thead>
						<tr>
							<th>번호</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<!-- ================================================================================================ -->
						<c:forEach items="${managerBoard_list}" var="managerBoard_list">
							<tr>
								<td>${managerBoard_list.board_num}</td>
								<td>${managerBoard_list.board_category}</td>
								<td><a
									href="/board/managerBoard_view${pageMaker.makeSearch(pageMaker.cri.page)}&board_num=${managerBoard_list.board_num}">${managerBoard_list.board_title}</a>
								</td>
								<td>${managerBoard_list.account_user}</td>
								<td><fmt:formatDate value="${managerBoard_list.board_date}"
										pattern="yyyy-MM-dd" /></td>
								<td>${managerBoard_list.board_readcount}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- ------------------------------매니져 게시글 페이징------------------------------------------------------------------------------------------------- -->
				<div align="center">
					<c:if test="${pageMaker.prev}">
						<a
							href="managerBoard_listPage${pageMaker.makeSearch(pageMaker.startPage - 1) }">«</a>
					</c:if>

					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="idx">
						<c:out value="${pageMaker.cri.page == idx?'':''}" />
						<a href="managerBoard_listPage${pageMaker.makeSearch(idx)}">${idx}</a>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<a
							href="managerBoard_listPage${pageMaker.makeQuery(pageMaker.endPage +1) }">
							» </a>
					</c:if>

				</div>
				<br> <a href="managerBoard_write" class="btn btn-primary"
					aria-pressed="true"> <span class="glyphicon glyphicon-pencil"></span>
					작성
				</a>
				<!-- --------------------------------------------------------------------------------------------------------------- -->
				<script type="text/javascript"
					src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
				<script type="text/javascript">
					$(document)
							.ready(
									function() {
										$('#searchBtn2')
												.on(
														"click",
														function(event) {
															alert("테스트");
															str = "managerBoard_list"
																	+ '${pageMaker.makeQuery(1)}'
																	+ "&searchType="
																	+ $(
																			"select option:selected")
																			.val()
																	+ "&keyword="
																	+ encodeURIComponent($(
																			'#keywordInput')
																			.val());
															console.log(str);
															self.location = str;

														}); //str에서 어디로 갈지 정해주는 거같음 //self.location
										$('#newBtn').on("click", function(evt) {
											self.location = "regist";
										});
									});
				</script>
			</div>
		</div>
	</div>
</body>
</html>