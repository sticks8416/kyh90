<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
}
butt{
 position:fixed;
 right : 0px;
}
.s{


}

/* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
</style>
</head>
<body>
<div class="jumbotron text-center" style="margin-bottom:0; padding: 10px 10px 10px 10px">
  <h1></h1>
  <p></p>
  <p><%-- 경로 값 :${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/ --%></p> 
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
<a class="topnav-icons fa fa-home w3-left w3-bar-item w3-button" title="Home" style ="font-size:25px; color:white" href="<c:url value="/board/list"/>"></a>

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">    
      <li class="nav-item">
      </li>    
    </ul>
  </div>&nbsp;&nbsp;&nbsp;
    <a href="<c:url value="/requestList"/>"><i class="far fa-bell" style ="font-size:25px"></i></a>&nbsp;&nbsp;
 <form class="form-inline">
    <input class="form-control mr-sm-2" type="text" placeholder="Search" name ="search">
    <button class="btn btn-success" type="submit">search User</button>
</form>
  <div class="w3-container">   
  <div class="w3-dropdown-click">
    <button onclick="myFunction()" class="fas fa-bars" style= "font-size: 30px"></button>
    <div id="Demo" class="w3-dropdown-content w3-bar-block w3-border">
    <c:if test="${empty member.email}">
      <a href="<c:url value='/member/main'/>" class="w3-bar-item w3-button">로그인</a>
      <a href="#" class="w3-bar-item w3-button">회원가입</a>
      
      </c:if>
       <c:if test="${not empty member.email}">
      <a href="<c:url value='/member/logout'/>" class="w3-bar-item w3-button">로그아웃</a>
      <a href="<c:url value='/member/editProfile/{email}'/>" class="w3-bar-item w3-button">내정보</a>
      
      </c:if>
    </div>
  </div>
</div>
</nav>
<script>
 function myFunction() {
	  var x = document.getElementById("ddc");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	  } else { 
	    x.className = x.className.replace(" w3-show", "");
	  }
	}
</script>

</body>
</html>