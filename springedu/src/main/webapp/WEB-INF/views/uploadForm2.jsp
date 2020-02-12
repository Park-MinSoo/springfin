<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 테스트 예제</title>
</head>
<body>
<h2>SpringMVC FileUpload(Multiple)</h2>
<hr>
<%
	if( request.getAttribute("msg") == null ) {
%>
	<form action="/springedu/upload3" 
	               enctype="multipart/form-data" method="post">
    	<input type="file" name="mfile" multiple/>	<!--  multiple 이라는 속성이 있으면 여러개를 한번에 업로드 할 수 있다. -->
    	<input type="submit" value="파일올리기"/>
	</form>
<%
	} else {
%>
	 ${ msg }
<%
	}
%>
</body>
</html>