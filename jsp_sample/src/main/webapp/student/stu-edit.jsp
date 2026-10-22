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
		
		String grade = rs.getString("GRADE");
		String deptNo = rs.getString("DEPTNO1");
	%>
	
	<form name="form" action="stu-edit-result.jsp">
		<input name="stuNo" value="<%= rs.getString("STUNO") %>" hidden>
		<table>
			<tr>
				<th>학번</th>
				<td><input value="<%= rs.getString("STUNO") %>" disabled></td>
				<th>이름</th>
				<td><input name="stuName" value="<%= rs.getString("NAME") %>"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input name="stuId" value="<%= rs.getString("ID") %>"></td>
				<th>학년</th>
				<td>
					<select name="grade">
						<option value="1" <%= grade.equals("1") ? "selected" : "" %>>1학년</option>
						<option value="2" <%= grade.equals("2") ? "selected" : "" %>>2학년</option>
						<option value="3" <%= grade.equals("3") ? "selected" : "" %>>3학년</option>
						<option value="4" <%= grade.equals("4") ? "selected" : "" %>>4학년</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>학과</th>
				<td colspan="3">
					<select name="deptNo">
					<%
						String deptQuery = "SELECT * FROM DEPARTMENT WHERE DNAME LIKE '%학과'";
						ResultSet deptRS = stmt.executeQuery(deptQuery);	
						while(deptRS.next()){
					%>
						<option value="<%= deptRS.getString("DEPTNO") %>" 
								<%= deptRS.getString("DEPTNO").equals(deptNo) ? "selected" : "" %> 
						>
								<%= deptRS.getString("DNAME") %>
						</option>
					<%		
						}
					%>
					</select>
				</td>
			</tr>
		</table>
		<div class="btn">
			<input type="button" value="수정" onclick="fnEdit()">
			<input type="reset" value="초기화">
			<a href="stu-list.jsp"><button>목록으로</button></a>
		</div>
	</form>
</body>
</html>
<script>
	function fnEdit(){
		let form = document.form;
		form.submit();
	}
</script>


