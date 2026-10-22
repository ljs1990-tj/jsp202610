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
		String boardNo = request.getParameter("boardNo");
		String query = "SELECT * FROM TBL_BOARD WHERE BOARDNO = " + boardNo;
		ResultSet rs = stmt.executeQuery(query);
		if(!rs.next()){
			out.println("게시글 정보가 없습니다.");
		} else {
			String kind = rs.getString("KIND");
	%>
	
	<form name="form" action="">
		<div>
			제목 : <input name="title" value="<%= rs.getString("TITLE") %>">
		</div>
		<div>
			종류 : <select name="kind">
					<option value="1" <%= kind.equals("1") ? "selected" : "" %>>공지사항</option>
					<option value="2" <%= kind.equals("2") ? "selected" : "" %>>자유게시판</option>
					<option value="3" <%= kind.equals("3") ? "selected" : "" %>>질문게시판</option>
				 </select>
		</div>
		<div>
			내용 : <textarea name="contents" cols="20" rows="5"><%= rs.getString("CONTENTS") %></textarea>
		</div>
		<div>
			<input type="button" value="수정" onclick="fnAdd()">
		</div>
	</form>
	<%
		}
	%>
</body>
</html>