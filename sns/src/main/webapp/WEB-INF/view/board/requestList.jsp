<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<title>Friend request</title>
<script type="text/javascript">
</script>
</head>
<body>
<%@include file="header.jsp" %>
        <div class="container">
        <div class="section"><div class="container"><div class="row"><div class="col-md-3"><div class="col-md-12">  </div></div>
        
        <div class="col-md-7 text-center" style="white-space:pre;"><div class="col-md-12"> 
      <h4 class="text-center">Friend request list</h4>
         <table class="table" style="margin-left: auto; margin-right: auto; margin-top: 15px;">
         <thead>
         	<tr>
         		<td class="text-left">ID</td>  <td class="text-right">Request</td>
         	</tr>
         </thead>
        <c:forEach var="list" items="${pendingList }" varStatus="loop">
        <tr>
        <td class="text-left"><span style="color:blue">${list}</span></td><td class="text-right"><button class="btn btn-success btn-s" type="button" onclick="location.href='<c:url value="/pendingAccept/${list}"/>'">Accept</button>   <button class="btn btn-danger btn-s" type="button" onclick="location.href='<c:url value="/pendingReject/${list}"/>'">Reject</button></td>
        </c:forEach>
        </table>
        <button class="btn btn-default"  onclick="location.href='<c:url value="/board/list"/>'">메인</button>
        </div></div><div class="row"> </div></div></div></div></div>
<%@include file="footer.jsp" %>
</body>
</html>