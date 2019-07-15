<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<h3>도서정보관리-도서추가</h3>
<meta charset="UTF-8">
<title>도서관리</title>
</head>
<body>
	<!-- action="<c:url value="/board/write"/>"  -->
		<form action="<c:url value="/board/write" />" method="POST" enctype="multipart/form-data" >
			<table border="1">
		<tr>
								<th><label>BOOK ISBN
								<td><input type="text" name="isbn" ></td>
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
								<td><input type="text" name="publisher" ></td>
								</label></th>
						</tr>
					<tr>
								<th><label>도서가격
								<td><input type="text" name="price" ></td>
								</label></th>
								
						</tr>
					<tr>
							<th>이미지</th>
							<td><input type="file" name="filename"></td>
					</tr>
					<tr>
								<th><label>책소개
								<td colspan="2"><input type="text" name="content"></td>
								</label></th>
				
						<tr>
					
					
			</table>
			<div>
					<input type="submit" value="등록">
					<a href="<c:url value="/board/list"/>">목록</a>
			</div>
		</form>
</body>
</html>