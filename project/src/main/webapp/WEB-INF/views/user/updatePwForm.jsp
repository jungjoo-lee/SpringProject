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
<div class="page-breadcrumb">
	<h1>비밀번호 변경</h1>
</div>
<div class="container-fluid">
<form>
인증번호 <input type="text" class="form-control" id="AuthNum" placeholder="인증번호"><input type="button" id="btn_authentic" value="인증">
새 비밀번호 <input type="password" name="pwd" id="pwd"><br/>
새 비밀번호 확인 <input type="password" name="pwd1" id="pwd1"><br/>
<div id="pwdSame"></div>
<input type="button" id="updatePwButton" value="비밀번호 변경">
<input type="reset" value="초기화">
</form>
</div>
<script type="text/javascript">
let pwd = document.getElementById("pwd");
let pwd1 = document.getElementById("pwd1");
let pwdSame = document.getElementById("pwdSame");
var pwdCheck = false;

pwd1.addEventListener("keyup", () => {
	if (pwd.value == pwd1.value) {
		var pwdmsg = "<font color='blue'>비밀번호가 일치합니다.</font>";  
		pwdSame.innerHTML = pwdmsg;
	    pwdCheck = true;
	} else {
		var pwdmsg = "<font color='red'>비밀번호가 불일치합니다.</font>";  
		pwdSame.innerHTML = pwdmsg;
	    pwdCheck = false;
	}
});

let updatePwButton = document.getElementById("updatePwButton");

updatePwButton.addEventListener("click", (e) => {
  	e.preventDefault();
  	if (pwdCheck) {
  		updatePw();
	}
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

let btn_authentic =  document.getElementById("btn_authentic");
btn_authentic.addEventListener("click", (e) => {
  	e.preventDefault();
  	authentic();
});

function authentic() {
	if (AuthNum.value != null && AuthNum.value != '') {
		fetch("<c:url value='/user/authentic.do'/>", {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json;charset=utf-8'
			},
			body: JSON.stringify({
				AuthNum: AuthNum.value,
				findpw: "1"
			})
		})
		.then(response => response.json())
		.then(jsonResult => {
			if (jsonResult.status == true) {
				alert(jsonResult.message);
			    btn_authentic.disabled = true;
				document.getElementById("AuthNum").readOnly = true;
			} else {
				alert(jsonResult.message);
			}
		});
	} else {
		alert('이메일에 있는 인증번호를 입력해주세요.');
	}
}
</script>
</body>
</html>