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
					+ "WHERE USERID = '" + userId + "' "; 
		// out.println(query);
		ResultSet rs = stmt.executeQuery(query);
		
		if(rs.next()){
			/* 아이디 통과 */
			
			if(rs.getString("PWD").equals(pwd)){
				// 비밀번호 통과
				response.sendRedirect("board-list.jsp");				
			} else {
				out.println("비밀번호를 확인해주세요");
			}
						
		} else {
			out.println("아이디가 존재하지 않습니다");
		}
	%>
</body>
</html>






