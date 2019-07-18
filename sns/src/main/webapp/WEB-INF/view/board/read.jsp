<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<h3>도서정보관리-도서정보</h3>
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
<title>${boardVO.title}&nbsp;내용</title>
</head>
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
<script>
$("#joinOk").keyup("click",function(){
    $.ajax({
        url : "/board/list/ajax.seo",
        type: "get",
        data : { "id" : $("#id").val() },
        dataType : "json",
        success : function(data){
            $("#ajax").remove();
            alert(data);
            if(!data){
                alert("존재하지 않는 ID입니다");
                return false;
            }
            var html = '';
            html += '<form class="form-signin" action="" id="ajax">';
            html += '이름<input type="text" class="form-control"  name="name" value="'+data.name+'">';
            html += '아이디<input type="text" class="form-control" name=id" value="'+data.id+'">';
            html += '이메일<input type="text" class="form-control"  name="email" value="'+data.email+'">';
            html += '비밀번호<input type="text" class="form-control" name="password" value="'+data.password+'">';
            html += '</form>';
            $("#container").after(html);
        }
    });

});
</script>
</html>