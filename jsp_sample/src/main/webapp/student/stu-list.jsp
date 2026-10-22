<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, tr, th, td {
		border : 2px solid black;
		border-collapse: collapse;
		padding : 5px 10px;
		text-align: center;
	}
</style>
</head>
<body>
	<%@ include file="../db.jsp" %>
	<%
	String query =  "SELECT * " +
            		"FROM STU S " +
          			"INNER JOIN DEPARTMENT D ON S.DEPTNO1 = D.DEPTNO";
	ResultSet rs = stmt.executeQuery(query);
	
	%>
	<table>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>아이디</th>
			<th>학년</th>
			<th>학과</th>
		</tr>
	<%
		while(rs.next()){
	%>
		<tr>
			<td><%= rs.getString("STUNO") %></td>
			<td>
				<a href="stu-view.jsp?stuNo=<%= rs.getString("STUNO") %>"><%= rs.getString("NAME") %></a>
			</td>
			<td><%= rs.getString("ID") %></td>
			<td><%= rs.getString("GRADE") %></td>
			<td><%= rs.getString("DNAME") %></td>
		</tr>		
	<%		
		}
	%>
	
	</table>
	<div>
		<a href="stu-add.jsp"><button>학생추가</button></a>
	</div>
</body>
</html>



