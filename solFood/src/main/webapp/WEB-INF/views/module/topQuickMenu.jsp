<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="../resources/js/sockjs.min.js"/></script>
	<style type="text/css">
		a { text-decoration: none;}
 		a:link { color: black; text-decoration: none !important;}
 		a:active { color: black !important; text-decoration: none !important;}
		a:visited { color: black !important; text-decoration: none !important;}
 		.quickMenu a:hover {
 				background-image: url('../resources/image/check.png');
 				background-repeat: no-repeat;
 				z-index: 999 !important;
 				}
	</style>
	
	<script>
	$(window).scroll(function(){
		var scrollTop = $(document).scrollTop();
		if (scrollTop < 180) {
		 scrollTop = 180;
		}
		$(".quickMenu").stop();
		$(".quickMenu").animate( { "top" : scrollTop + 100 });
		});
	
	$(window).scroll(function(){
		var scrollTop = $(document).scrollTop();
		if (scrollTop < 300) {
		 scrollTop = 300;
		}
		$(".quickChat").stop();
		$(".quickChat").animate( { "top" : scrollTop + 450});
		});
	
	function goTop(){
		$('html').scrollTop(0);
	}
	</script>
	
	<style>
	.quickMenu { 
			position:absolute !important; 
			top:30px; 
			right:1%; 
   			z-index: 10;
		}
	.quickChat { 
			position:absolute !important; 
			top:400px; 
			right:1%; 
   			z-index: 10;
		}
	.goTop {
		width: 50px;
		height: 50px;
		border: none;
		border-radius: 50px;
		background: #47C83E;
		text-align: center;
	}
	#caption {
		font-family: sans-serif;
		font-size: 10px;
		width: 77px;
		display: block;
	}
	
	.chatArea {
		position: fixed;
		right: 20px;
		bottom: 1px;	
	}
	
	</style>
	
</head>
<body>
	<div class="quickMenu" align="right">
		<br>
		<a href="${path}/cart/cartList.do?account_user=${login.account_user}" id="caption"><img src="../resources/image/basket.png" alt="장바구니"><br>장바구니</a><br><br>
		<a href="${path}/one.do" id="caption"><img src="../resources/image/newest.png" alt="최근 본 상품"><br>최근 본 상품</a><br><br>
		<a href="${path}/two.do" id="caption"><img src="../resources/image/like.png" alt="찜한 상품"><br>찜한 상품</a><br><br>
		<a href=""><img src="../resources/image/top.png" id="MOVE_TOP_BTN" alt="맨 위로"></a><br><br>
		<br><br>
	</div><!-- 퀵메뉴 -->
	<div class="quickChat" align="right">
		<div class="chatMenu"><iframe id="chat" src="http://172.16.1.122:8080/chat" style="width: 220px; height: 320px; border: 0;"></iframe></div>
	</div>
<%-- Top 기능 jQuery --%>
<script>
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 300) {
                $('#MOVE_TOP_BTN').fadeIn();
            } else {
                $('#MOVE_TOP_BTN').fadeOut();
            }
        });
        
        $("#MOVE_TOP_BTN").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
    });
</script>
</body>
</html>