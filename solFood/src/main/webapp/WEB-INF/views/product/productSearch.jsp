<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품검색</title>
	<link href="../../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="../../../resources/css/component.css" rel="stylesheet">
	<script src="../../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../../resources/bootstrap/js/bootstrap.min.js"></script>
	
	<%-- 하트 --%>
	<script>
		// 페이지가 로드되면 hear list 표시하기 
		$(document).ready(function(){
			heartList();
		});

		//----------------------------------------------------------------
		// 	heartState--> 페이지 로드시 heart 상태 표시
		//----------------------------------------------------------------
		function heartList(){
			var account_user = document.getElementsByName("account_user")[0].value;
			var product_id;
			var html;

			var json= {"account_user":account_user};

			// 삭제하기
			alert(account_user);
			
			// heart table 데이터 받아오기
			$.ajax({
				type: "post",
				datatype: "json",
				url: "/heart/heartList_heartList.do",
				
				success: function(data){
					// 로그인한 아이디가 heart table에 있는 거랑 같은 아이디일때만 그 해당 아이디가 heart누른 product_id를 heartList에 집어넣기					
					for(var i=0; i<data.length; i++){						
						if(data[i].account_user== account_user){								
							$("[name='heartImage"+ data[i].product_id +"']").attr({
								'class' : 'afterClick'
							});							 
						}
					}
				},
				error: function(){
					for(var i=0; i<data.length; i++){						
						if(data[i].account_user== account_user){								
							$("[name='heartImage"+ data[i].product_id +"']").attr({
								'class' : 'afterClick'
							});							 
						}
					}
				}
			});
		}
		
		//----------------------------------------------------------------
		// 	changeHeart--> heart 상태 변경 및 테이블에서 insert or delete
		//----------------------------------------------------------------
		function changeHeart(product_id, account_user){	
			var json;	
			var state;

			// beforeClick이면 afterClick으로, 아니면 그 반대로 해주는거
			$("[name='heartImage"+ product_id +"']").toggleClass("beforeClick afterClick");

			// name에 따른 class 이름 구하기
			var class_by_name= $("[name='heartImage"+ product_id +"']").attr('class');

			// toggleClass하고 나서 afterClick이 되면 heart 테이블에 들어가야하는 거니까 json에 state="click" 보내서 insertHeart가 실행되게 하기
			if(class_by_name== "afterClick"){
				state= "click";
				json= {"product_id":product_id, "state":state, "account_user":account_user};
				
				$.ajax({
					type: "post",
					url: "/heart/changeHeart.do",
					data: json,
					success: function(){
					},
					error: function(){
					}
				});

			// afterClick이었다가 beforeClick으로 바뀌면 state="unclick"으로 보내서 deleteHeart가 실행되게 하기 
			} else if(class_by_name== "beforeClick"){
				state= "unclick";
				json= {"product_id":product_id, "state":state, "account_user":account_user};
				
				$.ajax({
					type: "post",
					url: "/heart/changeHeart.do",
					data: json,
					success: function(){
					},
					error: function(){
					}
				});
			}
		}
	</script>
	<style>
		.afterClick{
			background-image: url("/resources/image/afterlike.PNG");
			border: none;
			outline: none;
			background-size: 28px;
		}
		.beforeClick{
			background-image: url("/resources/image/beforelike.PNG");
			border: none;
			outline: none;
			background-size: 28px;
		}
	</style>
	
	<style>
		@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
		div{
			font-family: 'Noto Sans KR', sans-serif !important;
		}
	</style>
	
</head>
<body>
	<%-- header --%>
	<jsp:include page="../module/Top.jsp" flush="false"/>
	<br><br><br>
	
	<%-- account_user받아오기 --%>
	<input type="text" hidden="true" value="${login.account_user}" name="account_user">
	
	<%-- 검색어 --%>
	<div class="container" align="center">
		<h2>"<%= request.getParameter("keyword_p") %>"</h2>
	</div>
	
	<%-- 검색 결과 --%>
	<div class="container" id="allVegeC">
		<c:forEach items="${productList_search}" var="product">
			
		<div class="col-xs-4" align="center">
				
			<%-- ===================  상품 id, 사진, 이름, 찜하기, 가격 순 ======================== --%>
			<input type="text" hidden="true" value= "${product.product_id}" name="product_id"/>
			<a href="${path}/product/productInfo.do?product_id=${product.product_id}"><img src="/img/${product.product_image}" style="width:200px; height:auto;"/></a><br><br>				     
		   	${product.product_name}&nbsp;
				 
		 		<%--  login 값이 없으면 하트 안보이게 --%>
		 		<c:choose>
				    <c:when test="${login.account_user== null}">
						<br>
				    </c:when>
				    <c:otherwise>
				   		<input type="button" id='heartImage' name='heartImage${product.product_id}' onclick= "changeHeart(${product.product_id},1809)" class='beforeClick' style="width:29px; height:23px;"><br>
				    </c:otherwise>
				</c:choose>

				<a href="${path}/product/productInfo.do?product_id=${product.product_id}"><fmt:formatNumber value="${product.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
		</div>
		</c:forEach>
	</div>
</body>
</html>