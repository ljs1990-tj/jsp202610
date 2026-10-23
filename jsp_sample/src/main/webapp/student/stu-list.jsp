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
	.page a {
		text-decoration: none;
		color : black;
		margin-right : 3px;
	}
	.active {
		font-weight: bold;
	}
</style>
</head>
<body>
	<%@ include file="../db.jsp" %>
	<%
	String keyword = request.getParameter("keyword");
	String grade = request.getParameter("grade");
	String selectGrade = grade != null ? grade : "";
	
	/* 페이징에 사용할 변수 */
	int pageSize = 5; // 한 페이지에 보여줄 개수
	int currentPage = 1; // 현재 위치한 페이지
	
	if(request.getParameter("page") != null){
		currentPage = Integer.parseInt(request.getParameter("page"));
	}
	int offset = (currentPage - 1) * pageSize;
	
	String cntQuery = "SELECT COUNT(*) AS TOTAL FROM STU";
	ResultSet cntRS = stmt.executeQuery(cntQuery);
	cntRS.next();
	int total = cntRS.getInt("TOTAL");
	int pageList = (int) Math.ceil((double) total / pageSize);
	/* --------------- */
	
	/* System.out.println(keyword); */
	String query =  "SELECT * " +
            		"FROM STU S " +
          			"INNER JOIN DEPARTMENT D ON S.DEPTNO1 = D.DEPTNO " +
          			"WHERE 1=1 ";
	if(keyword != null){
		query += "AND NAME LIKE '%" + keyword + "%' ";
	}
	if(grade != null && !grade.equals("")){
		query += "AND GRADE = " + grade + " ";
		// System.out.println(query);
	}
	query += "OFFSET " + offset + " ROWS FETCH NEXT " + pageSize + " ROWS ONLY";
	ResultSet rs = stmt.executeQuery(query);
	
	int gradeList[] = {1,2,3,4};
	%>
	<form name="form" action="stu-list.jsp">
		<div>
			검색어 : <input name="keyword" value="<%= keyword != null ? keyword : "" %>">
				   <button onclick="fnSearch()">검색</button>
		   <select name="grade" onchange="fnGrade()">
		  	 <option value=""> :: 전체 :: </option>
		   <%
		   		for(int i=0; i<gradeList.length; i++){
		   %>
		   			<option value="<%= gradeList[i] %>" <%= selectGrade.equals(Integer.toString(gradeList[i])) ? "selected" : "" %>><%= gradeList[i] %>학년</option>
		   <%			
		   		}
		   %>
		   </select>
		</div>
		<hr> 
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
		<div class="page">
			<%
				for(int i=1; i<=pageList; i++){
					if(currentPage == i){
			%>
						<a href="?page=<%= i %>" class="active"><%= i %></a>
			<%			
					} else {
			%>
						<a href="?page=<%= i %>"><%= i %></a>
			<%			
					}	
				}
			%>
		</div>
		<div>
			<a href="stu-add.jsp"><button>학생추가</button></a>
		</div>
	</form>
</body>
</html>
<script>
	function fnSearch(){
		let form = document.form;
		location.href = "?keyword="+form.keyword.value;
		// location.href = "stu-list.jsp?keyword="+form.keyword.value;
	}
	
	function fnGrade(){
		let form = document.form;
		form.submit();
	}
	
</script>



