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
		String profName = request.getParameter("profName");
		
		String query = "INSERT INTO PROFESSOR(PROFNO, NAME) "
					+ "VALUES("+profNo+", '" + profName + "')";
		System.out.println(query);
		stmt.executeUpdate(query);
	%>
	<div>성공!</div>
	<a href="professor-list.jsp"><button>되돌아가기</button></a>
</body>
</html>





