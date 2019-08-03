<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="header.jsp" %>

<div style = "width:40%; position:relateive; margin:auto">
<h2>회원가입</h2>
		<form action="<c:url value="/member/signup"/>" method="POST">
		
				<!-- 아이디 -->
<div class="form-group" style="margin:auto">
	<label for="user_email">이메일</label>
		<input type="text" class="form-control" id="email" name="email" placeholder="E-mail" required>
<div class="check_font" id="id_check"></div>

	<label for="user_email">비밀번호</label>
		<input type="text" class="form-control" id="password" name="password" placeholder="PASSWORD" required>

	<label for="user_email">비밀번호 체크</label>
		<input type="text" class="form-control" id="password2" name="password2" placeholder="Confirm PASSWORD" required>
<label for="user_email">이름</label>
		<input type="text" class="form-control" id="name" name="name" placeholder="NAME" required>

</div>
<p></p>

				<input type="submit" value="회원가입">
						<a href="<c:url value="/board/list" />">목록</a>
		</form>		
		</div>
			<%@include file="footer.jsp" %>
</body>
<script>
function myFunction() {
	  var x = document.getElementById("Demo");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	  } else { 
	    x.className = x.className.replace(" w3-show", "");
	  }
	}	
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#email").blur(function() {
		// id = "id_reg" / name = "userId"
		var user_id = $('#email').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/member/idCheck?userId='+ email,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다 :p");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else {
						
						if(idJ.test(user_id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							$("#reg_submit").attr("disabled", false);
				
						} else if(user_id == ""){
							
							$('#id_check').text('아이디를 입력해주세요 :)');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
							
						} else {
							
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
</script>
</html>