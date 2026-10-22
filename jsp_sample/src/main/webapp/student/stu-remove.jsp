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
		String stuNo = request.getParameter("stuNo");
		String query = "DELETE FROM STU WHERE STUNO = " + stuNo;
		int result = stmt.executeUpdate(query);
		
		if(result > 0){
			out.println("삭제 됨!");
		} else {
			out.println("실패!");
		}
	%>
	<a href="stu-list.jsp">되돌아가기</a>
</body>
</html>






