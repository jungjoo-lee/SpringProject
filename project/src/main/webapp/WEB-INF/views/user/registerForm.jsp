<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 가입</title>
</head>
<body>
<h1>회원가입</h1>
<form>
아이디 <input type="text" name="userid" id="userid"> <input type="button" value="중복확인"><br/>
비밀번호 <input type="password" name="pwd" id="pwd"><br/>
이름 <input type="text" name="name1" id="name1"><br/>
성별 <input type="radio" name="sex" value="남">남 <input type="radio" name="sex" value="여">여<br/>
연락처 <input type="text" id="num1">-<input type="text" id="num2">-<input type="text" id="num3"><br/>
주소 <input type="text" name="address" id="address"><br/>
<input type="button" id="regiButton" value="회원가입">
<input type="reset" value="초기화">
</form>

<script type="text/javascript">
let regiButton = document.getElementById("regiButton");

regiButton.addEventListener("click", (e) => {
  	e.preventDefault();
  	register();
});

function register() {
	let sexValue = document.querySelector('input[name="sex"]:checked').value;
	
	fetch("<c:url value='/user/register.do'/>", {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json;charset=utf-8'
		},
		body: JSON.stringify({
			userid: userid.value,
			pwd: pwd.value,
			name: name1.value,
			sex: sexValue,
			phone: num1.value + "-" + num2.value + "-" + num3.value,
			address: address.value
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