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
	td a {
		text-decoration: none;
		color : black;
	}
</style>
</head>
<body>
	<%@ include file="../db.jsp" %>
	<h4 style="display : inline-block;"><%= session.getAttribute("sessionName") %> 님이 접속중 입니다.</h4>
	<a href="login.jsp"><button>로그아웃</button></a>
	<hr>
	<h2>게시글 목록</h2>
	<hr>
	
	<%
		ResultSet rs = null;
		String query = "SELECT B.*, NVL(COMMENT_CNT, 0) AS COMMENT_CNT "
			            + "FROM TBL_BOARD B "
			            + "LEFT JOIN ( "
			            + "    SELECT BOARDNO, COUNT(BOARDNO) AS COMMENT_CNT "
			            + "    FROM TBL_COMMENT "
			            + "    GROUP BY BOARDNO "
			            + ") T ON B.BOARDNO = T.BOARDNO";
		String sessionRole = (String) session.getAttribute("sessionRole");
		String sessionId = (String) session.getAttribute("sessionId");
		rs = stmt.executeQuery(query);
	%>
	
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>삭제</th>
		</tr>
	<%	
		while(rs.next()){
			// out.println("<div>" + rs.getString("CONTENTS") + "</div>");
	%>
		<tr>
			<td><%= rs.getString("BOARDNO") %></td>
			<td>
				<a href="javascript:;" onclick="fnView(<%= rs.getString("BOARDNO") %>)">
					<%= rs.getString("TITLE") %> 
					<% if(rs.getInt("COMMENT_CNT") != 0){
						out.println("<span style='color:orange;'>[" + rs.getInt("COMMENT_CNT") + "]</span>");
					} %>
				</a>
			</td>
			<td><%= rs.getString("USERID") %></td>
			<td><%= rs.getString("CNT") %></td>
			<td>
				<%
					if(sessionId.equals(rs.getString("USERID")) || sessionRole.equals("A")){
				%>
					<button onclick="fnRemove(<%= rs.getString("BOARDNO") %>)">삭제</button>
				<%			
					}
				%>
				
			</td>
		</tr>
	<%				
		}
		
	%>
	</table>
	<div>
		<a href="board-add.jsp"><button>글쓰기</button></a>
	</div>
</body>
</html>
<script>
	function fnView(boardNo){
		location.href = "board-view.jsp?boardNo="+boardNo;
	}
	
	function fnRemove(boardNo){
		if(!confirm("정말 삭제??")){
			return;
		}
		location.href = "board-remove-result.jsp?boardNo="+boardNo;
	}
</script>





