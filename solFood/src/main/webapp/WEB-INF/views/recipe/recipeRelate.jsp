<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
	<link href="../../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="../../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../../resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
	<div class="recipeHeader" align="center">
		<c:forEach items="${recipeList}" var="List">
			<div align="center" style="font-size: 35px; font-weight: bold; color: #5D5D5D;">
				1: ${List.recipe_keyword}<br>
				2: ${List.recipe_name}<br>
			</div>
		</c:forEach>
		<c:forEach items="${relateProduct}" var="List2">
			<div align="center" style="font-size: 35px; font-weight: bold; color: #5D5D5D;">
				3: ${List2.recipe_keyword}<br>
				4: ${List2.recipe_name}<br>
			</div>
		</c:forEach>
		<c:forEach items="${relateProduct}" var="List3">
			<div align="center" style="font-size: 35px; font-weight: bold; color: #5D5D5D;">
				5: ${List3.recipe_keyword}<br>
				6: ${List3.recipe_name}<br>
			</div>
		</c:forEach>
	</div>
</div>	

</body>
</html>