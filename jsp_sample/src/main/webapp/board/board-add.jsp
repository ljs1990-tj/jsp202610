<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="form" action="board-add-result.jsp">
		<div>
			제목 : <input name="title">
		</div>
		<div>
			종류 : <select name="kind">
					<option value="1">공지사항</option>
					<option value="2">자유게시판</option>
					<option value="3">질문게시판</option>
				 </select>
		</div>
		<div>
			내용 : <textarea name="contents" cols="20" rows="5"></textarea>
		</div>
		<div>
			<input type="button" value="글쓰기" onclick="fnAdd()">
		</div>
	</form>

</body>
</html>
<script>
	function fnAdd(){
		let form = document.form;
		if(form.title.value.length < 1){
			alert("제목을 입력해주세요.");
			return;
		}
		if(form.contents.value.length < 1){
			alert("내용을 입력해주세요.");
			return;
		}
		form.submit();
	}
</script>




