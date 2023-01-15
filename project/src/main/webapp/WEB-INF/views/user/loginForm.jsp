<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
</head>
<body>
<div class="page-breadcrumb">
	<h1>로그인</h1>
</div>
<div class="container-fluid" style="display: flex; justify-content: center;">
	<div style="flex-direction: column;">
		<form action="<c:url value='/user/login.do'/>">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userid" id="userid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd" id="pwd"></td>
			</tr>
			<tr>
				<td><input type="button" id="loginButton" value="로그인"></td>
				<td><input type="reset" value="초기화"></td>
			</tr>
		</table>
		</form>
		<div>
			<a href="<c:url value='/user/registerForm.do'/>">회원가입</a>|
			<a href="<c:url value='/user/findIdForm.do'/>">아이디 찾기</a>|
			<a href="<c:url value='/user/findPwForm.do'/>">비밀번호 찾기</a>
		</div>
	</div>
</div>
<script type="text/javascript">
let loginButton = document.getElementById("loginButton");

loginButton.addEventListener("click", (e) => {
  	e.preventDefault();
  	login();
});

function login() {
	fetch("<c:url value='/user/login.do'/>", {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json;charset=utf-8'
		},
		body: JSON.stringify({
			userid: userid.value,
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