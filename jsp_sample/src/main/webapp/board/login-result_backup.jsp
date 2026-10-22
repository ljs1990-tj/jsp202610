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
		
		String query = "SELECT * FROM TBL_USER "
					+ "WHERE USERID = '" + userId + "' "
					+ "AND PWD = '" + pwd + "'"; 
		// out.println(query);
		ResultSet rs = stmt.executeQuery(query);
		
		if(rs.next()){
			/* out.println("로그인 성공"); */
			response.sendRedirect("board-list.jsp");
		} else {
			out.println("로그인 실패");
		}
	%>
</body>
</html>






