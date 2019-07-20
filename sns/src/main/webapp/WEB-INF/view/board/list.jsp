<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!--   <li class="nav-item">
        <a class="nav-link" href="#">내정보</a>
      </li> -->
      <li class="nav-item">
        <a class="nav-link" href="<c:url value="/board/write"/>">글쓰기</a>
      </li>    
    </ul>
  </div>
  <!--  serch기능 구현하기  -->
  <form class="form-inline" action="/action_page.php">
    <input class="form-control mr-sm-2" type="text" placeholder="Search">
    <button class="btn btn-success" type="submit">Search</button>
  </form>
  
  
  
 <!--  <i class="fas fa-bars" style= "float:right; font-size: 30px"> -->
  <div class="w3-container">
     
  <div class="w3-dropdown-click">
  
    <button onclick="myFunction()" class="fas fa-bars" style= "font-size: 30px"></button>
    <div id="Demo" class="w3-dropdown-content w3-bar-block w3-border">
     <c:if test="${member.writer eq null}">
      <a href="<c:url value='/member/main'/>" class="w3-bar-item w3-button">로그인</a>
      <a href="#" class="w3-bar-item w3-button">회원가입</a>
      
      </c:if><!-- <a href="#" class="w3-bar-item w3-button">Link 3</a> -->
       <c:if test="${member.writer eq not null}">
      <a href="<c:url value='/member/logout'/>" class="w3-bar-item w3-button">로그아웃</a>
      <a href="#" class="w3-bar-item w3-button">내정보</a>
      
      </c:if>
    </div>
  </div>
</div>
  <!-- </i>
   -->

  
  
  
  
  
  
</nav>
<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:20%">

<div class="w3-container">
  <h2></h2>
  
  <p><img src="../../images/${member.profile}" width="200" height="150" alt="no img"></p>

  <div class="w3-panel w3-card" style="width:90%"><p>${member.writer}</p></div>
  <div class="w3-panel w3-card-2" style="width:90%"><p>${member.email}</p></div>
       
       	<!-- 플레이스홀더 클릭시 글쓰기 팝업창 나타나도록 구현 -->
        <input type="text" class="form-control" placeholder="글쓰기" name="text1" >
       <a class="butt"><!-- <button type="submit" class="btn btn-secondary" style = "float:right">답글 달기</button> --></a>
</div>
</div>
     <c:forEach var="board" items="${boardList}" varStatus="loop">
    <div class="container" style = "border: 1px solid grey; padding: 10px 10px 10px 10px;  
    margin-top: 15px; margin-bottom: 15px;height: auto;width: 500;  max-width: 600px; min-height: 100px;">
   <p style = "text-align: center;">${board.title}
   <!-- <i class="fas fa-bars" style= "float:right; font-size: 30px"> </i> --></p>
   <div class="w3-panel w3-border-top w3-border-bottom">
    <a style= "text-align:left">${board.writer}</a><a style = "float:right">${board.regDate}</a>
    </div>
     
      <div><img src="../images/${board.images}" width="auto" height="150" alt="no img"></div>
      <div>
      <h4>${board.content}</h4><!-- content,regdate 안됨 -->
       </div>
        <form action="/action_page.php">
        <div class="w3-panel w3-border-top w3-border-bottom" style = "margin: 0px 0px 0px 0px">
       <div class="form-group" style = "padding: 10px 10px 0px 10px" >
       
       <!-- 좋아요 카운팅으로 넘김버튼 -->
       
      <button id="start_ajax">
      <i class="glyphicon glyphicon-thumbs-up" style ="font-size:25px"></i></button>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     

      
       <i class="fas fa-heart" style ="font-size:25px"></i>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
      
      
      
      
      <!-- 수정페이지 넘김버튼 -->
       <a href="<c:url value="/board/edit/${board.num}"/>"><i class="fas fa-file" style ="font-size:25px"></i></a>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
      
      
      
      
      
      <!-- 삭제팝업창으로 넘김버튼 -->
        <a href="<c:url value="/board/delete/${board.num}"/>"><i class="glyphicon glyphicon-remove" style ="font-size:25px"></i></a>
        </div>
       </div>
       <input type="text" class="form-control" placeholder="답글 작성" name="text1" >
       <a class="butt"><button type="submit" class="btn btn-secondary" style = "float:right">답글 달기</button></a>
        
        
        
        </form>
       </div>
 </c:forEach>
  
 <div class ="right">
 <div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
<div class="w3-container">
  <h2></h2>
  <p>친구목록</p>
<c:forEach var="board" items="${boardList}" varStatus="loop">
  <div class="w3-panel w3-card"><p>${board.writer}</p></div>
  </c:forEach>
</div>
</div>
</div>

<div class="jumbotron text-center" style="margin-bottom:0; padding: 10px 10px 10px 10px">
  <p>Copyright 2019 Yeonheung Kang</p>
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
$("#start_ajax").click(function(){
    $.ajax({
        type:"POST",
        url:"/board/list",
        data : {name : "counting"},
        dataType : "xml",
        success: function(xml){
            console.log(xml);
        },
        error: function(xhr, status, error) {
            alert(error);
        }   
    });
}); 
$("#joinOk").bind("click",function(){
    $.ajax({
        url : "/board/list/ajax.seo",
        type: "get",
        data : { "id" : $("#id").val() },
        dataType : "json",
        success : function(data){
            $("#ajax").remove();
            alert(data);
            if(!data){
                alert("존재하지 않는 ID입니다");
                return false;
            }
            var html = '';
            html += '<form class="form-signin" action="" id="ajax">';
            html += '이름<input type="text" class="form-control"  name="name" value="'+data.name+'">';
            html += '아이디<input type="text" class="form-control" name=id" value="'+data.id+'">';
            html += '이메일<input type="text" class="form-control"  name="email" value="'+data.email+'">';
            html += '비밀번호<input type="text" class="form-control" name="password" value="'+data.password+'">';
            html += '</form>';
            $("#container").after(html);
        }
    });

});

$("[id^=btn]").on('click', function(event){
	//ex) id=btn51, btn34
	var id = $(this).attr("id"); 
	var seq = id.replace("btn", "");
	
	$.ajax({
		url: "<c:url value="/boardLike"/>",
		type: "post", 
		data: 'seq='+seq,
		success: function(data){
		
			if(data.check == 0){
				$('#img'+seq).attr('src', 'img/heart.png');
				$('#likes'+seq).text(data.likes);
			}else if(data.check ==1){
				$('#img'+seq).attr('src', 'img/like.png');
				$('#likes'+seq).text(data.likes);
			}
			if(data.msg != null){
				alert(data.msg);
				location.href='<c:url value="/login"/>';
			}
		}
	})
	})
</script>

</body>
</html>