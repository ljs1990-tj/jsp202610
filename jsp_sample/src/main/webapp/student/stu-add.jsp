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
		ResultSet rs = null;
		String query = "SELECT * FROM DEPARTMENT WHERE DNAME LIKE '%학과'";
		rs = stmt.executeQuery(query);		
	%>
	<form name="form" action="stu-add-result.jsp">
		<table>
			<tr>
				<th>학번</th>
				<td><input name="stuNo"></td>
				<th>이름</th>
				<td><input name="stuName"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input name="stuId"></td>
				<th>학년</th>
				<td>
					<select name="grade">
						<option value="1">1학년</option>
						<option value="2">2학년</option>
						<option value="3">3학년</option>
						<option value="4">4학년</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>학과</th>
				<td colspan="3">
					<select name="deptNo">
					<%
						while(rs.next()){
					%>
						<option value="<%= rs.getString("DEPTNO") %>"><%= rs.getString("DNAME") %></option>
					<%		
						}
					%>
					</select>
				</td>
			</tr>
		</table>
		<div class="btn">
			<input type="button" value="학생추가" onclick="fnAdd()">
			<input type="reset" value="초기화">
			<a href="stu-list.jsp"><button>목록으로</button></a>
		</div>
	</form>
</body>
</html>
<script>
	function fnAdd(){
		let form = document.form;
		if(form.stuNo.value.length != 4){
			alert("학번은 4글자 입니다.");
			return;
		}
		
		form.submit();
	}
</script>


