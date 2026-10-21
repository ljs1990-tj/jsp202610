<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, tr, th, td {
		border : 2px solid black;
		border-collapse: collapse;
		padding : 5px 10px;
		text-align: center;
	}
</style>
</head>
<body>
	<%@ include file="../db.jsp" %>
	<h2>게시글 목록</h2>
	<hr>
	
	<%
		ResultSet rs = null;
		String query = "SELECT * FROM TBL_BOARD";
		rs = stmt.executeQuery(query);
	%>
	
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>
	<%	
		while(rs.next()){
			// out.println("<div>" + rs.getString("CONTENTS") + "</div>");
	%>
		<tr>
			<td><%= rs.getString("BOARDNO") %></td>
			<td>
				<a href="javascript:;" onclick="fnView(<%= rs.getString("BOARDNO") %>)"><%= rs.getString("TITLE") %></a>
			</td>
			<td><%= rs.getString("USERID") %></td>
			<td><%= rs.getString("CNT") %></td>
		</tr>
	<%				
		}
		
	%>
	</table>
	<div>
		<button>글쓰기</button>
	</div>
</body>
</html>
<script>
	function fnView(boardNo){
		location.href = "board-view.jsp?boardNo="+boardNo;
	}
</script>





