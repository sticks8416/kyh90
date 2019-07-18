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
<body>
<body>
	<c:if test="${empty member}">
	<form action="<c:url value='/member/main/'/>" method="POST" >
		 <div class="container" style = "border: 1px solid grey; padding: 10px 10px 10px 10px;  
    margin-top: 15px; margin-bottom: 15px;height: auto;  max-width: 500px; min-height: 100px; overflow: auto;">
	<div>
	<div>
	<label><input type="text" name="writer" placeholder="아이디" style = "padding-top: 0px; padding-bottom: 0px"></label>
	<label><input type="text" name="pass" placeholder="비밀번호" style = "padding-top: 0px; padding-bottom: 0px">	</label>

		</div>
		<input type="submit" value="로그인"><a href="<c:url value='/board/list/${member.writer}'/>"></a>
					<input type="submit" value="목록"><a href="<c:url value="/board/list"/>"></a></div>
					</div>
	</form>
	</c:if>
	<c:if test="${!empty authInfo}">
	<p>${authInfo.name}님 환영합니다.</p>
	<p>
		<a href="<c:url value='/edit/changePassword'/>">[비밀번호 변경]</a>
		<a href="<c:url value='/logout'/>">[로그아웃]</a>
	</p>
	</c:if>
					
</body>
</body>
</html>