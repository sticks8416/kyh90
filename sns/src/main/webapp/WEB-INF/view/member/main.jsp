<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인창</title>
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
<style>
div.container{
border: 1px solid grey; 
padding: 10px 10px 10px 10px;  
margin-top: 15px; 
margin-bottom: 15px;
height: 150px;  
width: 330px; 

overflow: auto


}


</style>
<body>
<%@include file="header.jsp" %>

<c:if test="${empty member}">
	<form action="<c:url value='/member/main/'/>" method="POST" >
<div class="form-group" style="margin:auto;width:40%">
<h2>로그인</h2>
	<label>이메일</label>
		<input type="text" class="form-control" id="email" name="email" placeholder="E-mail" required>
<div class="check_font" id="id_check"></div>
<label>비밀번호</label>
		<input type="password" class="form-control" id="password" name="password" placeholder="PASSWORD" required>

<p></p>
				<button class="btn btn-success" onclick= "location.href=<c:url value='/board/list/${member.email}'/>">로그인</button>
	<a class ="btn btn-danger" href =<c:url value="/member/matchPW"/>>비밀번호 찾기</a>
			<a class ="btn btn-warning" href =<c:url value="/member/signup"/>>회원가입</a>
	</div>			
	</form>
	</c:if>
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

</script>
</html>