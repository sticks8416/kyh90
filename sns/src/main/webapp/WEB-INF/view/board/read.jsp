<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>${memberVO.email}</title>
</head>
<!-- 검색 후 유저 목록 친구목록 구현 -->
<body>
<%@include file="header.jsp" %>
<div style = "width:40%; position:relateive; margin:auto">
<c:if test="${searchList != null }">
        <h4 class="text-center">Search List</h4>
         <table class="table" style="margin-left: auto; margin-right: auto; margin-top: 5px;">
         <thead>
         	<tr>
         		<td class="text-left">ID</td> <td class="text-center">Name</td> <td class="text-right">Friend request</td>
         	</tr>
         </thead>
        <c:forEach var="list" items="${searchList }" varStatus="loop">
        <tr>
        <td class="text-left"><span style="color:blue">${list.email}</span></td><td class="text-center"> ${list.name }</td><td class="text-right">
			<c:choose>
			<c:when test = "${list.email == member.email}">
				<button class="btn btn-default" type="button" onclick="location.href='<c:url value=""/>'">My profile</button>		
			</c:when>
			<c:otherwise>
      			  <button class="btn btn-default" type="button" onclick="location.href='<c:url value="/friendRequest/${list.email }"/>'">Request</button>
			</c:otherwise>
			</c:choose>
        </td></tr>
        </c:forEach>
        </table>
        </c:if>
</div>
 <%@include file="footer.jsp" %>
</body>
</html>