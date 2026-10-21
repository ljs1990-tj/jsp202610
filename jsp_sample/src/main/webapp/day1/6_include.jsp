<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 디렉티브 include -->
	<!-- include된 파일에 있는 코드들을 다 모은다음에 컴파일(실행) -->

	<%@ include file="variable.jsp" %>	
	<h3>두 수의 곱 : <%= num1 * num2 %></h3>
	
	<!-- 액션 include -->
	<!-- 각 파일에서 컴파일 한 후 결과를 합친다. -->
	
	<%-- <jsp:include page="variable.jsp"></jsp:include>
	<h3>두 수의 곱 : <%= num1 * num2 %></h3> --%>

</body>
</html>