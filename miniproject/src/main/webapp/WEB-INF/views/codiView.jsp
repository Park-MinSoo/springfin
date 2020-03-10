<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.BoardVO,java.util.List" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

	<h2>Coordination</h2>
	<br>
	<%
		List<BoardVO> list = (List<BoardVO>) request.getAttribute("list");
		BoardVO listone = (BoardVO) request.getAttribute("listone");
		System.out.println("제발" + listone);
		if (list != null) {
	%>
	<div class="Codi">
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
				<td><a href="/miniproject/codi?action=read&id=<%=vo.getId()%>"><%=vo.getTitle()%></a></td>
				<td><a href="/miniproject/codi?action=writer&writer=<%=vo.getWriter()%>"><%=vo.getWriter()%></a></td>
				<td><%=vo.getWritedate()%></td>
				<td><%=vo.getCnt()%></td>
			</tr>

			<%
				}
		}
			%>
		</table>
	</div>
	<button onclick="displayDiv(1);" id="btn2">글 작성</button>
	<hr>
	<form method="get" action="/miniproject/codi">	
		<select name="searchType">
			<option value="title" >제목</option>
			<option value="writer">작성자</option>
		</select>
		<input type="search" name="keyword">
		<input type="hidden" name="action" value="search">
		<button onclick="location.href='/miniproject/codi'" id="btn2">검색</button>
	</form>
	<%
		if (listone != null) {
			System.out.println("리스트 원값 출력 확인 : "+listone);
	%>
	<div id="read">
		<h3>게시글 내용</h3>
		<form method="post" action="/miniproject/codi">
			<input type="hidden" name="id" value="<%=listone.getId()%>">
			<textarea rows="1" cols="30" id="writer" name="writer"><%=listone.getWriter()%></textarea>
			<br>
			<textarea rows="1" cols="30" id="title" name="title"><%=listone.getTitle()%></textarea>
			<br>
			<textarea rows="10" cols="30" id="content" name="content"><%=listone.getContent()%></textarea>
			<br>
			<button onclick="displayDiv(3); return false;" id="btn2">확인</button>
			<input type="hidden" name="action" value="update">			
			<input type="submit" id="btn2" value="수정" >
			<button
				onclick="location.href='/miniproject/codi?action=delete&id=<%=listone.getId()%>'; return false;" id="btn2">삭제</button>
		</form>
	</div>
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

	<script>
		function displayDiv(type) {
			if (type == 1) {
				document.getElementById("write").style.display = 'block';
				document.getElementById("read").style.display = 'none';
			} else if (type == 2){
				document.getElementById("read").style.display = 'block';
				document.getElementById("write").style.display = 'none';
			}else{
				document.getElementById("read").style.display = 'none';
				document.getElementById("write").style.display = 'none';
			}
		}
	</script>
	<div id="write" style="display: none">
		<h2 id="divT"></h2>
		<form method="post" action="/miniproject/codi">
			<input type="hidden" name="action" value="insert">
			 <input	type="text" name="writer" style="width: 330px;" placeholder="이름을 입력해주세요"><br>
			 <input type="text" name="title" style="width: 330px;" placeholder="제목을 입력해주세요"><br>
			<textarea id="content" rows="10" cols="45" name="content" placeholder="내용을 입력해주세요"></textarea>
			<br>
			 <input type="submit" value="저장">
			 <input	type="reset" value="재작성">
			 <button onclick="displayDiv(3); return false;">취소</button>
		</form>
	</div>

</body>
</html>


