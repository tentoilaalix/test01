<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" Content="text/html; charset=UTF-8">
<title>SolFood소개</title>


	<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/css/default.css" rel="stylesheet" type="text/css">
	<link href="resources/css/subpage.css" rel="stylesheet" type="text/css">

	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	
	
	<style type="text/css">
		a { text-decoration: none;}
 		a:link { color: black; text-decoration: none !important;}
 		a:active { color: black !important; text-decoration: none !important;}
		a:visited { color: black !important; text-decoration: none !important;}
 		a:hover { color: black !important; text-decoration: none !important;}
 		.intro-text{ color: gray!important; text-decoration: none !important;}
 		
 		.sidebar{	font-size: 20px;  }
 		.sub-menu-li{ margin: 10px;}
	</style>
	<Style>



#rightSide{

position: absolute;

top: 547px;

left: 50%;

margin: 0 0 0 510px;

	}

#rightSide #right_zzim {

position: fixed;

top: 126px;

left: 50%;

margin-left: 510px;

border:1px solid #B0B5BD;

width:114px;

height:343px;

}



#rightSide #right_zzim  div {text-align:center;}

#rightSide #right_zzim  div.recTit{line-height:1.5em;padding:5px;color:white;background-color:#505A69;}

#right_zzim #recentCnt {color:yellow;}

#rightSide #right_zzim ul {min-height:495px;}

#rightSide #right_zzim  li{text-align:center;padding:5px;position:relative;} 

#rightSide #right_zzim ul li img {border:1px solid #ccc}

#right_zzim .detail {

display: none;

position: absolute;
top: 3px;

right: 20px;

xheight: 40px;

xpadding: 15px 11px 0;

xbackground: #404a59;

color: #fff;

xtext-align: left;

white-space: nowrap;



}



#right_zzim li:hover .detail {display:block}

#right_zzim li .btn_delete {

position: absolute;

top: 3px;

right: -1px;

width: 11px;

height: 11px;

background: url(/img/sp.png) no-repeat -193px -111px;

text-indent: -9000px;

}

#right_zzim  #currentPage {color:#505A69;font-weight:bold}

#right_zzim  #totalPageCount {color:#CBC8D2;font-weight:bold}

.noData {color:#ccc;text-align:center;margin-top:223px;}



}

#paging {display:;position:relative;line-height:1em;}

#paging .btn_prev {

position: absolute;

top: 526px;

left: 4px;

width: 13px;

height: 11px;

background: url(/images/ico_arrow.png)  no-repeat ;

text-indent: -9000px;

border:1px solid #CCC;

display:inline-block;

}



#paging .btn_next {

position: absolute;

top: 526px;

right: 4px;

width: 13px;

height: 11px;

background: url(/images/ico_arrow.png) -11px 0px;

text-indent: -9000px;

border:1px solid #CCC;

display:inline-block;

}



</style>
</head>
<body>


<h2>최근 본 상품 페이지 뭐야</h2>
	<div id="rightSide">
	<div id="right_zzim">
		<div  class="recTit">최근본상품 <span id=recentCnt></span></div>
			<ul>	
				<c:forEach var="recent" items="${recentList}" varStatus="status">
					<li>${recent.product_name}</li>
				</c:forEach>
			
			</ul>    <!-- 본 상품이 뿌려질 부분  -->
		<div id="paging"><a class="btn_prev" style="cursor:pointer" >이전</a><span  id="currentPage"></span><span id="totalPageCount"></span><a class="btn_next" style="cursor:pointer" >다음</a></div>
	</div>
</div> 




			
	
			
			









	
	



<%-- <jsp:include page="../module/Bottom.jsp" flush="false"/> --%>

</body>
</html>