<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>
<style>
//* * The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        .s{
        hight: 100%;
        width: 100%;
        } */
</style>
</head>
<body>
 <%@include file="header.jsp" %>
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span>                                                               
        <p></p>
        <form id = "del" name="deleteForm"
		action="<c:url value="/board/delete"/>"method="POST">
				<input size="1" name="num" value="${num}" type="hidden" />
				정말로 삭제하시겠습니까?<br>
				<input  type="submit" value="삭제" onclick="deletego();">
		</form>
		<a href="<c:url value="/board/list"/>"><button>취소</button></a>
		<div>${msg}</div>
      </div>
<script type="text/javascript">
//Get the button that opens the modal
var btn = document.getElementById("myBtn");
 //Get the modal
var modal = document.getElementById('myModal');
// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];                                          
// When the user clicks on the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}
// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}
//When the user clicks anywhere outside of the modal, close it
/* window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
} */
function deletego() {
	{
	 self.close("del"); 
	}
	opener.document.location.href="<c:url value="/board/list"/>"
	opener.document.location.reload();
}
</script>

<%@include file="footer.jsp" %>		
</body>
</html>