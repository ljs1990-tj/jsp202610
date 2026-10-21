<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>변수!</h2>
	<%!
		int num1 = 3;
		int num2 = 5;
	%>
	<h3>두 수의 합 : <%= num1+num2 %></h3>

</body>
</html>