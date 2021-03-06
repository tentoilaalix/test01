<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>recipe register</title>
	
	<link href="../../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="../../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../../resources/bootstrap/js/bootstrap.js"></script>
	
	<!-- summer -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
	
	<%@ include file = "../../module/managerTop.jsp" %>
	
	<script>
	var file = document.getElementById("file");
	file.onchange = function(){
	    if(file.files.length > 0)
	    {
	      document.getElementById('filename').innerHTML = file.files[0].name;
	    }
	};
	</script>
	
	<style>
	.select_img img{
		margin: 20px 0px;
	}
	</style>
	<style>
	td {
		vertical-align: middle !important;
	}
	</style>
	
</head>
<body>

	<%--■■■■■■■■■■■■■■■■■■■■■■ top & menu ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<br>
	
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<div class="container">
		<h1 class="title">콘텐츠등록</h1>
		<hr>
	</div>
	
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>
	<div class="container is-fluid">
		<div class="columns is-centered">
			<form class="column is-half" method="post" autocomplete="off" enctype="multipart/form-data">
			
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">이름</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="recipe_name" maxlength="20">
						</div>
					</div>	
				</div>	

				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">키워드</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="recipe_keyword" maxlength="20">
						</div>
					</div>	
				</div>	
			
				<!-- 현재년도 -->
				<c:set var="now" value="<%=new java.util.Date()%>" />
				<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">작성일</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="date" class="input" name="recipe_date" maxlength="20" value="${sysYear}">
							<span class="icon is-small is-right"><i class="fas fa-exclamation-triangle has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">사진</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<div class="select_img">
								<input type="file" class="input" id="recipe_image" name="file">
								<img src="" />
								
								<script>
									$("#recipe_image").change(function(){
										if(this.files && this.files[0]) {
											var reader = new FileReader;
											reader.onload = function(data) {
												$(".select_img img").attr("src", data.target.result).width(200);								
											}
											reader.readAsDataURL(this.files[0]);
										}
									});
								</script>
							</div>
						</div>
					</div>	
				</div>
				<!-- 		
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">내용</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<textarea id="summernote" class="input" name="recipe_content"></textarea>							
						</div>
						<script>
							$(document).ready(function() {
								$('#summernote').summernote({
									height: 400,          // 기본 높이값
									minHeight: null,      // 최소 높이값(null은 제한 없음)
									maxHeight: null,      // 최대 높이값(null은 제한 없음)
									//focus: true,        // 페이지가 열릴때 포커스를 지정함
									lang: 'ko-KR'         // 한국어 지정(기본값은 en-US)
								});
							});
							
							function postForm(){
								$('textarea[name="recipe_content"]').val($('#summernote').summernote('code'));
							}
						</script>
					</div>
				</div>
				 -->
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">내용</label></div><!-- 에디터 -->
					<div class="field-body">
						<div class="field is-expanded">
							<textarea name="recipe_content" id="summernote"></textarea>						
						</div>
					</div>
				</div>
				
				<hr>
				
				<%-- 등록/취소 버튼 --%>
				<div class="field is-grouped is-pulled-right"">
					<div class="control">
						<button class="button is-link" type="submit">등록</button>
					</div>
					<!-- 
					<div class="form-group">
					    <button type="submit" id="register_Btn" name="submit" class="btn btn-primary">등록</button>
					</div>
					 -->
					<div class="control">
						<input class="button is-danger" type="button" value="취소" onclick="history.back();" />
					</div>
				</div>
			</form>
		</div>
		<hr>
	</div>
	
	<jsp:include page="../../module/managerBottom.jsp" flush="false"/>
	<script src="${pageContext.request.contextPath}/resources/js/editor.js"></script>
	
</body>
</html>

