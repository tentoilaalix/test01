<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>recipe update</title>
	
	<link href="../../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="../../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../../resources/bootstrap/js/bootstrap.js"></script>
	
	<!-- summer -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
	 
	<link href="../../../resources/summernote/summernote.css" rel="stylesheet">
	<script src="../../../resources/summernote/summernote.js"></script>
	
	<!-- summer note korean language pack -->
	<script src="../../../resources/summernote/lang/summernote-ko-KR.js"></script>

	<%@ include file = "../../module/managerTop.jsp" %>
	
	<script type="text/javascript">
	$(function() {
		$('.summernote').summernote({
			height: 300,          // 기본 높이값
			minHeight: null,      // 최소 높이값(null은 제한 없음)
			maxHeight: null,      // 최대 높이값(null은 제한 없음)
			focus: true,          // 페이지가 열릴때 포커스를 지정함
			lang: 'ko-KR'         // 한국어 지정(기본값은 en-US)
		});
	});
	</script>
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
	<jsp:include page="../../module/managerTop.jsp"/>
	<br>
	
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<div class="container">
		<h1 class="title">레시피 수정</h1>
		<hr>
	</div>
	
	
	<div class="container is-fluid">
		<div class="columns is-centered">
			<form class="column is-half" method="post" autocomplete="off" enctype="multipart/form-data" action="${path}/manager/recipe/recipeUpdatePro.do?recipe_id=${recipeDetail.recipe_id}">
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">레시피코드</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="recipe_id" maxlength="20" value="${recipeDetail.recipe_id}">
							<span class="icon is-small is-right"><i class="fas fa-lock has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">이름</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="recipe_name" maxlength="20" value="${recipeDetail.recipe_name}">
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">키워드</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="recipe_keyword" maxlength="50" value="${recipeDetail.recipe_keyword}" >
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">사진</label></div>
					
					<div class="field-body">
					
						<div class="field is-expanded">
							<input type="file" class="input" id="recipe_image" name="file"/>
							${recipeDetail.recipe_image}
							<div class="select_img">
								<img src="/img/${recipeDetail.recipe_image}" style="width: 100px; height: auto;"/>						
								<input type="hidden" name="recipe_image" value="${recipeDetail.recipe_image}">
							</div>
								
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
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">내용</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<textarea id="summernote" class="input" name="recipe_content">${recipeDetail.recipe_content}</textarea>							
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
				<hr>
								
				<div class="field is-grouped">
					<div class="control">
						<button class="button is-link" type="submit">수정완료</button>
					</div>
					<div class="control">
						<input class="button is-danger" type="button" value="취소" onclick="history.back();" />
					</div>
				</div>
			</form>
		</div>
	</div>
	
		
	<jsp:include page="../../module/managerBottom.jsp" flush="false"/>
</body>
</html>