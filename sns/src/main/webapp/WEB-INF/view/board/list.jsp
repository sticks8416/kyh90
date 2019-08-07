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
  
  text-position:center;
  width: 20%;
  height: 70%;
  top : 300px;
  right : 30px;
  border: 1px solid white;
  color: #000000;
}
 div.left {
  
  height: 40%;
  top : 202px;
  left : 4%;
  bottom-padding: 100px;
  color: #000000;
  border: 1px solid white;
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
<%@include file="header.jsp" %>
<div class="left">
<div class="card" style="width:90%;  border: 1px solid black; width: 16%; position:fixed; " >
<div class="card-header" style= "border-bottom: 1px solid black; background-color:#FFFFFF" >
  <h2></h2>
  <form action="<c:url value="/board/editProfile"/>" method="POST" enctype="multipart/form-data" >
  <input type=file name='filename' style="display: none"> 
<!-- form으로 싸서  editprofile 매핑찍어논 곳으로 -->
<img src="../upload/${member.profile}"  border='0' width="90%" height="150" alt="no img" onclick='document.all.filename.click(); document.all.filename2.value=document.all.filename.value'> 
<h2></h2>
<input type='text' name='filename2' id='filename2'style="display:none"> 
<input type="submit" value="프로필 사진 변경">
</form>
  </div>
  <div class="card-body" style="width:100%;border-bottom: 1px solid black" ><p>${member.name}</p></div>
  <div class="card-body" style="width:106%"><p>${member.email}</p></div>
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
      <div><img src="../upload/${board.images}"  width="auto" height="150" alt="no img"></div>
      <div>
      <h4>${board.content}</h4><!-- content,regdate 안됨 -->
       </div>
        <form action="/action_page.php">
        <div class="w3-panel w3-border-top w3-border-bottom" style = "margin: 0px 0px 0px 0px">
       <div class="form-group" style = "padding: 10px 10px 0px 10px" >
       <!-- 좋아요 카운팅으로 넘김버튼 -->
 <a id="btn${board.num }"><i class="glyphicon glyphicon-thumbs-up" style ="font-size:25px"></i></a>
      <Strong id="likes${board.num }" style="font-size:20px">${board.likes }</Strong>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <!-- 수정페이지 넘김버튼 -->
       <a href="<c:url value="/board/edit/${board.num}"/>"><i class="fas fa-file" style ="font-size:25px"></i></a>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <!-- 삭제팝업창으로 넘김버튼 -->
        <a href="<c:url value="/board/delete/${board.num}"/>"><i class="glyphicon glyphicon-remove" style ="font-size:25px"></i></a>
        </div>
       </div>
             <input type="text" class="form-control" placeholder="답글 작성" id="comments${board.num }" value="" >
       <button type="button" class="btn btn-secondary" style = "float:right" id="reply${board.num }">답글 달기</button>
        <c:if test="${replyList != null }">
		<div id ="refresh${board.num }">
			<h4>Comments</h4>
		<c:forEach var="comment" items="${replyList }" varStatus="loop">
			<c:if test="${comment.num == board.num }">
			<span style="color:blue; font-size:13pt; font-weight: bold;">${comment.email }</span><div class="col-sm-1"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="text-align:right; font-size:12pt;" >${comment.regDate }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<c:if test="${comment.email  == board.email }">
			<button class="btn btn-danger btn-xs" type="button" id="delete${comment.replyNum }" >x</button>
			</c:if>
			<br>
			<div class="col-sm-1"></div>    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp; <span style="font-size:13pt;">${comment.comments }</span><hr/>
			</c:if>
		</c:forEach>
		</div>
			</c:if>
        
        </form>
       </div>
 </c:forEach>
  </c:if>
  
  <c:if test="${not empty member.email}">
 
<div class ="right">
   <div class="card" style= "border: 1px solid black;position:fixed;width:250px">
 
    <div class="card-header"style= "border-bottom: 1px solid black; hight:40px; background-color:#EAEAEA"><h5>친구목록</h5></div>
    <c:forEach var="friend" items="${friendList}" varStatus="loop">
    <div class="card-body" style= "border-bottom: 1px solid black"><p>${friend.email}&nbsp;&nbsp;&nbsp;${friend.name}</p>
    <button class="btn btn-default text-right" type="button" onclick="javascript:window.open('<c:url value="/chatRequest/${friend.email }"/>','new','left=650, top=250, width=500, height=600')">Chat</button></div> 
 </c:forEach>
  </div>
  
</div>
</c:if>
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
				$('#likes'+seq).text(data.likes);
			}else if(data.check ==1){
				$('#likes'+seq).text(data.likes);
			}
			if(data.msg != null){
				alert(data.msg);
				location.href='<c:url value="/member/main"/>';
			}
		}
	})
	})
$("[id^=reply]").on('click', function(){
	var id = $(this).attr('id');
	var num= id.replace("reply", "");
	var comment = $('#comments'+num).val()
	var alldata = {"num":num , "comments":comment};
	console.log(comment);
	console.log(num);
	$.ajax({
   		url: "<c:url value="/reply"/>",
   		type: "post", 
   		data: alldata,
   		success: function(data){
   			if(data.msg != null){
   				alert(data.msg);
   			}
   			else if(data.success != null){
				alert(data.success);
				location.href='<c:url value="/board/list"/>';
   			}
   		}
   	})
})

    	
    	$("[id^=delete]").on('click', function(){
    		var id = $(this).attr('id');
    		var replyNum= id.replace("delete", "");
    		var check = confirm("Want to delete this reply?");
    		if(check){	
    		$.ajax({
        		url: "<c:url value="/replyDelete"/>",
        		type: "post", 
        		data: "replyNum="+replyNum,
        		success: function(data){
        			if(data.success != null){
     				alert(data.success);
     				location.href='<c:url value="/board/list"/>';
        			}
        		}
        	})}
    	})
    

</script>

</body>
</html>