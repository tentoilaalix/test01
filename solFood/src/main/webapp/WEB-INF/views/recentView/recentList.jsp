<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" Content="text/html; charset=UTF-8">
	<title>SolFood doyoon</title>
	<link href="../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		$(document).ready(function(){
			recentList();
		});

		function recentList(){
			var account_user= document.getElementsByName("account_user")[0].value;
			var json= {"account_user":account_user};
			var html="";
			
			$.ajax({
				type: "post",
				url: "/recentList.do",
				data: json,
				success: function(data){
					for(var i=0; i<data.length; i++){
						html+= "<h5>"+ data[i].product_name+ "</h5><br>";
						$("#recent").html(html);
					}
				},
				error: function(){
					alert("recentList ajax fail");
				}
			});

		}
	</script>
</head>	
<body>
	<%-- account_user 값 받기 --%>
	<input type="text" hidden="true" value="${login.account_user}" name="account_user">
	
	<h2>최근 본 상품 페이지 뭐야</h2>
		<div id="rightSide">
		<div id="right_zzim">
			<div  class="recTit">최근본상품 <span id=recentCnt></span></div>
				<ul>	
					<li id="recent">
						
					</li>
				</ul>    <!-- 본 상품이 뿌려질 부분  -->
			<div id="paging"><a class="btn_prev" style="cursor:pointer" >이전</a><span  id="currentPage"></span><span id="totalPageCount"></span><a class="btn_next" style="cursor:pointer" >다음</a></div>
		</div>
	</div> 
</body>
</html>


			
	
			
			









	
	



<%-- <jsp:include page="../module/Bottom.jsp" flush="false"/> --%>

</body>
</html>