<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문조사</title>
</head>
<body>
	<h2>설문조사</h2>
	<form method="post">
	<p>
	1.당신의 역할을?<br/>
	<label><input type="radio" name="responses[0]" value="서버">
	서버 개발자</label>
	<label><input type="radio" name="responses[0]" value="프론트">
	프론트 개발자</label>
	<label><input type="radio" name="responses[0]" value="풀스택">
	풀스택 개발자</label>
	</p>
	<p>
	2.가장 많이 사용하는 개발도구?<br/>
	<label><input type="radio" name="responses[1]" value="Eclipse">
	Eclipse	</label>
	<label><input type="radio" name="responses[1]" value="Intellij">
	Intellij</label>
	<label><input type="radio" name="responses[1]" value="sublime">
	sublime</label>
	</p>
	<p>
	3.하고 싶은 말?<br/>
	<input type="text" name="responses[2]">
	</p>
	<p>
		<label>응답자 위치: <br>
		<input type="text" name="res.location">
		</label>
	</p>
	<p>
		<label>응답자 나이: <br>
		<input type="text" name="rss.age">
		</label>
	</p>	
	<input type="submit" value="전송">
	</form>

</body>
</html>