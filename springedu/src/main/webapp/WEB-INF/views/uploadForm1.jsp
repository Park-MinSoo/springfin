<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Test Example</title>
</head>
<body>
<h2>SpringMVC FileUpload</h2>
<hr>
<%
	if( request.getAttribute("msg") == null ) {
%>
	<form action="/springedu/upload" 
	               enctype="multipart/form-data" method="post">	
<!-- type=file이 들어가 있다면 multipart/form-data가 들어가야한다. 이번에 전달하는 쿼리문자열은 여러개의 파티션으로 이루어진 form data 라는것을 알려주는것. 파일을 올리는 경우 요청 방법이 반드시 post여야한다.-->
    	<input type="file" name="uploadFile"  />
    	<input type="submit" value="업로드"/>
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


