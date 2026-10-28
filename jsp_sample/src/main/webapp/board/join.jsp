<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="join-result.jsp">
		<div>
			<label>아이디 : <input name="userId"></label>
		</div>
		<div>
			<label>비밀번호 : <input type="password" name="pwd"></label>
		</div>
		<div>
			<label>이름 : <input name="userName"></label>
		</div>
		<div>
			취미 : 
			<label><input type="checkbox" name="hobby" value="1">코딩</label>
			<label><input type="checkbox" name="hobby" value="2">영화감상</label>
			<label><input type="checkbox" name="hobby" value="3">운동</label>
			<label><input type="checkbox" name="hobby" value="4">게임</label>
			<label><input type="checkbox" name="hobby" value="5">유튜브감상</label>
		</div>
		<div>
			<input type="submit" value="가입">
		</div>
	</form>
</body>
</html>