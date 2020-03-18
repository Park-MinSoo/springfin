<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.BoardVO,java.util.List,service.PagingService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Permanent+Marker&display=swap" rel="stylesheet">
<style>
	body{
		background-color : white;
		background-size : 100%;
	}

	h2,th{
	 	font-family: 'Permanent Marker';
		color: #999999;
	}
 	h2{
		font-size: 70px;
		font-weight: bold;
	}
	*{
		text-align : center;
	}
	th{
		font-size: 20px;
	}
	
	table{
		margin-left : auto;
		margin-right : auto;
		margin-bottom : 30px;
	}
	
	td {
		border-bottom: 2px dotted #999999;
		font-family: 'East Sea Dokdo';
		font-size: 25px;
		color: #999999;
		
	}

	tr:hover {
	background-color: #ffdd99;
	font-weight: bold;
	}

	td:nth-child(1) {
	width: 50px;
	}

	td:nth-child(2) {
	width: 200px;
	}

	td:nth-child(3) {
	width: 150px;
	}

	td:nth-child(3) {
	width: 100px;
	}

	form {
	text-align: center;
	}

	#divT {
	color: white;
	text-align: center;
	}

	h2 {
	text-align: center;
	}
	#btn2{
	background-color: #ff9999; 
	height:30px;
	border:1px solid #ff6666;
	color:#f0f0f5;
	font-family: 'East Sea Dokdo';
	font-weight: bold;
	font-size: 20px;
	}
	
</style>
</head>
<body>

	<h2>Official</h2>
	<br>
	<%
		List<BoardVO> list = (List<BoardVO>) request.getAttribute("list");
		BoardVO listOne = (BoardVO) request.getAttribute("listOne");
		int pageStart = (int) request.getAttribute("pageStart");
		int pageEnd = (int) request.getAttribute("pageEnd");
		boolean preData = (boolean) request.getAttribute("preData");
		boolean nextData = (boolean) request.getAttribute("nextData");
		//System.out.println("제발" + preData);
		//System.out.println("제발" + nextData);

		if (list != null) {
			//System.out.println("list가 왔는가");

	%>
		
	
	<div class="official">
		<table>
			<tr>
				<th>Num</th>
				<th>Title</th>
				<th>Writer</th>
				<th>Date</th>
				<th>Views</th>
			</tr>
			<%
				for (BoardVO vo : list) {
			%>
			<tr>
				<td><%=vo.getId()%></td>
				<td><a href="/miniproject/board/official/read?id=<%=vo.getId()%>&pgNum=${requestScope.pgNum}"><%=vo.getTitle()%></a></td>
				<td><a href="/miniproject/board/official/writer?writer=<%=vo.getWriter()%>&pgNum=${requestScope.pgNum}"><%=vo.getWriter()%></a></td>
				<td><%=vo.getWritedate()%></td>
				<td><%=vo.getCnt()%></td>
			</tr>

			<%
				}
		}
			%>
		</table>
	</div>

	<a href="/miniproject/board/official?pgNum=${pageStart}">&laquo;</a>
	
	<c:if test = "<%= preData %>">
		<a href="/miniproject/board/official?pgNum=${requestScope.pgNum-1}">이전</a>
	</c:if>
	
	<c:forEach var="i" begin="${pageStart}" end="${pageEnd}">
		<a style="${i == requestScope.pgNum? 'color:red;' : 'color : black;'}"
	       href = "/miniproject/board/official?pgNum=${i}">${i} &nbsp;</a>
	</c:forEach>
	
	<c:if test="<%= nextData %>">
		<a href="/miniproject/board/official?pgNum=${requestScope.pgNum+1}">다음</a>
	</c:if>

	<a href="/miniproject/board/official?pgNum=${pageEnd}">&raquo;</a>

	<br/>
	<br/>
	<c:if test='<%= session.getAttribute("sm_id").equals("admin1") %>'>
		<button onclick="location.href='/miniproject/board/official/write?pgNum=${requestScope.pgNum}';" id="btn2">글 작성</button>
	</c:if>
	<hr>
	<form method="get" action="/miniproject/board/official/search" id="search">	
		<select name="searchType">
			<option value="title" >제목</option>
			<option value="writer">작성자</option>
		</select>
		<input type="search" name="keyword">
		<input type="hidden" name="pgNum" value="${	requestScope.pgNum }">
		<button onclick="document.getElementById('search').submit();" id="btn2">검색</button>
	</form>

	<%
		if (request.getAttribute("msg") != null) {
	%>
	<script>
		alert('${ msg }');
	</script>

	<%
		}
	%>

</body>
</html>