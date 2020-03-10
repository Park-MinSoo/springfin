<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
<%-- <%@ include file="/menu.jsp" %> --%>
<h2>로그인</h2>
<form name="loginform" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td><input name="sm_id" id="sm_id"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input name="sm_pwd" id="sm_pwd"></td>
		</tr>
		<tr>
			<td>
			<button id="loginbutton">로그인</button>
			<c:if test="${ msg=='failue'}">
				<h3>아이디나 비밀번호가 일치하지 않습니다.</h3>
			</c:if>
			</td>
		</tr>
	</table>
</form>
</body>
</html>