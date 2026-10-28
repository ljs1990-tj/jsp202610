<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 게시글번호, 제목, 내용, 작성자, 작성일 출력 -->
	<%@ include file="../db.jsp" %>
	<%
		
		String sessionId = (String) session.getAttribute("sessionId");
		String sessionRole = (String) session.getAttribute("sessionRole");
		ResultSet rs = null;
		String boardNo = request.getParameter("boardNo");
		String query = "SELECT * FROM TBL_BOARD WHERE BOARDNO = " + boardNo;
		
		String updateQuery = "UPDATE TBL_BOARD SET CNT = CNT + 1 WHERE BOARDNO = " + boardNo;
		stmt.executeUpdate(updateQuery);
		
		rs = stmt.executeQuery(query);
		
		if(rs.next()){
	%>	
			<h3>번호 : <%= rs.getString("BOARDNO") %> | 조회수 : <%= rs.getString("CNT") %></h3>
			<h3>제목 : <%= rs.getString("TITLE") %></h3>
			<h4>내용 : <%= rs.getString("CONTENTS") %></h4>
			<h4>작성자 : <%= rs.getString("USERID") %></h4>
			<h4>작성일 : <%= rs.getString("CDATETIME") %></h4>
	<%		
		} else {		
	%>
			<div>삭제된 게시글 입니다.</div>
			<a href="board-list.jsp"><button>되돌아가기</button></a>
	<%		
		}
	%>
	<div>
		<%
			if(sessionId.equals(rs.getString("USERID")) || sessionRole.equals("A")){
		%>
			<input type="button" value="수정" onclick="fnEdit()">
			<input type="button" value="삭제" onclick="fnRemove()">
		<%		
			}
		
		%>
		
	</div>
	<hr>
	<%
		String commentQuery = "SELECT * FROM TBL_COMMENT WHERE BOARDNO = " + boardNo;
		ResultSet commentRS = stmt.executeQuery(commentQuery);
		while(commentRS.next()){
			
			out.println(commentRS.getString("USERID") + " : ");
			out.println(commentRS.getString("CONTENTS"));
			if(sessionId.equals(commentRS.getString("USERID")) || sessionRole.equals("A")){
				out.println("<button>수정</button>");
		%>
				<button onclick="fnCommentRemove('<%= commentRS.getString("COMMENTNO") %>')">삭제</button>
		<%		
			}
			out.println("<br>");
		}
	%>
	<hr>
	<form action="comment-add-result.jsp">
		<input name="boardNo" value="<%= boardNo %>" hidden>
		<div>
			댓글등록 : <input name="contents" required>
			<input type="submit" value="등록">
		</div>
	</form>
	
	<br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>
<script>
	function fnRemove(){
		if(!confirm("정말 삭제??")){
			return;
		}
		location.href = "board-remove-result.jsp?boardNo="+<%= boardNo %>;
		
	}
	
	function fnEdit(){
		
		location.href = "board-edit.jsp?boardNo="+<%= boardNo %>;
		
	}
	
	function fnCommentRemove(commentNo){
		
		location.href = "comment-remove-result.jsp?commentNo="+commentNo+"&boardNo="+<%= boardNo %>;
	}
</script>


