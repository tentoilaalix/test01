<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 양식</title>
	<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="../resources/css/animate.css" rel="stylesheet">
	<script src="../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.5/css/bulma.min.css">
    <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
    
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<script>
		// 아이디 중복 체크
		$("#idCheck").click(function(){
			idCheck();
		});

		// '가입'버튼 눌렀을 때 최종 체크--> 비밀번호, 아이디, 전화번호, 생년월일 체크
		$("#finalCheck").click(function(){
			emailCheck();
			passwordCheck();
			ageCheck();
			telCheck();
		});
				
		//------------------------------------------------------------------
		//	idCheck()--> 아이디 중복체크 
		//------------------------------------------------------------------
		function idCheck(){
			var account_user = document.getElementsByName("account_user")[0].value;
			var json={"account_user":account_user};
			
			$.ajax({
				type: "post",
				url: "/member/check_id.do",
				data: json,
				success: function(data){
					if(data== "success"){
						alert("사용가능한 아이디입니다");	
					} else{
						alert("중복된 아이디입니다. 다시 설정해주세요");
						history.back();
					}
				},
				error: function(){
				}
			});
		}

		//------------------------------------------------------------------
		//	emailCheck()--> 이메일 중복체크 
		//------------------------------------------------------------------
		function emailCheck(){
			var account_user = document.getElementsByName("account_email")[0].value;
			var json={"account_email":account_email};
			
			$.ajax({
				type: "post",
				url: "/member/check_email.do",
				data: json,
				success: function(data){
					if(data== "fail"){
						alert("중복된 이메일입니다. 다시 설정해주세요");
						history.back();
					}
				},
				error: function(){
				}
			});
		}

		//------------------------------------------------------------------
		//	passwordCheck()--> 비밀번호 체크
		//------------------------------------------------------------------
		function passwordCheck(){
			var account_password = document.getElementsByName("account_password")[0].value;
			var account_repassword= document.getElementsByName("account_repassword")[0].value;

			// 비밀번호 4자리 미만 체크
			if(account_password.length< 4){
				alert("비밀번호를 4자리 이상 입력해주세요");
				history.back();
			}
			
			// 비밀번호, 재비밀번호 일치 체크
			if(account_password!= account_repassword){
				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
				history.back();
			}
		}

		//------------------------------------------------------------------
		//	ageCheck()--> 생년월일 8자리 적었는지 확인
		//------------------------------------------------------------------
		function ageCheck(){
			var account_age = document.getElementsByName("account_age")[0].value;
			if(account_age.length!= 6){
				alert("생년월일을 8자리로 표기해주세요");
				history.back();
			}
		}

		//------------------------------------------------------------------
		//	telCheck()--> 전화번호 11자리 적었는지 확인
		//------------------------------------------------------------------
		function telCheck(){
			var account_tel = document.getElementsByName("account_tel")[0].value;
			if(account_tel.length!= 11){
				alert("전화번호를 11자리로 표기해주세요");
				history.back();
			}
		}
	</script>
	
	<style>
	.button {
	  background-color: #4CAF50; /* Green */
	  border: none;
	  color: white;
	  padding: 12px 22px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 14px;
	  margin: 0px 0px;
	  -webkit-transition-duration: 0.4s; /* Safari */
	  transition-duration: 0.4s;
	  cursor: pointer;
	}
	
	.button1 {
	  background-color: white; 
	  color: black; 
	  border: 2px solid #4CAF50;
	}
	
	.button1:hover {
	  background-color: #4CAF50;
	  color: white;
	}

	</style>
	
</head>


<body>
	<%--====================================== top ====================================== --%>
	<%@ include file = "../module/Top.jsp" %>
	
	
	<%--====================================== content ====================================== --%>
	<div class="container">
		<h1>회원가입</h1>
		<hr><br>
	
		<div>
			<form class="form-horizontal" method="post" action="${path}/member/joinMemberPro.do">
				<div class="form-group">
					<label for="" class="col-md-4 control-label">아이디</label>
					<div class="col-md-4">
						<input type="text" class="form-control" name="account_user" maxlength="20" placeholder="Enter ID">
					</div>
					<button id="idCheck" onclick="idCheck()"  class="btn btn-danger"><b>id 중복체크</b></button>
				</div>
				<div class="form-group">
					<label for="" class="col-md-4 control-label">비밀번호(4자리 이상)</label>
					<div class="col-md-4">
						<input type="text" class="form-control" name="account_password" maxlength="20" placeholder="Enter Password">
					</div>
				</div>
				<div class="form-group">
					<label for="" class="col-md-4 control-label">비밀번호 확인</label>
					<div class="col-md-4">
						<input type="text" class="form-control" name="account_repassword" maxlength="20" placeholder="Enter Password">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label">이름</label>
					<div class="col-md-4">
						<input type="text" class="form-control" name="account_name" maxlength="20" placeholder="Enter Name">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label">전화번호(ex 010-1234-5678)</label>
					<div class="col-md-4">
						<input type="text" class="form-control" name="account_tel" maxlength="11" placeholder="Enter Tel">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label">주소</label>
					<div class="col-md-4">
						<input type="text" class="form-control" name="account_address" maxlength="50" placeholder="Enter Address">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label">생년월일(ex 19910101)</label>
					<div class="col-md-4">
						<input type="text" class="form-control" name="account_age" maxlength="8" placeholder="Enter Birth">
						
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label">성별</label>
					<div class="col-md-4" style="padding-bottom: 9px;">
						<label class="radio-inline">
							<input type="radio" name="account_gender" id="inlineRadio1" value="M"> 남
						</label>
						<label class="radio-inline">
							<input type="radio" name="account_gender" id="inlineRadio2" value="F"> 여
						</label>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label">E-Mail</label>
					<div class="col-md-4">
						<input type="text" class="form-control" name="account_email" maxlength="100" placeholder="Enter E-mail" aria-label="Amount (to the nearest dollar)"  aria-describedby="basic-addon2">
					</div>
				</div> 
				<hr>
				<div class="form-group" align="center">
					<button type="submit" onclick="finalCheck()" class="btn btn-success"><b>회원가입</b></button>
				</div>		
			</form>
		</div>
	</div>
	<br><br><br>
	
	<%--====================================== bottom ====================================== --%>
	<%@ include file = "../module/Bottom.jsp" %>
</body>
</html>