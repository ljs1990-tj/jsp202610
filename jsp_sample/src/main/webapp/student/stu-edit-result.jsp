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
		
		String query = "UPDATE STU SET "
					+ "NAME = '" + stuName + "', "
					+ "ID = '" + stuId + "', "
					+ "GRADE = '" + grade + "', "
					+ "DEPTNO1 = '" + deptNo + "' "
					+ "WHERE STUNO = " + stuNo;
		System.out.println(query);
		int result = stmt.executeUpdate(query);
		
		if(result > 0){
			out.println("수정 됨!");
		} else {
			out.println("실패!");
		}
	%>
	<div>
		<a href="stu-list.jsp">되돌아가기</a>
	</div>
</body>
</html>





