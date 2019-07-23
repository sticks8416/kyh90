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
<c:forEach var="member" items="${memberlist}" varStatus="loop">
<div class="w3-panel w3-card"><p>${member.writer}</p></div>

</c:forEach>
</body>
</html>