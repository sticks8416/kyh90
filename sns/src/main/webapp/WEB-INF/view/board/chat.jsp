<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link href="../css/main.css" rel="stylesheet" type="text/css">
<title>Chat</title>
</head>
<body>
	<div id="one">
	<input type="text" id="friend" value="${friendId }" hidden="true"/>
		<input type="text" id="nickname" value="${myId }" hidden="true"/> 
	</div>
	<div id="two">
		<textarea id="chatarea" class="form-control"  style="resize:none; font-size:15px" cols="35" rows="26" readonly>
		</textarea> 
		
			<input type="text" id="message" class="form-control" size="30"/> 
	</div>
</body>
<script>

	nickname = document.getElementById("nickname").value;
	friend = document.getElementById("friend").value;
/* 	$('#enter').on("click", function() {
		//웹 소켓 연결해주는 함수 호출 
	}); */
	
	$(document).ready(function(){
		connect();
		
		$('#message').keydown(function(key) {		
			if(key.keyCode == 13){
				send();
				
			}
		})
	})
	
	var websocket;
	//입장 버튼을 눌렀을 때 호출되는 함수 
	function connect() {
		websocket = new WebSocket("ws://192.168.0.77:8080<c:url value='/chat/websocket'/>");
		//웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록 
		websocket.onopen = onOpen;
		websocket.onmessage = onMessage;
		websocket.onclose = onClose;
	} 

	//보내기 버튼을 눌렀을 때 호출될 함수 
	function send() {
		
		msg = document.getElementById("message").value;
		websocket.send(nickname + " : " + msg);
		document.getElementById("message").value = "";
	}
	//웹 소켓에 연결되었을 때 호출될 함수 
	function onOpen() {
		alert(nickname + "님 입장하셨습니다.");
	}
	function onMessage(evt) {
		data = evt.data;
		var date = data.slice(0, 19);
		var content = data.slice(19);
		chatarea = document.getElementById("chatarea");
		if(data.startsWith(nickname,19)){
			chatarea.innerHTML = chatarea.innerHTML + "\n" + date + "\n"+content
		} else if (data.startsWith(friend,19)){
			chatarea.innerHTML = chatarea.innerHTML + "\n" + date + "\n"+content
		}
		$('#chatarea').scrollTop($('#chatarea')[0].scrollHeight);
	}
	//웹 소켓에서 연결이 해제 되었을 때 호출될 함수 
	function onClose() {
	}
</script>
</html>

