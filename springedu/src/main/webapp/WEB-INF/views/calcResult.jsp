<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>연산 요청 결과(스크립트 태그)</h1>
<hr>
<h3>결과 : <span style= "color:red"><%= request.getAttribute("calcresult") %></span></h3>
<a href="<%= request.getHeader("referer") %> ">입력 화면</a>


<h1>연산 요청 결과(EL 태그)</h1>
<hr>
<h3>결과 : <span style= "color:red">${ requestScope.calcresult}</span></h3>
<a href="${ header.referer}">입력 화면</a>
</body>
</html>