<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	span{
		color : magenta;
	}
</style>
</head>
<body>
	<h1>요청을 처리하는 동안 에러가 발생했어요(스크립트 태그)</h1>
	<h3>오류의 원인 : <span><%= request.getAttribute("msg") %></span></h3>
	<br/>
	<br/>
	<h1>요청을 처리하는 동안 에러가 발생했어요(EL)</h1>
	<h3>오류의 원인 : <span>${ requestScope.msg }</span></h3>
	<br/>
	<br/>
	<a href="${ header.referer }">입력 화면으로</a>
</body>
</html>