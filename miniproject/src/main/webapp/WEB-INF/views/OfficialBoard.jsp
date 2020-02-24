<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "vo.OfficialBoardVO,java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head><style>
	#title{
		text-align : center;
		font-weight : bold;
		color : blue;
		font-size : 36.5pt;
	}
	td{
		border-bottom : 1px solid black;
	}
	tr:hover{
		background-color : pink;	
		font-weight : bold;
	}
	td:nth-child(2)){
		width : 400px;
	}
	#writetext{
		text-align : center;
		margin : auto;
	}
	#write{
		text-align : center;
		margin : auto;
	}
	#reading{
		text-align : center;
		margin : auto;
	}
	#search{
		text-align : center;
		margin : auto;
	}
	.sub{
		text-align : center;
		font-weight : bold;
		font-size : 16.5pt;
	}
</style>
<body>
<%
	ArrayList<OfficialBoardVO> olist = (ArrayList<OfficialBoardVO>)request.getAttribute("olist");
	OfficialBoardVO olistone = (OfficialBoardVO)request.getAttribute("olistone");
	System.out.println("olistone:"+ olistone);
	if(olist !=null){
%>
	<h2 id="title">공지 게시판</h2>
	<table style="margin:auto">
	<tr>
	<td class="sub" style="color:blue">번호</td>
	<td class="sub" style="color:red">제목</td>
	<td class="sub" style="color:purple">작성자</td>
	<td class="sub" style="color:orange">작성일</td>
	<td class="sub" style="color:green">조회수</td>
	</tr>
<%
	for(OfficialBoardVO vo : olist){
%>
			<tr>
			<td class='<%= vo.getId() %>'><%= vo.getId() %></td>
			<td class='<%= vo.getId() %>' onclick="location.href='/miniproject/official/listOne?id=<%= vo.getId() %>'"><%= vo.getTitle() %></td>
			<td class='<%= vo.getId() %>' onclick="location.href='/miniproject/official/writer?writer=<%= vo.getWriter() %>'"><%= vo.getWriter() %></td>
			<td class='<%= vo.getId() %>'><%= vo.getWritedate() %></td><% 	System.out.println("getWritedate:"+vo.getWritedate()); %>
			<td class='<%= vo.getId() %>'><%= vo.getCnt() %></td>
			</tr>
<%
		}
%>
	</table>
<%
	}
%>

<div id="writetext">
<button onclick="displayDiv(1);">공지 작성</button>
</div>

<%
	
	if (olistone != null) {
		System.out.println("JSP 출력 :" + olistone);
%>

<div id="reading">
<form method = "post" action = "/miniproject/official/update">
<input type="hidden" name="action" value="official/update">
<input type="hidden" name="id" value="<%= olistone.getId() %>">
<br>
<input id="m_title" type="text" name="title"  value="<%= olistone.getTitle() %>">
<br>
<textarea id="m_content"  rows="3" cols="30" name = "content" ><%= olistone.getContent() %></textarea>
<br>
<input type= "button" value ="확인" onclick="displayDiv(3)">
<input type= "submit" value ="수정" >
<input type= "button" value ="삭제" onclick="location.href ='/miniproject/official/delete?id=<%= olistone.getId()%>'" >
</form>
</div>
<%
	}
%>

<script>
function displayDiv(type) {
	if(type == 1) {
		document.getElementById("write").style.display='block';
	}else if(type == 2) {
		document.getElementById("write").style.display='none';
	}
	else if(type == 3){
		document.getElementById("reading").style.display='none';
	}
}
</script>
<div id="write"  style="display:none">
<form method = "post" action = "/miniproject/official/insert">
<input type="hidden" name="action" value="official/insert">
<input type="text" name="title" placeholder="제목을 입력해주세요">
<br>
<textarea rows="3" cols="30" name = "content" placeholder="내용을 입력해주세요" ></textarea>
<br>
<input type = "submit" value = "저장">
<input type = "reset" value = "재작성">
<button onclick="displayDiv(2);return false;">취소</button>
</form>
</div>


<div id="search">
<form method = "get" action ="/miniproject/official/search">
<input type="hidden" name="action" value="official/search">
<select name="searchType">
<option value = "content">내용</option>
<option value = "title">제목</option>
<option value = "writer">작성자</option>
</select>
<input type = "text" name = "keyword" >
<input type = "submit" value = "공지검색">
</form>
</div>
</body>
</html>
