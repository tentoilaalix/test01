<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>account_list</title>
	
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- include summernote css/js -->
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
		<h1 class="title">상품등록</h1>
		<hr>
	</div>
	
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>
	<div class="container is-fluid">
		<div class="columns is-centered">
			<form class="column is-half" method="post" autocomplete="off" enctype="multipart/form-data">
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">상품명</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="product_name" maxlength="20">
							<span class="icon is-small is-right"><i class="fas fa-lock has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>	
				<hr>
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">대분류</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="product_category1" maxlength="20">
							<span class="icon is-small is-right"><i class="fas fa-lock has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">소분류</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="product_category2" maxlength="20">
						</div>
					</div>	
				</div>	
				<hr>
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">가격</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="product_price" maxlength="20">
							<span class="icon is-small is-right"><i class="fas fa-lock has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">할인율</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="product_discountrate" maxlength="20">
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">재고</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="product_count" maxlength="50">
							
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">대표사진</label></div>
					
					<div class="field-body">
					
						<div class="field is-expanded">
							<div class="select_img">
								<input type="file" class="input" id="product_image" name="file">
								<img src="" />
								
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
								
								<%-- <%=request.getRealPath("/") %> --%>
								
							</div>
						</div>
					</div>	
				</div>
				
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">보관형태</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="product_package" maxlength="20">
							<span class="icon is-small is-right"><i class="fas fa-lock has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">포장단위</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="product_ea" maxlength="20">
							<span class="icon is-small is-right"><i class="fas fa-lock has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">상품설명</label></div><!-- 에디터 -->
					<div class="field-body">
						<div class="field is-expanded">
							<textarea name="product_content" id="summernote"></textarea>						
						</div>
					</div>
				</div>
				
				
				
				<!-- 드롭다운 -->
				<%-- 	
				<div class="select" >
				  <select name="account_gender" value="${accountUpdate.account_gender}">
				    <option>m</option>
				    <option>f</option>
				  </select>
				</div>
				
				<div class="control" name="account_gender" value="${accountUpdate.account_gender}">
				  <label class="radio">
				    <input type="radio" name="account_gender">
				    m
				  </label>
				  <label class="radio">
				    <input type="radio" name="account_gender">
				    f
				  </label>
				</div> --%>
				
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">유통기한</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="product_date" maxlength="20" value="2012-12-12">
						</div>
					</div>	
				</div>
				<hr>
				<div class="field is-grouped is-pulled-right"">
					<div class="control">
						<button class="button is-link" type="submit">상품등록</button>
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

