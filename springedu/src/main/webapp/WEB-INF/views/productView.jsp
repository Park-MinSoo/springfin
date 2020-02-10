<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.ProductVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a{
background-image : linear-gradient(to left, yellow, pink, green);
text-decoration : none;
}
</style>
</head>
<body>
<%
	ProductVO vo = (ProductVO)session.getAttribute("cnt");
%>
<h1>선택된 상품 정보는 다음과 같습니다.(스크립트태그)</h1>
<hr>

<h3>선택된 사과의 개수 : <%= vo.getApp() %></h3>
<h3>선택된 바나나의 개수 : <%= vo.getBan() %></h3>
<h3>선택된 한라봉의 개수 : <%= vo.getBong() %></h3>
<hr>


<h1>선택된 상품 정보는 다음과 같습니다.(액션태그)</h1>
<jsp:useBean id="cnt" class="vo.ProductVO" scope="session" />

<h3>선택된 사과의 개수 : <jsp:getProperty name="cnt" property="app" /></h3>
<h3>선택된 바나나의 개수 : <jsp:getProperty name="cnt" property="ban" /></h3>
<h3>선택된 한라봉의 개수 : <jsp:getProperty name="cnt" property="bong" /></h3>
<hr>


<h1>선택된 상품 정보는 다음과 같습니다.(EL태그)</h1>
<hr>

<h3>선택된 사과의 개수 : ${ sessionScope.cnt.app}</h3>
<h3>선택된 바나나의 개수 : ${ sessionScope.cnt.ban}</h3>
<h3>선택된 한라봉의 개수 : ${ sessionScope.cnt.bong}</h3>
<hr>
	<a href="${ header.referer}">상품 선택화면</a>
</body>
</html>