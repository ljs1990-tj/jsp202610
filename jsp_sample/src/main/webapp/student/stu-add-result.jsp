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
		String stuName = request.getParameter("stuName");
		String stuId = request.getParameter("stuId");
		String grade = request.getParameter("grade");
		String deptNo = request.getParameter("deptNo");
		
		String query = String.format(
				"INSERT INTO STU(STUNO, NAME, ID, GRADE, DEPTNO1) "
				+ "VALUES(%s, '%s', '%s', %s, %s)",
				stuNo, stuName, stuId, grade, deptNo
		);
		
		int result = stmt.executeUpdate(query);
		if(result > 0){
			out.println("추가되었습니다!");
		} else {
			out.println("오류가 발생했습니다.");
		}
	%>
	<div><a href="stu-list.jsp">되돌아가기</a></div>
</body>
</html>