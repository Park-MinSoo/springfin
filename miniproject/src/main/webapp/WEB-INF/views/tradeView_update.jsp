<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.BoardVO,java.util.List,vo.ReplyVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		List<BoardVO> list = (List<BoardVO>) request.getAttribute("list");
		BoardVO listOne = (BoardVO) request.getAttribute("listOne");
	%>
	<div id="read">
		<h3>게시글 내용</h3>
		<form method="post" action="/miniproject/board/trade/update" id="update">
			<input type="hidden" name="id" value="${ listOne.id }">
			<input type="hidden" name="pgNum" value="${ requestScope.pgNum }">
			작성자 : <span id="writer" name="writer"><%=listOne.getWriter()%></span>
			<br>
			제  목 : <span contenteditable="true" id="title" name="title"><%=listOne.getTitle()%></span>
			<br>
			내용 <br> 
			<div contenteditable="true" id="content" name="content"><%=listOne.getContent()%></div>
			<br>
			위치 : <span id="location" name="location"><%=listOne.getLocation() %></span>
			<button onclick="${ requestScope.referer }" id="btn-referer">확인</button>
			<button id="btn-update">수정</button>
			<button
				onclick="location.href='/miniproject/board/trade/delete?id=<%=listOne.getId()%>&pgNum=${ requestScope.pgNum }'; return false;"
				id="btn-delete">삭제</button>
			<button id="writeReply" onclick="display(0); return false;">댓글쓰기</button>
		</form>
	</div>
	<%
			List<ReplyVO> replies = (List<ReplyVO>) request.getAttribute("re_list");
			if(replies!=null){
				for(ReplyVO vo : replies){

		%>
			<table id="reply_list">
				<tr>
					<td><%=vo.getRe_writer() %></td>
					<td><%=vo.getRe_writedate() %></td>
				</tr>
				<tr>
					<%=vo.getRe_text() %>
				</tr>
			</table>
		<%
		
				}
			}
		%>

		<div id="replyform" style="display : none;">
			<form action="/miniproject/replyinsert" id="form" method="post">
				
				<div class="form-group">
					<label for="re_writer">작성자</label> 
					<input id="re_writer" name="re_writer" class="form-control">
				</div>
				<div class="form-group">
					<label for="re_text">내용</label> 
					<input id="re_text" name="re_text" class="form-control">
				</div>
				<div class="form-group">
					<input type="hidden" name="re_select" value="${ listOne.id }">
					<button id="btn-replyupdate" type="submit">확인</button>
					<button id="btn-default" type="reset">댓글 취소</button>
				</div>
			</form>
		</div>
		
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
function display(type){
	if(type==0)
		document.getElementById("replyform").style.display = 'block';
}

</script>
</body>
</html>