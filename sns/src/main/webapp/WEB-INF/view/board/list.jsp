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
        background-color: #FFFFFF;
      }
      div.right {
  position:fixed;
  width: 12%;
  height: 100%;
  top : 300px;
  right : 30px;
  border: 1px solid grey;
 
  color: #FFFFFF;
}
 div.left {
  position:fixed;
  width: 17%;
  top : 300px;
  left : 20px;
  bottom : 300px;
  border: 1px solid black;
  border-radius:10px;
  color: #000000;
}
butt{
 position:fixed;
 right : 0px;
}
.s{
border: 1px solid grey;

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
        div.container{
        border: 1px solid grey; 
        padding: 10px 10px 10px 10px;  
    	margin-top: 15px; 
    	margin-bottom: 15px;
    	height: auto;
    	width: 500;  
    	max-width: 600px; 
    	min-height: 100px;
        
        }
</style>
</head>
<body>

<%@include file="header.jsp" %>


<div class="w3-sidebar w3-light-white w3-bar-block" style="width:17%">


<div class="left">
<div>
  <h2></h2>
  <!-- <div><input type="file" name="filename"></div> -->
  <label ><img src="../images/${member.profile}" width="200" height="150" alt="no img"></label>
<!--   <div class="w3-panel w3-card-4"><p>w3-card-4</p></div> -->
  <div class="w3-panel w3-card" style="width:90%"><p>${member.name}</p></div>
  <div class="w3-panel w3-card-2" style="width:90%"><p>${member.email}</p></div>
</div>
</div>
</div>

  <c:if test="${not empty member.email}">
  <c:forEach var="board" items="${boardList}" varStatus="loop">
    <div class="container">
   <p style = "text-align: center;">${board.title}
   <!-- <i class="fas fa-bars" style= "float:right; font-size: 30px"> </i> --></p>
   <div class="w3-panel w3-border-top w3-border-bottom">
    <a style= "text-align:left">${board.writer}</a><a style = "float:right">${board.regDate}</a>
    </div>
      <div><img src="../images/${board.images}" width="auto" height="150" alt="no img"></div>
      <div>
      <h4>${board.content}</h4><!-- content,regdate 안됨 -->
       </div>
       
        <div class="w3-panel w3-border-top w3-border-bottom" style = "margin: 0px 0px 0px 0px">
       <div class="form-group" style = "padding: 10px 10px 0px 10px" >
       
       <!-- 좋아요 카운팅으로 넘김버튼 -->
      <i class="glyphicon glyphicon-thumbs-up" style ="font-size:25px"></i>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <i class="fas fa-heart" style ="font-size:25px"></i>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <!-- 수정페이지 넘김버튼 -->
       <a href="<c:url value='/board/edit/${board.num}'/>"><i class="fas fa-file" style ="font-size:25px"></i></a>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

      <!-- 삭제팝업창으로 넘김버튼 -->
<%--       <a onclick="window.open('<c:url value="/board/delete/${board.num}"/>','_blank','width=400,height=200, scrollbars=yes');"><i class="glyphicon glyphicon-remove" style ="font-size:25px"></i></a> --%>
      <a id = "listgo" href="<c:url value="/board/delete/${board.num}"/>" onclick="window.open(this.href,'_blank','width=400,height=200, scrollbars=yes');return false;"><i class="glyphicon glyphicon-remove" style ="font-size:25px"></i></a>
      <%-- <a href="<c:url value="/board/delete/${board.num}"/>" target="_blank" style = "width:400;height:200"><i class="glyphicon glyphicon-remove" style ="font-size:25px"></i></a> --%>
<%--       <input type="button"  class="glyphicon glyphicon-remove" style ="font-size:25px" value="X" onclick="window.open('<c:url value="/board/delete/${board.num}"/>', 'deleteForm', 'width=400, height=250')">
 --%><%--         <button onclick="window.open('<c:url value="/board/delete/${board.num}"/>','window_name','width=400,height=250,location=no,status=no,scrollbars=yes');return false"><i class="glyphicon glyphicon-remove" style ="font-size:25px"></i></button>
 --%>        <!-- The Modal -->

    <div id="myModal" class="modal">	
    </div>
        </div>
       </div>
       <input type="text" class="form-control" placeholder="답글 작성" name="text1" >
       <a class="butt"><button type="submit" class="btn btn-secondary" style = "float:right">답글 달기</button></a>
       </div>
 </c:forEach>
  </c:if>
 <div class ="right">
 <div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
<div class="w3-container">
  <h2></h2>
  <c:if test="${not empty member.name}">
  <p>친구목록</p>
<c:forEach var="board" items="${boardList}" varStatus="loop">
  <div class="w3-panel w3-card"><p>${board.writer}</p></div>
  </c:forEach>
  </c:if>
</div>
</div>

</div>
<%@include file="footer.jsp" %>
<script>
 function listgo() {
self.close("listgo");
window.opner.reload();
}
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