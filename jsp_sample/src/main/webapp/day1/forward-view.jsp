<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>이동한 페이지</h3>
	<div>이름 : <%= request.getParameter("userName") %></div>
	<div>나이 : <%= request.getParameter("age") %></div>
	
	
</body>
</html>