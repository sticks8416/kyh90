<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<h3>도서정보관리-리스트</h3>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>목록</title>
</head>
<body>
		<table border="1">
				<tr>
					<th>등록번호</th>
					<th>도서 표지</th>
					<th>도서 ISBN</th>
					<th>도서 제목</th>
					<th>저자</th>
					<th>출판사</th>
					<th>가격</th>
				</tr>
				<c:forEach var="board" items="${boardList}" varStatus="loop">
						<tr>
						<td>${board.numbering}</td>
						<td><img src="../images/${board.cover}" width="150" height="150" alt="no img"></td>
						<td>${board.ISBN}</td>
						<td><a href="<c:url value="/board/read/${board.seq}"/>">
						${board.title}</a></td>
						<td>${board.writer}</td>
						<td>${board.publisher}</td>
						<td>${board.price}</td>
					</tr>
				</c:forEach>
		</table>
		<a href="<c:url value="/board/write"/>">도서 정보 추가</a>
</body>
</html>