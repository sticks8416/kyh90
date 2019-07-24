<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저목록</title>
</head>
<!-- 검색 후 유저 목록 친구목록 구현 -->
<body>
<c:forEach var="member" items="${searchList}" varStatus="loop">
<div class="w3-panel w3-card"><p>${member.writer}</p></div>

</c:forEach>
<%-- <c:forEach var="board" items="${SearchList}" varStatus="loop">
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
<div class="w3-panel w3-card"><p>${board.writer}</p></div>


</c:forEach>
 --%>
</body>
</html>