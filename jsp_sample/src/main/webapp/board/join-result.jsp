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
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		String userName = request.getParameter("userName");
	
		String query = "INSERT INTO TBL_USER(USERID, PWD, NAME) VALUES("
					+ "'" + userId + "',"
					+ "'" + pwd + "',"
					+ "'" + userName + "')";
		int result = stmt.executeUpdate(query);
		if(result > 0){
			out.println("가입 성공!");
		} else {
			out.println("가입 실패!");
		}
	%>
</body>
</html>




