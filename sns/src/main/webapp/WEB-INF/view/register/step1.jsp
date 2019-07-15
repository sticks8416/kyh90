<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="member.register"/></title>
</head>
<body>
	<h2><spring:message code="term"/></h2>
	<p>약관 내용</p>
	<form action="step2" method="post">
		<label><input type="checkbox" name="agree" value="true">약관동의
			<spring:message code="term.agree"/>
		
		</label><input type="submit" value="<<spring:message code="next.btn"/>">
	</form>
</body>
</html>