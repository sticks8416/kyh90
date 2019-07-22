<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<h3>도서정보관리-도서정보</h3>
<meta charset="UTF-8">
<title>${boardVO.title}&nbsp;내용</title>
</head>
<!-- 검색 후 유저 목록 친구목록 구현 -->
<body>
		<table border="1">
		
			<tr>
					<th rowspan="5"><img src="/mvcspring/images/${boardVO.cover}" width="150" height="150" alt="no img"></th>
					<th>BOOK ISBN</th>
					<td>${boardVO.ISBN}</td>
			</tr>
			<tr>
					<th>도서명</th>
					<td>${boardVO.title}</td>
			</tr>
			<tr>	
					<th>저자</th>
					<td>${boardVO.writer}</td>
			</tr>
			<tr>
					<th>출판사</th>
					<td>${boardVO.publisher}</td>
			</tr>
			<tr>
					<th>도서 가격</th>
					<td>${boardVO.price}</td>	
			</tr>
			<tr>
					<th>책소개</th>
					<td colspan="2">${boardVO.introduce}</td>
			</tr>
		</table>
		<div>
				<a href="<c:url value="/board/edit/${boardVO.seq}"/>">수정</a>
				<a href="<c:url value="/board/delete/${boardVO.seq}"/>">삭제</a>
				<a href="<c:url value="/board/list"/>">도서 정보목록</a>		
		</div>
</body>
</html>