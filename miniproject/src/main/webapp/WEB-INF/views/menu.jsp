<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${ sessionScope.sm_id == null }">
		<a href="${path}/member/login">로그인</a>
	</c:when>
	<c:otherwise>
		${ sessionScope.nic }님 반갑습니다.
		<a href="${path}/member/logout">로그아웃</a>
	</c:otherwise>
</c:choose>
<hr>