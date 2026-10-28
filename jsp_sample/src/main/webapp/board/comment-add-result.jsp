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
		String boardNo = request.getParameter("boardNo");
		String contents = request.getParameter("contents");
		String sessionId = (String) session.getAttribute("sessionId");
		String query = "INSERT INTO TBL_COMMENT "
			+ "VALUES(COMMENT_SEQ.NEXTVAL, " + boardNo + ", '" + contents + "', "
			+ "'" + sessionId + "', SYSDATE, SYSDATE)";
		System.out.println(query);
		
		stmt.executeUpdate(query);
	%>
</body>
</html>
<script>
	alert("추가되었습니다!");
	location.href = "board-view.jsp?boardNo=" + <%= boardNo %>;
</script>




