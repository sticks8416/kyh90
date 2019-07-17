<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새글 쓰기</title>
</head>
<body>

	<h1>도서정보관리-도서추가</h1>
		<form action="<c:url value="/board/write" />" method="POST" enctype="multipart/form-data" >
				<table border="1">
						<tr>
								<th><label>BOOK ISBN
								<td><input type="text" name="bookisbn" ></td>
								</label></th>
						</tr>
			
						<tr>
								<th><label>도서명
								<td><input type="text" name="title" ></td>
								</label></th>
						</tr>
				
						<tr>
								<th><label>저자
								<td><input type="text" name="writer" ></td>
								</label></th>
						</tr>
			
						<tr>
								<th><label>출판사
								<td><input type="text" name="company" ></td>
								</label></th>
						</tr>
					
						<tr>
								<th><label>도서가격
								<td><input type="text" name="money" ></td>
								</label></th>
								
						</tr>
			
						<tr>
								<th><label>이미지 :
								<td><input type="file" name="filename" ></td>
								</label></th>
						</tr>
					
						<tr>
								<th><label>책소개
								<td><input type="text" name="content"></td>
								</label></th>
				
						<tr>
								<th><label>비밀번호
								<td><input type="password" name="password" ><td>
								</label><th>
						</tr>
			
				</table>
				<div>
						<input type="submit" value="도서정보 추가">
						<a href="<c:url value="/board/list" />">목록</a>
				</div>
				</form>
		
</body>
</html>