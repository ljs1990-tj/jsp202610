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
	td a {
		text-decoration: none;
		color : black;
	}
</style>
</head>
<body>
	<%@ include file="../db.jsp" %>
	<%
		String query = "SELECT P.*, NVL(BONUS, 0) AS BONUS2 FROM PROFESSOR P";
		System.out.println(query);
		ResultSet rs = stmt.executeQuery(query);	
	%>
	<table>
		<tr>
			<th>교수번호</th>
			<th>이름</th>
			<th>급여</th>
			<th>보너스</th>
		</tr>
		<% 
			while(rs.next()){
		%>
			<tr>
				<td><%= rs.getString("PROFNO") %></td>
				<td>
					<a href="professor-view.jsp?profNo=<%= rs.getString("PROFNO") %>"><%= rs.getString("NAME") %></a>
				</td>
				<td><%= rs.getString("PAY") %></td>
				<td><%= rs.getString("BONUS2") %></td>
			</tr>
		<%		
			}
		%>
		
	</table>
	<div>
		<a href="professor-add.jsp"><button>교수추가</button></a>
	</div>
</body>
</html>




