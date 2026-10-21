<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:forward page="forward-view.jsp">
		<jsp:param value="홍길동" name="userName"/>
		<jsp:param value="30" name="age"/>
	</jsp:forward>


</body>
</html>