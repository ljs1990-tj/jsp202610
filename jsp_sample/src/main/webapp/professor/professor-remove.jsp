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
		String profNo = request.getParameter("profNo");
		String query = "DELETE FROM PROFESSOR WHERE PROFNO = " + profNo;
		stmt.executeUpdate(query);
	%>
	<div>
		삭제되었습니다. <a href="professor-list.jsp">되돌아가기</a>
	</div>
</body>
</html>




