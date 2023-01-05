<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 변경</title>
</head>
<body>
<form>
새 비밀번호 <input type="password" name="pwd" id="pwd"><br/>
새 비밀번호 확인 <input type="password" name="pwd1" id="pwd1"><br/>
<input type="button" id="updatePwButton" value="비밀번호 변경">
<input type="reset" value="초기화">
</form>
<script type="text/javascript">
let updatePwButton = document.getElementById("updatePwButton");

updatePwButton.addEventListener("click", (e) => {
  	e.preventDefault();
  	updatePw();
});

function updatePw() {
	fetch("<c:url value='/user/updatePw.do'/>", {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json;charset=utf-8'
		},
		body: JSON.stringify({
			pwd: pwd.value
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