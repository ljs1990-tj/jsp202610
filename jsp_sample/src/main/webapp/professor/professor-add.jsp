<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="form" action="professor-add-result.jsp">
		<div>
			교수번호 : <input name="profNo">
		</div>
		<div>
			교수이름 : <input name="profName">
		</div>
		<div>
			<input type="button" value="추가" onclick="fnAdd()">
		</div>
	</form>
</body>
</html>
<script>
	function fnAdd(){
		let form = document.form;
		if(form.profNo.value.length != 4){
			alert("교수번호는 4글자!");
			return;
		}
		
		form.submit();
		
	}
</script>




