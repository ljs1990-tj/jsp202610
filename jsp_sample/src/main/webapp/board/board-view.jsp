<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 게시글번호, 제목, 내용, 작성자, 작성일 출력 -->
	<%@ include file="../db.jsp" %>
	<%
		ResultSet rs = null;
		String boardNo = request.getParameter("boardNo");
		String query = "SELECT * FROM TBL_BOARD WHERE BOARDNO = " + boardNo;
		rs = stmt.executeQuery(query);
		
		if(rs.next()){
	%>	
			<h3>번호 : <%= rs.getString("BOARDNO") %></h3>
			<h3>제목 : <%= rs.getString("TITLE") %></h3>
			<h4>내용 : <%= rs.getString("CONTENTS") %></h4>
			<h4>작성자 : <%= rs.getString("USERID") %></h4>
			<h4>작성일 : <%= rs.getString("CDATETIME") %></h4>
	<%		
		} else {		
	%>
			<div>삭제된 게시글 입니다.</div>
			<a href="board-list.jsp"><button>되돌아가기</button></a>
	<%		
		}
	%>
	<div>
		<input type="button" value="수정">
		<input type="button" value="삭제" onclick="fnRemove()">
	</div>
	
</body>
</html>
<script>
	function fnRemove(){
		if(!confirm("정말 삭제??")){
			return;
		}
		location.href = "board-remove-result.jsp?boardNo="+<%= boardNo %>;
		
	}
</script>


