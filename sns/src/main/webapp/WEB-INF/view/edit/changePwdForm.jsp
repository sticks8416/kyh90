<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="change.pwd.title"/></title>
</head>
<body>
		<form:form>
		<p>
			<label><spring:message code="currentPassword"/>
			<form:password path="currentPassword"/>
			<form:errors path="currentPassword"/>	
			</label>
		</p>
		<p>
			<label><spring:message code="newPassword"/>
			<form:password path="newPassword"/>
			<form:errors path="newPassword"/>	
			</label>
		</p>
		<input type="submit" value="<spring:message code="change.btn"/>">
		</form:form>
</body>
</html>