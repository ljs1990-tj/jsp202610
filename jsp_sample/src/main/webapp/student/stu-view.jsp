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
	td input {
		width : 270px;
		height: 25px; 		
	}
	th {
		background-color: #eee;
		padding : 10px 20px;
	}
	td {
		text-align : left;
		width: 300px;
		padding : 10px;
	}
	select {
		height: 25px;
	}
	.btn {
		margin : 10px 3px;
	}
</style>
</head>
<body>
	<%@ include file="../db.jsp" %>
	<%
		String stuNo = request.getParameter("stuNo");
		String query =  "SELECT S.*, DNAME, SUBSTR(JUMIN, 1, 6) AS BIRTH " +
	            		"FROM STU S " +
	          			"INNER JOIN DEPARTMENT D ON S.DEPTNO1 = D.DEPTNO " +
	          			"WHERE STUNO = " + stuNo;
		System.out.println(query);
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		
	%>
	<!-- 학번, 이름, 학년, 생년월일(주민 앞에 6자리), 번호, 학과명 -->
	<table>
		<tr>
			<th>학번</th>
			<td><%= rs.getString("STUNO") %></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%= rs.getString("NAME") %></td>
		</tr>
		<tr>
			<th>학년</th>
			<td><%= rs.getString("GRADE") %></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><%= rs.getString("BIRTH") %></td>
		</tr>
		<tr>
			<th>번호</th>
			<td><%= rs.getString("TEL") %></td>
		</tr>
		<tr>
			<th>학과명</th>
			<td><%= rs.getString("DNAME") %></td>
		</tr>
	</table>
	<div>
		<button onclick="fnEdit()">수정</button>
		<button onclick="fnRemove()">삭제</button>
	</div>
	
</body>
</html>
<script>
	function fnEdit(){
		location.href = "stu-edit.jsp?stuNo="+<%= stuNo %>;
	}
	function fnRemove(){
		if(!confirm("삭제??")){
			return;
		}
		location.href = "stu-remove.jsp?stuNo="+<%= stuNo %>;
	}
</script>


