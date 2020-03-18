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
		List<ReplyVO> re_list = (List<ReplyVO>) request.getAttribute("re_list");
		BoardVO listOne = (BoardVO) request.getAttribute("listOne");
	%>
	<div id="read">
		<h3>게시글 내용</h3>
		<form method="post" action="/miniproject/board/codi/update" id="update" name="update">
			<input type="hidden" name="id" value="${ listOne.id }">
			<input type="hidden" name="pgNum" value="${ requestScope.pgNum }">
			작성자 : <span id="writer" name="writer"><%=listOne.getWriter()%></span>
			<br>
			<c:if test='<%= session.getAttribute("sm_id").equals(listOne.getWriter()) %>'>
				제  목 : <input id="title" name="title" value="<%=listOne.getTitle()%>">
				<br>
				내용 <br> 
				<input id="content" name="content" value="<%=listOne.getContent()%>">
				
			</c:if>
			<c:if test='<%= !session.getAttribute("sm_id").equals(listOne.getWriter()) %>'>
				제  목 : <input id="title" name="title" value="<%=listOne.getTitle()%>" readonly>
				<br>
				내용 <br> 
				<input id="content" name="content" value="<%=listOne.getContent()%>" readonly>
 			</c:if>
 			<br>
 			
			 추천 수 :<input id="tup" name="tup" value="${ listOne.tup }" readonly>
			
			<button onclick="like(); return false;">추천</button>
			<br>
			<button onclick="${ requestScope.referer }" id="btn-referer">확인</button>
			<c:if test='<%= session.getAttribute("sm_id").equals(listOne.getWriter()) %>'>
				<button id="update" onclick="document.getElementById('update').submit();">수정</button>
				<!-- <button id="update1" onclick="fin(); return false;">수정완료</button> -->
				<button
					onclick="location.href='/miniproject/board/codi/delete?id=<%=listOne.getId()%>&pgNum=${ requestScope.pgNum }'; return false;"
					id="btn-delete">삭제</button>
			</c:if>
		</form>
	</div>
		<form method="post" name="replyform" id="replyform">
		<input type="hidden" name="re_select" id="re_select" value="${ listOne.id }">
		<label for="re_writer">작성자</label>
		<input type="text" id="re_writer" name="re_writer" readonly value = "<%= session.getAttribute("sm_id") %>">
		<label for="re_text">댓글</label>
		<input type="text" id="re_text" name="re_text" >
		<button id="addButton" onclick="add(); return false;">추가</button>
		<ul id="replyList">
		
			<%	if(re_list!=null){
					for(ReplyVO rvo:re_list){
			%>
				<li>
					<input type="hidden" name="re_id" value="${ rvo.re_id }" id="re_id">
					<% System.out.println(rvo.getRe_id()); %>
					<%= rvo.getRe_writer() %>
					<br>
					<c:if test='<%= session.getAttribute("sm_id").equals(rvo.getRe_writer()) %>'>
						<input id="new_text" value="<%= rvo.getRe_text() %>">
					</c:if>
					<c:if test='<%= !session.getAttribute("sm_id").equals(rvo.getRe_writer()) %>'>
						<input value="<%= rvo.getRe_text() %>" readonly>
					</c:if>
					<c:if test='<%= session.getAttribute("sm_id").equals(rvo.getRe_writer()) %>'>
						<button id="re_update" onclick="up(); return false;">수정</button>
					</c:if>
				</li>
			<%
					}
				}
			%>
			
		</ul>
		</form>
			
		
		
		
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
function like(){
	$.ajax({
		type :"post",
		url :"/miniproject/tup",  
		data : {"tup" : update.tup.value,
				"id" : update.id.value },
		dataType : "json",	// text, xml, html, script, json, jsonp 가능 

		success : function(data){	
			if(data=="1"){
				alert("추천했습니다.");
			}else{
				alert(data);
			}
		},
		error : function(){
			alert("ajax 실행 실패");
		}
	});
}
function up(){
	console.log(replyform.new_text.value);
	console.log(replyform.re_id.value);
	$.ajax({
		type :"post",// 전송 방식 
		url :"/miniproject/reply/update",  //컨트롤러 사용할 때. 내가 보낼 데이터의 주소. 
		data : {"re_text" : replyform.new_text.value,
				"re_id" : replyform.re_id.value},
				
		dataType : "json",	
		success : function(data){	
			if(data=="1"){
				alert("댓글이 수정됨");
			}else{
				alert("수정 실패");
			}
		},
		error : function(){
			alert("ajax 실행 실패");
		}
	});
}
function add(){
	$.ajax({
		type :"post",// 전송 방식 
		url :"/miniproject/reply/insert",  //컨트롤러 사용할 때. 내가 보낼 데이터의 주소. 
		data : {"re_writer" : replyform.re_writer.value,
				"re_text" : replyform.re_text.value,
				"re_select" : replyform.re_select.value},
	
		dataType : "json",	// text, xml, html, script, json, jsonp 가능 
		success : function(data){	
			if(data=="1"){
				alert("댓글이 추가됨");
			}else{
				alert("댓글 실패");
			}
		},
		error : function(){
			alert("ajax 실행 실패");
		}
	});

}

</script>
</body>
</html>