<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>account_list</title>
	
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
	<br>
	
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<div class="container">
		<h1 class="title">상품등록</h1>
		<hr>
	</div>
	
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>
	<div class="container is-fluid">
		<div class="columns is-centered">
			<form class="column is-half" method="post" autocomplete="off" enctype="multipart/form-data" action="${path}/manager/product/productUpdatePro.do?product_id=${productDetail.product_id}">
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">상품이름</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="product_name" maxlength="20" value="${productDetail.product_name}">
							<span class="icon is-small is-right"><i class="fas fa-lock has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>	
				<hr>
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">대분류</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="product_category1" maxlength="20" value="${productDetail.product_category1}">
							<span class="icon is-small is-right"><i class="fas fa-lock has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">소분류</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="product_category2" maxlength="20" value="${productDetail.product_category2}">
						</div>
					</div>	
				</div>	
				<hr>
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">가격</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="product_price" maxlength="20" value="${productDetail.product_price}">
							<span class="icon is-small is-right"><i class="fas fa-lock has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">할인율</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="product_discountrate" maxlength="20" value="${productDetail.product_discountrate}">
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">재고</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="product_count" maxlength="50" value="${productDetail.product_count}">
							
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">대표사진</label></div>
					
					<div class="field-body">
					
						<div class="field is-expanded">
							<input type="file" class="input" id="product_image" name="file"/>
							${productDetail.product_image}
							<div class="select_img">
								<img src="/img/${productDetail.product_image}" style="width: 100px; height: auto;"/>						
								<input type="hidden" name="product_image" value="${productDetail.product_image}">
							</div>
							<script>
									$("#product_image").change(function(){
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
					<div class="field-label is-normal"><label class="label">보관형태</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="product_package" maxlength="20" value="${productDetail.product_package}">
							<span class="icon is-small is-right"><i class="fas fa-lock has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">포장단위</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="product_ea" maxlength="20" value="${productDetail.product_ea}">
							<span class="icon is-small is-right"><i class="fas fa-lock has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">내용</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<textarea id="summernote" class="input" name="product_content">${productDetail.product_content}</textarea>							
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
								$('textarea[name="product_content"]').val($('#summernote').summernote('code'));
							}
						</script>
					</div>
				</div>
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">유통기한</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="product_date" maxlength="20" value="2018-08-30" value="${productDetail.product_date}">
						</div>
					</div>	
				</div>
				<hr>
				<div class="field is-grouped">
					<div class="control">
						<button class="button is-link" type="submit">상품등록</button>
					</div>
					<div class="control">
						<input class="button is-danger" type="button" value="취소" onclick="history.back();" />
					</div>
					
					<div class="form-group">
					    <button type="submit" id="register_Btn" name="submit" class="btn btn-primary">등록</button>
					</div>
				</div>
				
				
			</form>
		</div>
	</div>
</body>
	<!-- include summernote css/js-->
	<link href="../../../resources/summernote/summernote.css" rel="stylesheet">
	<script src="../../../resources/summernote/summernote.js"></script>
	
	<!-- summer note korean language pack -->
	<script src="../../../resources/summernote/lang/summernote-ko-KR.js"></script>
		
</html>

