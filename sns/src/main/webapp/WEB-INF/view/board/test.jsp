<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button id="start_ajax">서버와 통신시작</button>

</body>
<script>
$("#start_ajax").click(function(){
    $.ajax({
        type:"POST",
        url:"./test.jsp",
        data : {name : "홍길동"},
        dataType : "xml",
        success: function(xml){
            console.log(xml);
        },
        error: function(xhr, status, error) {
            alert(error);
        }  
    });
});

</script>
</html>