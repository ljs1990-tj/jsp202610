<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		String userName = request.getParameter("userName");
		String gender = request.getParameter("gender");
	%>
	
	<div>아이디 : <%= userId %></div>
	<div>비밀번호 : <%= pwd %></div>
	<div>이름 : <%= userName %></div>
	<div>성별 : <%= gender %></div>
</body>
</html>




