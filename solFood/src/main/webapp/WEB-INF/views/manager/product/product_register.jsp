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
							<!-- <span class="icon is-small is-right"><i class="fas fa-lock has-text-grey-dark"></i></span> -->
						</div>
					</div>	
				</div>	
				<hr>
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">대분류</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<div class="select is-multiple">
							  <select multiple size="4" name="product_category1">
							    <option value="채소·과일">채소·과일</option>
							    <option value="국·반찬·요리">국·반찬·요리</option>
							    <option value="면·양념·오일">면·양념·오일</option>
							    <option value="정육·계란">정육·계란</option>
							    <option value="수산·해산">수산·해산</option>
							    <option value="샐러드·간편식">샐러드·간편식</option>
							    <option value="음료·우유·간식">음료·우유·간식</option>
							    <option value="베이커리·델리">베이커리·델리</option>
							  </select>
							</div>
						</div>
					</div>
				</div>
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">소분류</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<div class="select is-multiple">
							  <select multiple size="4" name="product_category2">
							    <option value="기본채소">기본채소</option>
							    <option value="콩나물·버섯류">콩나물·버섯류</option>
							    <option value="양파·마늘·생강·파">양파·마늘·생강·파</option>
							    
							    <option value="국·탕·찌개">국·탕·찌개</option>
							    <option value="밑반찬">밑반찬</option>
							    <option value="김치·장아찌·젓갈">김치·장아찌·젓갈</option>
							    <option value="두부·어묵">두부·어묵</option>
							    <option value="메인요리">메인요리</option>
							    
							    <option value="파스타·면류">파스타·면류</option>
							    <option value="밀가루·가루·믹스">밀가루·가루·믹스</option>
							    <option value="향신료·소스·드레싱">향신료·소스·드레싱</option>
							    <option value="양념·액젓·장류">양념·액젓·장류</option>
							    <option value="소금·설탕·식초">소금·설탕·식초</option>
							    
							    <option value="소고기">소고기</option>
							    <option value="돼지고기">돼지고기</option>
							    <option value="양고기">양고기</option>
							    <option value="닭·오리고기">닭·오리고기</option>
							    <option value="계란·돈까스">계란·돈까스</option>
							    
							    <option value="생선류">생선류</option>
							    <option value="오징어·낙지·문어">오징어·낙지·문어</option>
							    <option value="해산물·조개류">해산물·조개류</option>
							    <option value="김·미역">김·미역</option>
							    <option value="건어물·다시팩">건어물·다시팩</option>
							    
							    <option value="샐러드·도시락">샐러드·도시락</option>
							    <option value="간편식·냉동식품">간편식·냉동식품</option>
							    <option value="죽·수프">죽·수프</option>
							  	<option value="선식·시리얼·그래놀라">죽·선식·시리얼·그래놀라</option>
							    
							    <option value="생수·음료·주스">생수·음료·주스</option>
							    <option value="커피·차">커피·차</option>
							    <option value="우유·두유">우유·두유</option>
							  	<option value="초콜릿·젤리·캔디">초콜릿·젤리·캔디</option>
							    
							    <option value="식빵·뻥류">식빵·빵류</option>
							    <option value="잼·버터·스프레드">잼·버터·스프레드</option>
							    <option value="케이크·파이·디저트">케이크·파이·디저트</option>
							  	<option value="올리브·피클·델리">올리브·피클·델리</option>
							    
							  </select>
							</div>
						</div>
					</div>
				</div>
				<!-- 
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
				 -->
				<hr>
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">가격</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="product_price" maxlength="20">
							<span class="icon is-small is-right"><i class="fas fa-exclamation-triangle has-text-grey-dark"></i></span>
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
							</div>
						</div>
					</div>	
				</div>
				
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">보관형태</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<div class="control has-icons-left">
							<div class="select">
								<select name="product_package">
									<option></option>
									<option>실온</option>
									<option>냉장보관</option>
									<option>냉동보관</option>
								</select>
								</div>
								<span class="icon has-text-danger is-left">
									<i class="fas fa-exclamation-triangle"></i>
								</span>
							</div>
						</div>
					</div>	
				</div>
				
				
				
				
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">포장단위</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="product_ea" maxlength="20">
							<!-- <span class="icon is-small is-right"><i class="fas fa-lock has-text-grey-dark"></i></span> -->
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
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">유통기한</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="product_date" maxlength="20">
							<span class="icon is-small is-right"><i class="fas fa-exclamation-triangle has-text-grey-dark"></i></span>
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

