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
<form>
아이디 <input type="text" id="userid"><br/>
이름 <input type="text" id="name1"><br/>
전화번호 <input type="text" id="phone"><br/>
<input type="button" id="findPwButton" value="비밀번호 초기화">
<input type="reset" value="초기화">
</form>

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
			phone: phone.value
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