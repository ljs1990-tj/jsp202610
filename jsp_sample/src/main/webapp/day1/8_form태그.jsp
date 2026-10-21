<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- jsp의 핵심 form 태그 -->
	<!-- form태그 내의 submit 버튼 클릭 시 action 속성에 있는 페이지로 이동 -->
	<!-- 이때, form 태그 내의 input 태그(select, textarea 등 포함)에 있는 값들을  -->
	<!-- request객체에 담아서 이동 -->
	<!-- input태그의 name속성이 키(key), 입력한 값이 value -->
	
	<!-- method는 옵션. get or post, 디폴트는 get -->
	<!-- get방식은 url(주소)에 값을 담아서 보낸다. get은 빠르지만 보안에 취약 -->
	<!-- post는 숨겨서 보낸다. 패스워드나 개인정보등이 있을 때는 post를 사용 -->
	
	<!-- 앞으로의 실습은 데이터 확인을 위해 get을 주로 사용할게요 -->
	
	<form action="result.jsp" method="get">
		<div>
			<label>아이디 : <input name="userId"></label>
		</div>
		<div>
			<label>비밀번호 : <input name="pwd" type="password"></label>
		</div>
		<div>
			<input type="submit" value="로그인">
		</div>
	</form>
</body>
</html>




