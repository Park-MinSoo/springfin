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
	.container{
	    padding: 50px 100px;
	    transition: .5s;
	}
	.container header{
	    position: absolute;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: auto;
	    padding: 40px 50px;
	    background: #e1e6ec;
	    box-shadow: 0 2px 10px rgba(0, 0, 0, .4);
	}
	.container header nav{
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	}
	.container header nav .logo .logo-name{
	    font-size: 3em;
	    color: #000;
	    text-transform: uppercase;
	    font-family: ;
	    font-weight: bold;
	    padding: 0 0.25em;
	}
	
	.container header nav .login ul{
	    list-style-type: none;
	}
	
	.container header nav .login ul li{
	    display: inline;
	    padding: 12px 18px;
	    margin: 0 16px;
	    font-size: 1.5rem;
	    font-family: ;
	    font-weight: 100;
	    cursor: pointer;
	}
	.container header nav .login ul li{
	    padding: 16px 22px;
	    border-radius: 50px;
	    background: #e1e6ec;
	    box-shadow: 3px 3px 10px 1px rgba(0, 0, 0, .2),
	                -3px -3px 10px 1px rgba(255, 255, 255, 1);
	}
	
	.container header nav .login ul li:active{
	    box-shadow: inset 3px 3px 10px 1px rgba(0, 0, 0, .2),
	                inset -3px -3px 10px 1px rgba(255, 255, 255, 1);
	}
	.container.active{
    filter: blur(20px);
    transition: .5s;
    pointer-events: none;
	}
	*, *:after, *:before {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	}
	#container {
	grid-area: main;
	align-self: left;
	justify-self: left;
	}
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

	td:nth-child(4) {
	width: 200px;
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
	<div class="container">
		<header>
			<nav>
			     <a class="logo" href="/miniproject/menu" style="text-decoration: none;">
				 <span class="logo-name">STYLE COORDER</span></a>
			</nav>
		</header>
	</div>
	<h2>Coordination</h2>
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
		
	
	<div class="Codi">
		<table>
			<tr>
				<th>Num</th>
				<th>Title</th>
				<th>Writer</th>
				<th>Date</th>
				<th>Views</th>
				<th>Likes</th>
			</tr>
			<%
				for (BoardVO vo : list) {
			%>
			<tr>
				<td><%=vo.getId()%></td>
				<td><a href="/miniproject/board/codi/read?id=<%=vo.getId()%>&pgNum=${requestScope.pgNum}"><%=vo.getTitle()%></a></td>
				<td><a href="/miniproject/board/codi/writer?writer=<%=vo.getWriter()%>&pgNum=${requestScope.pgNum}"><%=vo.getWriter()%></a></td>
				<td><%=vo.getWritedate()%></td>
				<td><%=vo.getCnt()%></td>
				<td><%=vo.getTup()%></td>
			</tr>

			<%
				}
		}
			%>
		</table>
	</div>

	<a href="/miniproject/board/codi?pgNum=${pageStart}">&laquo;</a>
	
	<c:if test = "<%= preData %>">
		<a href="/miniproject/board/codi?pgNum=${requestScope.pgNum-1}">이전</a>
	</c:if>
	
	<c:forEach var="i" begin="${pageStart}" end="${pageEnd}">
		<a style="${i == requestScope.pgNum? 'color:red;' : 'color : black;'}"
	       href = "/miniproject/board/codi?pgNum=${i}">${i} &nbsp;</a>
	</c:forEach>
	
	<c:if test="<%= nextData %>">
		<a href="/miniproject/board/codi?pgNum=${requestScope.pgNum+1}">다음</a>
	</c:if>

	<a href="/miniproject/board/codi?pgNum=${pageEnd}">&raquo;</a>

	<br/>
	<br/>
	
	<button onclick="location.href='/miniproject/board/codi/write?pgNum=${requestScope.pgNum}';" id="btn2">글 작성</button>
	<hr>
	<form method="get" action="/miniproject/board/codi/search" id="search">	
		<select name="searchType">
			<option value="title" >제목</option>
			<option value="writer">작성자</option>
		</select>
		<input type="search" name="keyword">
		<input type="hidden" name="pgNum" value="${	requestScope.pgNum }">
		<button onclick="document.getElementById('search').submit();" id="btn2">검색</button>
	</form>
	<%
		if (listOne != null) {
			//System.out.println("리스트 원값 출력 확인 : "+listOne);
	%>
	
	<%
		}
		
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