<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../db.jsp" %>
	<%
		String commentNo = request.getParameter("commentNo");
		String boardNo = request.getParameter("boardNo");
		String query = "DELETE FROM TBL_COMMENT WHERE COMMENTNO = " + commentNo;
		stmt.executeUpdate(query);
		
	%>
	
</body>
</html>
<script>
	alert("삭제되었습니다.");
	location.href = "board-view.jsp?boardNo="<%= boardNo %>;
</script>





