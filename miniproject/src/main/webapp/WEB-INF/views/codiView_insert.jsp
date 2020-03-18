<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="write">
		<h2 id="divT"></h2>
		<form method="post" action="/miniproject/board/codi/insert">
			<select name="type" id="type">
				<option value="codi" id="codi">코디게시판</option>
				<option value="trade" id="trade">거래게시판</option>
			</select>
			<%= session.getAttribute("sm_id") %><br>
			
			<input type="text" name="title" style="width: 330px;" placeholder="제목을 입력해주세요"><br>
			<textarea id="content" rows="10" cols="45" name="content" placeholder="내용을 입력해주세요"></textarea>
			<br>
			
			<input type="hidden" name="pgNum" value="${ requestScope.pgNum }">
			<input type="submit" value="저장">
			<input type="reset" value="재작성">
			<button onclick="${ requestScope.referer }">취소</button>
		</form>
</div>
</body>
</html>