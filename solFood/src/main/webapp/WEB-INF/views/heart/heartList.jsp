<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>heartList</title>
	<link href="../../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="../../../resources/css/component.css" rel="stylesheet">
	<script src="../../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../../resources/bootstrap/js/bootstrap.min.js"></script>
	<script>
		// 페이지가 로드되면 hear list 표시하기 
		$(document).ready(function(){
			heartList();
		});
		
		//----------------------------------------------
		//	heartList()
		//----------------------------------------------
		function heartList(){
			var account_user = document.getElementsByName("account_user")[0].value;
			var json= {"account_user":account_user};
			
			$.ajax({
				type: "post",
				url: "/heart/heartList2.do",
				data: json,
				success: function(data){
					var html= "";
					var cnt= data.length;
					
					// table에 heart list 붙이기
					if(cnt> 0){	
						for(i=0; i<cnt; i++){
							html+= "<tr height='50' class='info'>";
							html+= "<td align='center' width='100'><input type='button' value='삭제' onclick='insertToHeart("+ data[i].product_id +","+ account_user +")'></td>";
							html+= "<td align='center' width='100'><input type='button' value='삭제' onclick='deleteFromheart("+ data[i].product_id +","+ account_user +")'></td>";
							html+= "<td align='center' width='100'><img src='/img/"+ data[i].product_image +"' style='width:120px; height:auto;'/></td>";
							html+= "<td align='center' width='100'>"+ data[i].product_name+ "</td>";
							html+= "<td align='center' width='100'>"+ data[i].product_price+ "</td>";
							html+= "</tr>";		
						}
						$("#heartList").html(html);
						html= "";
					} else{
						$("#heartList").html(html);
					}
				},
				error: function(){
				}
			});
		}
		
		//----------------------------------------------
		//	insertToHeart()
		//----------------------------------------------
		function insertToHeart(product_id, account_user){
			var state= "click";
			var json= {"account_user":account_user, "product_id":product_id, "state":state};
			
			$.ajax({
				type: "post",
				url: "/heart/changeHeart.do",
				data: json,
				success: function(){
					heartList();
				},
				error: function(){
					heartList();
				}
			});
		}
		
		
		
		//----------------------------------------------
		//	deleteFromHeart()
		//----------------------------------------------
		function deleteFromHeart(product_id, account_user){
			var state= "unclick";
			var json= {"account_user":account_user, "product_id":product_id, "state":state};
			
			$.ajax({
				type: "post",
				url: "/heart/changeHeart.do",
				data: json,
				success: function(){
					heartList();
				},
				error: function(){
					heartList();
				}
			});
		}
	</script>
</head>
<body>
<%--============================== header =================================--%>
	<header>
		<jsp:include page="../module/Top.jsp" flush="false"/>
	</header>

<%--============================== content =================================--%>
	<%-- account_user 받기 --%>
	<input type="text" hidden="true" value="${login.account_user}" name="account_user">

	<%-- 찜한 상품 목록 --%>
	<div class="container">
		<table class="table">
			<tr height="50" class="info">
				<td align= "center" width="50">장바구니 담기</td>
				<td align= "center" width="50">삭제</td>
				<td align= "center" width="50">사진</td>
				<td align= "center" width="50">상품명</td>
				<td align= "center" width="50">가격</td>
			</tr>
		</table>
	</div>
	
	<div class="container">
		<table class="table" id="heartList">
			
		</table>
	</div>
	
	<%-- 버튼--%>
	<div class="container">
		<a href="${path}/"><input type="button" value="메인으로 가기"></a>
		<a href="${path}/cart/cartList.do"><input type="button" value="장바구니로 가기"></a>
	</div>
	<br><br><br><br>

<%--============================== bottom =================================--%>
	<footer>
		<jsp:include page="../module/Bottom.jsp" flush="false"/>
	</footer>
</body>
</html>



