<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<style>
   body{
        background-color: #FFFFFF;
      }
      div.right {
  position:fixed;
  text-position:center;
  width: 20%;
  height: 70%;
  top : 300px;
  right : 30px;
  border: 1px solid black;
 border-radius:10px;
  color: #000000;
}
 div.left {
  position:fixed;
  text-position:center;
  width: 18%;
  height: 40%;
  top : 202px;
  left : 4%;
  bottom-padding: 100px;
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">


  <!-- </i>
   -->


  
<%@include file="header.jsp" %>


<div class="left">
<div style="width:90%; text-align:center">
  <h2></h2>
  <!-- <div><input type="file" name="filename"></div> -->
  <label ><img src="../images/${member.profile}" width="200" height="150" alt="no img" style ="text-position:center"></label>
<!--   <div class="w3-panel w3-card-4"><p>w3-card-4</p></div> -->
  <div class="w3-panel w3-card" style="width:110%" ><p>${member.name}</p></div>
  <div class="w3-panel w3-card-2" style="width:110%"><p>${member.email}</p></div>
</div>
</div>


  <c:if test="${not empty member.email}">
  <c:forEach var="board" items="${boardList}" varStatus="loop">
    <div class="container" style = "border: 1px solid grey; padding: 10px 10px 10px 10px;  
    margin-top: 15px; margin-bottom: 15px;height: auto;width: 500;  max-width: 600px; min-height: 100px;">
   <p style = "text-align: center;">${board.title}
   <!-- <i class="fas fa-bars" style= "float:right; font-size: 30px"> </i> --></p>
   <div class="w3-panel w3-border-top w3-border-bottom">
    <a style= "text-align:left">${board.email}</a><a style = "float:right">${board.regDate}</a>
    </div>
      <div><img src="../upload/${board.images}" width="auto" height="150" alt="no img"></div>
      <div>
      <h4>${board.content}</h4><!-- content,regdate 안됨 -->
       </div>
        <form action="/action_page.php">
        <div class="w3-panel w3-border-top w3-border-bottom" style = "margin: 0px 0px 0px 0px">
       <div class="form-group" style = "padding: 10px 10px 0px 10px" >
       
       <!-- 좋아요 카운팅으로 넘김버튼 -->
      <i class="glyphicon glyphicon-thumbs-up" style ="font-size:25px"></i>
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
  </c:if>
 <div class ="right">
 
<div class="w3-container">
  <h2></h2>
  <c:if test="${not empty member.email}">
  <p>친구목록</p>
<c:forEach var="friend" items="${friendList}" varStatus="loop">
  <div class="w3-panel w3-card" style = "height:70px"><p>${friend.email}</p><p>${friend.name}</p><button class="btn btn-default text-right" type="button" onclick="javascript:window.open('<c:url value="/chatRequest/${friend.email }"/>','new','left=650, top=250, width=500, height=600')">Chat</button></div>
  </c:forEach>
  </c:if>

</div>
</div>
<%@include file="footer.jsp" %>
<script>
function myFunction() {
  var x = document.getElementById("Demo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}	
function listgo() {
	self.close("listgo");
	window.opner.reload();
	}
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