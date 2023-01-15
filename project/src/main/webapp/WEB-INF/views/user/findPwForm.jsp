<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기</title>
</head>
<body>
<div class="page-breadcrumb">
	<h1>비밀번호 찾기</h1>
</div>
<div class="container-fluid">
<form>
아이디 <input type="text" id="userid"><br/>
이름 <input type="text" id="name1"><br/>
이메일 <input type="text" id="email"><br/>
<input type="button" id="findPwButton" value="비밀번호 초기화">
<input type="reset" value="입력값 초기화">
</form>
</div>
<script type="text/javascript">
let findPwButton = document.getElementById("findPwButton");

findPwButton.addEventListener("click", (e) => {
  	e.preventDefault();
  	findPw();
});

function findPw() {
	fetch("<c:url value='/user/findPw.do'/>", {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json;charset=utf-8'
		},
		body: JSON.stringify({
			userid: userid.value,
			name: name1.value,
			email: email.value,
			findpw: "1"
		})
	})
	.then(response => response.json())
	.then(jsonResult => {
		if (jsonResult.status == true) {
			alert(jsonResult.message);
			location.href = jsonResult.url;
		} else {
			alert(jsonResult.message);
		}
	});
}
</script>
</body>
</html>