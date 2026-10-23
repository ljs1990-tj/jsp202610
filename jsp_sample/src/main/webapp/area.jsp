<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="db.jsp" %>
	<%
		String siQuery = "SELECT * FROM AREA WHERE GU IS NULL ORDER BY SI ASC";
		ResultSet rs = stmt.executeQuery(siQuery);	
		
		String paramSi = request.getParameter("si");
		String paramGu = request.getParameter("gu");
		String paramDong = request.getParameter("dong");
	%>
	<form name="form" action="area.jsp">
		<div>
			<select name="si" onchange="fnSelect()">
			<option value="">:: 선택 ::</option>
			<%
				while(rs.next()){
					String si = rs.getString("SI");
					String selected = paramSi != null && si.equals(paramSi) ? "selected" : "";
			%>
					<option value="<%= si %>" <%= selected %>><%= si %></option>
			<%
				}
			%>
			</select>
			
			<select name="gu" onchange="fnSelect()">
				<option value="">:: 선택 ::</option>
			<%
				String guQuery = "SELECT * FROM AREA WHERE DONG IS NULL AND GU IS NOT NULL ";
				if(paramSi != null){
					guQuery += "AND SI = '" + paramSi + "'";
				}
				rs = stmt.executeQuery(guQuery);
				while(rs.next()){
					String gu = rs.getString("GU");
					String selected = paramGu != null && gu.equals(paramGu) ? "selected" : "";
			%>
					<option value="<%= gu %>" <%= selected %>><%= gu %></option>
			<%
				}
			%>
			</select>
			
			<select name="dong" onchange="fnSelect()">
				<option value="">:: 선택 ::</option>
			<%
				String dongQuery = "SELECT * FROM AREA WHERE DONG IS NOT NULL ";
				if(paramGu != null){
					dongQuery += "AND SI = '" + paramSi + "' AND GU = '" + paramGu + "'";
				}
				rs = stmt.executeQuery(dongQuery);
				while(rs.next()){
					String dong = rs.getString("DONG");
					String selected = paramDong != null && dong.equals(paramDong) ? "selected" : "";
			%>
					<option value="<%= dong %>" <%= selected %>><%= dong %></option>
			<%
				}
			%>
			</select>
		</div>
	</form>
</body>
</html>
<script>
	function fnSelect(){
		let form = document.form;
		form.submit();
	}
</script>






