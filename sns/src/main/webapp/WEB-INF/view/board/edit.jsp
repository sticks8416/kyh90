<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
</head>
<body>
		<form:form commandName="boardVO" method="POST">	
			<table border="1">
					<tr>
						<th><form:label path="title">제목</form:label></th>
						<td><form:input path="title"/>
						<form:errors path="title"/></td>
					</tr>
					<tr>
						<th><form:label path="content">내용</form:label></th>
						<td><form:input path="content"/>
						<form:errors path="content"/></td>
					</tr>			
					<tr>
						<th><form:label path="writer">작성자</form:label></th>
						<td><form:input path="writer"/>
						<form:errors path="writer"/></td>
					</tr>			
					<tr>
						<th><label for="password">비밀번호</label></th>
						<td><input type="password" id="pwd" name="pwd"/>
						${msg}</td>
<!-- 
다음 주석에 있는 것과 같이 기존 write와 동일하게 사용하면
데이터베이스에 저장되어 있는 비밀전호가 그냥 보이게된다. -->
<!-- 			<th><form:label path="password">비밀번호</form:label></th>
						<td><form:input path="password"/>
							<form:errors path="password"/>
						</td>

 -->						
						
						
					</tr>
			</table>
			<div>
					<input type="submit" value="등록"><a
					href="<c:url value="/board/list"/>">목록</a>
			</div>
			</form:form>
</body>
</html>