<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기</title>
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
   body{
        background-color: #F6F6F6;
      }
      .right {
  position:fixed;
  width: 220px;
  height: 500px;
  top : 300px;
  right : 0px;
  border: 3px solid grey;
  background-color:dark;
}
butt{
 position:fixed;
 right : 0px;
}
</style>
<body>
<div class="jumbotron text-center" style="margin-bottom:0; padding: 10px 10px 10px 10px">
  <h1>제목 미정</h1>
  <p>부제 미정</p> 
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="topnav-icons fa fa-home w3-left w3-bar-item w3-button" title="Home" style ="font-size:25px; color:white" href="<c:url value="/board/list"/>"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
    </ul>
  </div>
  <form class="form-inline" action="/action_page.php">
    <input class="form-control mr-sm-2" type="text" placeholder="Search">
    <button class="btn btn-success" type="submit">Search</button>
  </form>
  
   <div class="w3-container">
     
  <div class="w3-dropdown-click">
  
    <button onclick="myFunction()" class="fas fa-bars" style= "font-size: 30px"></button>
    <div id="Demo" class="w3-dropdown-content w3-bar-block w3-border">
      <c:if test="${empty member.writer}">
      <a href="<c:url value='/member/main'/>" class="w3-bar-item w3-button">로그인</a>
      <a href="#" class="w3-bar-item w3-button">회원가입</a>
      
      </c:if><!-- <a href="#" class="w3-bar-item w3-button">Link 3</a> -->
       <c:if test="${not empty member.writer}">
      <a href="<c:url value='/member/logout'/>" class="w3-bar-item w3-button">로그아웃</a>
      <a href="#" class="w3-bar-item w3-button">내정보</a>
      
      </c:if>
      </div>
      </div>
</div>
</nav>
<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:20%">

<div class="w3-container">
  <h2></h2>
  <p><img src="../images/${member.profile}" width="200" height="150" alt="no img"></p>

  <div class="w3-panel w3-card" style="width:90%"><p>${member.writer}</p></div>
  <div class="w3-panel w3-card-2" style="width:90%"><p>${member.email}</p></div>
<!--   <div class="w3-panel w3-card-4"><p>w3-card-4</p></div> -->
</div>
</div>
	<!-- action="<c:url value="/board/write"/>"  -->
		<form action="<c:url value="/board/write" />" method="POST" enctype="multipart/form-data" >
    	 <div class="container" style = "border: 1px solid grey; padding: 10px 10px 10px 10px;  
    margin-top: 15px; margin-bottom: 15px;height: auto;  max-width: 500px; min-height: 100px; overflow: auto;">
  <label><input type="text" name="title" placeholder="제목" style = "padding-top: 0px; padding-bottom: 0px"></label>
   <div class="w3-panel w3-border-top w3-border-bottom" style = "margin-top: 0px; margin-bottom: 0px">
    <h5><!-- <input type="text" name="" > -->${member.writer}<!-- <input type="text" name="regDate" > -->액션 실행시 regdate값 db로(숨김)</h5>
    
    </div>
      <div>
      <label><input type="text" name="content" placeholder="글 내용" style="width:250%;height:300px">	</label><!-- content,regdate 안됨 -->
       </div>
       <div class="w3-panel w3-border-top w3-border-bottom">
        <div><input type="file" name="filename"></div>
        </div>
    	<div style = "float:right">
					<input type="submit" value="등록">
					<input type="submit" value="목록"><a href="<c:url value="/board/list"/>"></a></div>
					</div>
					
		</form>
<div class ="right">
 <div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">

<div class="w3-container">
  <h2></h2>
  <p>친구목록</p>

  <div class="w3-panel w3-card"><p>친구 1</p></div>
  <div class="w3-panel w3-card-2"><p>친구 2</p></div>
  <div class="w3-panel w3-card-4"><p>친구 3</p></div>
</div>
</div>
</div>
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
 
<!-- <div class="jumbotron text-center" style="margin-bottom:0; padding: 10px 10px 10px 10px">
  <p>Copyright 2019 Yeonheung Kang</p>
</div> -->
</body>
</html>