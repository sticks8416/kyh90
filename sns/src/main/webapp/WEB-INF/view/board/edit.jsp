<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
<style>
.x{



}


</style>
</head>
<body>

					
    <%-- <div class="container" style = "border: 1px solid grey; padding: 10px 10px 10px 10px;  
    margin-top: 15px; margin-bottom: 15px;height: auto;width: 500;  max-width: 600px; min-height: 100px;">
    <form name="editForm"action="<c:url value="/board/edit"/>"method="POST">
   <p style = "text-align: center;"><input size="3" name="num" value="${boardVO2.num}"/><input size="3" name="num" value="${boardVO2.title}"/>
   <!-- <i class="fas fa-bars" style= "float:right; font-size: 30px"> </i> --></p>
   <div class="w3-panel w3-border-top w3-border-bottom">
    <a style= "text-align:left"><input size="3" name="writer" value="${boardVO2.writer}"/></a><a style = "float:right">${boardVO2.regDate}</a>
    </div>
      <div><img src="../../images/${boardVO2.images}" width="auto" height="150" alt="no img"></div>
      <div>
      <h4><input size="3" name="content" value="${boardVO2.content}"/></h4><!-- content,regdate 안됨 -->
       </div>
        <div class="w3-panel w3-border-top w3-border-bottom" style = "margin: 0px 0px 0px 0px">
       <div class="form-group" style = "padding: 10px 10px 0px 10px" >
       
        </div>
       </div>
       <input type="submit" value="등록">
       <input type="submit" value="목록"> 
        </form>
       </div> --%>
        <!-- ----------------------------------------------------------------------------------- -->
       <form action="<c:url value="/board/edit/${num}"/>" method="POST" enctype="multipart/form-data" >
    	 <div class="container" style = "border: 1px solid grey; padding: 10px 10px 10px 10px;  
    margin-top: 15px; margin-bottom: 15px;height: auto;  max-width: 500px; min-height: 100px; overflow: auto;">
  <label><input value="${boardVO2.title}" type="text" name="title" placeholder="제목" style = "padding-top: 0px; padding-bottom: 0px"></label>
   <div class="w3-panel w3-border-top w3-border-bottom" style = "margin-top: 0px; margin-bottom: 0px">
    </div>
      <div>
      <label><input value="${boardVO2.content}" type="text" name="content" placeholder="글 내용" style="width:250%;height:300px">	</label><!-- content,regdate 안됨 -->
       </div>
       <div class="w3-panel w3-border-top w3-border-bottom">
        <div><input type="file" name="filename"></div>
        </div>
    	<div style = "float:right">
					<input type="submit" value="등록">
					<input type="submit" value="목록"><a href="<c:url value="/board/list"/>"></a></div>
					</div>
					
		</form>
       
       
       
       
       
      <!-- ----------------------------------------------------------------------------------- -->
       
	<%-- 			<div>
					 <form name="editForm"action="<c:url value="/board/edit"/>"method="POST">
				<input size="3" name="num" value="${num}"/>
				<input size="3" name="num" value="${writer}"/>
				<input size="3" name="num" value="${title}"/>
				<input size="3" name="num" value="${content}"/>
				<br>
				<input type="submit" value="삭제">
				<a href="<c:url value="/board/list"/>">취소</a>
		</form>
				</div>
				<div>
						<input type="submit" value="등록">
						 <a href="<c:url value="/board/list" />">목록</a> 
				</div> --%>
</body>
</html>