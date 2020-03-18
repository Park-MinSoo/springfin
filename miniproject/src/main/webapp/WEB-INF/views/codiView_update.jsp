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
		<form method="post" action="/miniproject/board/codi/update" id="update">
			<input type="hidden" name="id" value="${ listOne.id }">
			<input type="hidden" name="pgNum" value="${ requestScope.pgNum }">
			작성자 : <span id="writer" name="writer"><%=listOne.getWriter()%></span>
			<br>
			<c:if test='<%= session.getAttribute("sm_id").equals(listOne.getWriter()) %>'>
				제  목 : <div contenteditable="true" id="title" name="title"><%=listOne.getTitle()%></div>
				내용 <br> 
				<div contenteditable="true" id="content" name="content"><%=listOne.getContent()%></div>
				<script>
					window.onload = function(){
						var title = document.querySelector("#title");
						var content = document.querySelector("#content");

						var editables = document.querySelectorAll("div[contenteditable=true]");
						console.log("여기는?");
						for(i=0; i<editables.length; i++) {
					       editables[i].onblur = function(event) {
					    	   	console.log("들어온 곳");
								var field = this.id;
								var value = this.innerText;
								var url = "/miniprojcet/board/codi/read?id="+<%= listOne.getId() %>+"&pgNum="+${ requestScope.pgNum };
								var param = field + "=" + value;
					            console.log(param);
					            var xhr = new XMLHttpRequest();
								xhr.onload = function handleStateChange	(event) {
									if (xhr.status == 200) {
										title.innerText = xmlHttp.responseText[0];
						                content.innerText = xmlHttp.responseText[1];				
									}
								};
								xhr.open('GET', url , true);
								xhr.send();
							}
						}
						
						
					}
				</script>
			</c:if>
			<c:if test='<%= !session.getAttribute("sm_id").equals(listOne.getWriter()) %>'>
				제  목 : <span id="title" name="title"><%=listOne.getTitle()%></span>
				<br>
				내용 <br> 
				<div id="content" name="content"><%=listOne.getContent()%></div>
			</c:if>
			
			추천 수 :<span id="tup" name="tup">${ listOne.tup }</span>
			<button onclick="like(); return false;">추천</button>
			<br>
			<button onclick="${ requestScope.referer }" id="btn-referer">확인</button>
			<c:if test='<%= session.getAttribute("sm_id").equals(listOne.getWriter()) %>'>
				<button id="update" onclick="updateSubmit(); return false;">수정</button>
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
					<%=rvo.getRe_writer() %>
					<br>
					<%=rvo.getRe_text() %>
					<button id="re_update" onclick="location.href='/miniproject/reply/update'; return false;">수정</button>
				</li>
			<%
					}
				}
			%>
			
		</ul>
		</form>
			
		
		
		
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
function updateSubmit(){
	document.getElementById('update').submit();
	alert("수정 성공");

}

//추천수 기능
function like(){
	//localstorage 통해서 tup 변수 늘리기
	
}
function add(){
	$.ajax({
		type :"post",// 전송 방식 
		url :"/miniproject/reply/insert",  //컨트롤러 사용할 때. 내가 보낼 데이터의 주소. 
		data : {"re_writer" : replyform.re_writer.value,
				"re_text" : replyform.re_text.value,
				"re_select" : replyform.re_select.value},
		
		// JSON형식 안에 JSON 형식으로 표현한 데이터. 
        //"파라미터 이름" : 폼태그에 적은 NAME 값.ID입력창의 NAME값.value 여러 개도 가능				
		
		dataType : "json",	// text, xml, html, script, json, jsonp 가능 
        //정상적인 통신을 했다면 function은 백엔드 단에서 데이터를 처리.
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