<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.MemberVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>스크립트 태그</h1>
<%
	MemberVO vo = (MemberVO)request.getAttribute("member");
%>
<h1>회원 정보</h1>
<hr>
<ul>
<li>회원 이름 : <%= vo.getName() %></li>
<li>회원 계정 : <%= vo.getAccount() %></li>
<li>회원 암호 : <%= vo.getPwd() %></li>
<li>회원 전화번호 : <%= vo.getPhonenum() %></li>
</ul>
<hr>


<h1>액션 태그</h1>
<jsp:useBean id="member" class="vo.MemberVO" scope="request" />	<!-- useBean은 객체가 없으면 생성하는 기능 까지 있기 때문에 getBean이 아니라 useBean이 라고 한다. -->
<h1>회원 정보</h1>
<hr>
<ul>
<li>회원 이름 : <jsp:getProperty name="member" property="name" /></li>
<li>회원 계정 : <jsp:getProperty name="member" property="account" /></li>
<li>회원 암호 : <jsp:getProperty name="member" property="pwd" /></li>
<li>회원 전화번호 : <jsp:getProperty name="member" property="phonenum" /></li>
</ul>
<hr>


<h1>표현 언어(EL)</h1>
<h1>회원 정보</h1>
<hr>
<ul>
<li>회원 이름 : ${ requestScope.member.name}</li>
<li>회원 계정 : ${ requestScope.member.account}</li>
<li>회원 암호 : ${ requestScope.member.pwd}</li>
<li>회원 전화번호 : ${ requestScope.member.phonenum}</li>
</ul>
<hr>
</body>
</html>