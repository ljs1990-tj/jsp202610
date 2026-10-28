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
		String profNo = request.getParameter("profNo");
		String query = "SELECT * FROM PROFESSOR WHERE PROFNO = " + profNo;
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		
		out.println("번호 : " + rs.getString("PROFNO") + "<br>");
		out.println("이름 : " + rs.getString("NAME"));
	%>
	<div>
		<button>수정</button>
		<!-- 수정 버튼 누르면 '아직 준비중 입니다' 출력 후 리스트로 이동 -->
		<button onclick="fnRemove()">삭제</button>
	</div>
</body>
</html>
<script>
	function fnRemove(){
		if(!confirm("정말 삭제??")){
			return;
		}
		location.href = "professor-remove.jsp?profNo="+<%= profNo %>;
		
	}
</script>



