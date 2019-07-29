<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>

<script type="text/javascript">
    
        function init(){
            setComboValue("MemberVO.getAccount_email2()%>");
        }
 
        function setComboValue(val) 
        {
            var selectMail = document.getElementById('mail2'); // select 아이디를 가져온다.
            for (i = 0, j = selectMail.length; i < j; i++)  // select 하단 option 수만큼 반복문 돌린다.
            {
                if (selectMail.options[i].value == val)  // 입력된값과 option의 value가 같은지 비교
                {
                    selectMail.options[i].selected = true; // 같은경우라면 체크되도록 한다.
                    break;
                }
            }
        }
        
        // 비밀번호 입력여부 체크
        function checkValue() {
            if(!document.userInfo.password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
        }
        
</script>



<%-- =============================== top =========================================--%>
	<%@ include file = "../module/Top.jsp" %>
</head>
<body>
<h1>마이페이지</h1>
<hr>

<%-- =============================== contents =======================================--%>
<div>
		<form class="form-horizontal" method="post">
		
			<!-- <div class="form-group">
			  	<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
			 	 <div class="col-sm-10">
			    	<input type="email" class="form-control" id="inputEmail3" placeholder="Email">
			  	</div>
			</div> -->
		
		
		<!-- 
			<div class="form-group">
				<label class=" control-label">아이디</label>
				<div class="input-group">
					
					<input type="text" class="form-control" name="account_user" maxlength="20" placeholder="Enter Title" aria-label="Amount (to the nearest dollar)"  aria-describedby="basic-addon2">
					<span class="input-group-addon" id="basic-addon2">@example.com</span>
				</div>
			</div>
 -->
			<div class="form-group">
				<label for="" class="col-md-4 control-label">아이디</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_user" maxlength="20" value="${login.account_user}">
				</div>
			</div>
			<div class="form-group">
				<label for="" class="col-md-4 control-label">비밀번호</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_password" maxlength="20" value="${login.account_password}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">이름</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_name" maxlength="20" value="${login.account_name}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">전화번호</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_tel" maxlength="20" value="${login.account_tel}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">주소</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_address" maxlength="50" value="${login.account_address}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">생년월일</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_age" maxlength="20" value="${login.account_age}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">성별</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_gender" maxlength="20" value="${login.account_gender}">
				</div>
			</div>
			
			
			<div class="form-group">
				<label class="col-md-4 control-label">E-Mail</label>
				
				<div class="col-md-4">
					<div class="input-group">
						<input type="text" class="form-control" name="account_email1" value="${login.account_email}" maxlength="20" placeholder="Enter E-mail" aria-label="Amount (to the nearest dollar)"  aria-describedby="basic-addon2">
						<span class="input-group-addon" id="basic-addon2">@</span>
						
						<select class="form-control" name="account_email2" id="email2">
							<option>gmail.com</option>
							<option>naver.com</option>
							<option>hanmail.net</option>
						</select>
					</div>
				</div>
			</div>
			
			
			
			
			
			<hr>
			
			<div class="form-group" align="center">
				<button type="submit" class="btn btn-info"><b>정보수정</b></button>　
				<button type="button" id="btnLogin" class="btn btn-danger" 
				onclick="location.href='dismiss.do?account_user=${login.account_user}'">회원탈퇴</button>		
				
			</div>	
				
				
		</form>
	</div>
	
	<table class="table">
		<thead>
			<tr>
				<th>account_user</th>
				<th>account_password</th>
				<th>account_name</th>
				<th>account_tel</th>
				<th>account_date</th>
				<th>account_address</th>
				<th>account_grade</th>
				<th>account_age</th>
				<th>account_gender</th>
				<th>account_email</th>    	
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${login.account_user}</td>
				<td>${login.account_password}</td>
				<td>${login.account_name}</td>
				<td>${login.account_tel}</td>
				<td>${login.account_date}</td>
				<td>${login.account_address}</td>
				<td>${login.account_grade}</td>
				<td>${login.account_age}</td>
				<td>${login.account_gender}</td>
				<td>${login.account_email}</td>
			</tr>
		</tbody>
	</table> 

<%@ include file = "../module/Bottom.jsp" %>
</body>
</html>