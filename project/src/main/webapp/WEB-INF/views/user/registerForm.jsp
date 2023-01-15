<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 가입</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div class="page-breadcrumb">
	<h1>회원가입</h1>
</div>
<div class="container-fluid">
	<form>
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" class="form-control" name="userid" id="userid"></td>
			<td><input type="button" id="btn_overlabID" value="중복확인"></td>
			<td><div id="div_overlab"></div></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td colspan="2"><input type="password" class="form-control" name="pwd" id="pwd"></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td colspan="2"><input type="password" class="form-control" name="pwd1" id="pwd1"></td>
			<td><div id="pwdSame"></div></td>
		</tr>
		<tr>
			<td>이름</td>
			<td colspan="2"><input type="text" class="form-control" name="name1" id="name1"></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><div class="custom-control custom-radio"><input type="radio" class="custom-control-input" id="man" name="sex" value="남"><label class="custom-control-label" for="man">남</label></div>
			<div class="custom-control custom-radio"><input type="radio" class="custom-control-input" id="women" name="sex" value="여"><label class="custom-control-label" for="women">여</label></div></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td><select id="num1" class="custom-select form-control bg-white custom-radius custom-shadow border-0">
				<option selected value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select></td>
			<td><input type="text" class="form-control" id="num2" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" maxlength='4'></td>
			<td><input type="text" class="form-control" id="num3" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" maxlength='4'></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="date" id="birthday"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" class="form-control" name="email1" id="email1" placeholder="Email"></td>
			<td><input type="text" class="form-control" name="email2" id="email2" placeholder="직접입력"></td>
			<td><select name="email" id="email" title="직접입력">
				<option value="non">직접입력</option>
				<option value="@hanmail.net">hanmail.net</option>
				<option value="@naver.com">naver.com</option>
				<option value="@yahoo.co.kr">yahoo.co.kr</option>
				<option value="@hotmail.com">hotmail.com</option>
				<option value="@paran.com">paran.com</option>
				<option value="@nate.com">nate.com</option>
				<option value="@google.com">google.com</option>
				<option value="@gmail.com">gmail.com</option>
				<option value="@empal.com">empal.com</option>
				<option value="@korea.com">korea.com</option>
				<option value="@freechal.com">freechal.com</option>
			</select><input type="button" id="send_auth" value="인증번호 발송"></td>
		</tr>
		<tr>
			<td>인증번호 입력</td>
			<td><input type="text" class="form-control" id="AuthNum" placeholder="인증번호" readonly></td>
			<td><input type="button" id="btn_authentic" value="인증" disabled></td>
			<td><div id="ViewTimer"></div></td>
		</tr>
		<tr>
			<td>우편 번호</td>
			<td><input id="postcode"  type="text" placeholder="우편 번호" readonly"></td>
			<td><input type="button" id="findAddress" value="검색"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td colspan="3"><input id="address" type="text" class="form-control" placeholder="주소" readonly></td>
		</tr>
		<tr>
			<td>나머지</td>
			<td colspan="2"><input type="text" id="detailaddress" class="form-control" placeholder="상세주소"></td>
		</tr>
		<tr>
			<td><input type="checkbox" id="agreeCheck">약관 동의</td>
		</tr>
	</table>
	<div>
		<input type="button" id="regiButton" value="회원가입">
		<input type="reset" value="초기화">
	</div>
	</form>
</div>
<script type="text/javascript">
let overlabCheck = false;
let pwdCheck = false;
let emailCheck = false;

let regiButton = document.getElementById("regiButton");
let agreeCheck = document.getElementById("agreeCheck");

regiButton.addEventListener("click", (e) => {
  	e.preventDefault();
  	
  	if (agreeCheck.checked == true) {
  		joinForm_check();
  		if (overlabCheck == true && pwdCheck == true && emailCheck == true) {
  			register();	
  		} else {
  			alert("중복확인, 비번, 이메일 인증이 완료 되지 않았습니다.");
  		}
  	} else {
  		alert("약관에 동의해 주세요");
  	}  	
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
			birthday : birthday.value,
			email: email1.value + email2.value,
			postcode : postcode.value,
			address: address.value,
			detailaddress : detailaddress.value
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

let findAddress = document.getElementById("findAddress");

findAddress.addEventListener("click", (e) => {
  	e.preventDefault();
  	findAddr();
});

function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress;
            var jibunAddr = data.jibunAddress;

            document.getElementById('postcode').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("address").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("detailaddress").value = jibunAddr;
            }
        }
    }).open();
}

let email = document.getElementById("email");

email.addEventListener("change", () => {
	emailChange();
});

function emailChange() {
	let email = document.getElementById("email");
	let email2 = document.getElementById("email2");
	
	if (email.value == 'non') {
		email2.value = '';
		email2.readOnly = false;
	} else {
		email2.value = email.value;
		email2.readOnly = true;
	}
}

let send_auth =  document.getElementById("send_auth");
send_auth.addEventListener("click", (e) => {
  	e.preventDefault();
  	send_email();
});

let btn_authentic =  document.getElementById("btn_authentic");
btn_authentic.addEventListener("click", (e) => {
  	e.preventDefault();
  	authentic();
});

let ViewTimer = document.getElementById("ViewTimer");
let overlabTimer = 0;
var TimerStart;
function send_email() {
	if ((email1.value != null && email1.value != '') && (email2.value != null && email2.value != '')) {
		fetch("<c:url value='/user/send_auth.do'/>", {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json;charset=utf-8'
			},
			body: JSON.stringify({
				email: email1.value + email2.value
			})
		})
		.then(response => response.json())
		.then(jsonResult => {
			if (jsonResult.status == true) {
				alert(jsonResult.message);
				btn_authentic.disabled = false;
				document.getElementById("AuthNum").readOnly = false;
				
				if (overlabTimer == 0) {
					overlabTimer++;
					var SetTime = 300;
					TimerStart = setInterval(function() {    
					    m = Math.floor(SetTime / 60) + "분 " + (SetTime % 60) + "초";    
					    var msg = "현재 남은 시간은 <font color='red'>" + m + "</font> 입니다.";  
					    ViewTimer.innerHTML = msg;
					    SetTime--;
					    if (SetTime < 0) {
					        clearInterval(TimerStart);
					    }
					}, 1000);
				} else {
					clearInterval(TimerStart);
					var SetTime = 300;
					TimerStart = setInterval(function() {    
					    m = Math.floor(SetTime / 60) + "분 " + (SetTime % 60) + "초";    
					    var msg = "현재 남은 시간은 <font color='red'>" + m + "</font> 입니다.";  
					    ViewTimer.innerHTML = msg;
					    SetTime--;
					    if (SetTime < 0) {
					        clearInterval(TimerStart);
					    }
					}, 1000);
				}
			} else {
				alert(jsonResult.message);
			}
		});
	} else {
		alert('이메일을 입력해주세요.');
	}
}

function authentic() {
	if (AuthNum.value != null && AuthNum.value != '') {
		fetch("<c:url value='/user/authentic.do'/>", {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json;charset=utf-8'
			},
			body: JSON.stringify({
				AuthNum: AuthNum.value
			})
		})
		.then(response => response.json())
		.then(jsonResult => {
			if (jsonResult.status == true) {
				clearInterval(TimerStart);
				var msg = "<font color='green'>인증되었습니다.</font>";  
			    ViewTimer.innerHTML = msg;
			    emailCheck = true;
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

let btn_overlabID = document.getElementById("btn_overlabID");
let div_overlab = document.getElementById("div_overlab");
let userid = document.getElementById("userid");

btn_overlabID.addEventListener("click", (e) => {
  	e.preventDefault();
  	overlabID();
});

async function overlabID() {
	if (userid.value != null && userid.value != '') {
		fetch("<c:url value='/user/overlabID.do'/>", {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json;charset=utf-8'
			},
			body: JSON.stringify({
				userid: userid.value
			})
		})
		.then(response => response.json())
		.then(jsonResult => {
			if (jsonResult.status == true) {
				alert(jsonResult.message);
				var idmsg = "<font color='blue'>사용 가능한 아이디입니다.</font>";  
				div_overlab.innerHTML = idmsg;
				overlabCheck = true;
				userid.classList.add('is-valid');
				userid.classList.remove('is-invalid');
			} else {
				alert(jsonResult.message);
				var idmsg = "<font color='red'>사용 불가능한 아이디입니다.</font>";  
				div_overlab.innerHTML = idmsg;
				overlabCheck = false;
				userid.classList.remove('is-valid');
				userid.classList.add('is-invalid');
			}
		});
	} else {
		alert("아이디를 입력해주세요.");
	}
}

let pwd = document.getElementById("pwd");
let pwd1 = document.getElementById("pwd1");
let pwdSame = document.getElementById("pwdSame");
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

function joinForm_check() {
	let pwd = document.getElementById("pwd");
	let name1 = document.getElementById("name1");
	let man = document.getElementById("man");
	let women = document.getElementById("women");
	let num2 = document.getElementById("num2");
	let num3 = document.getElementById("num3");
	let birthday = document.getElementById("birthday");
	let email1 = document.getElementById("email1");
	let email2 = document.getElementById("email2");
	let postcode = document.getElementById("postcode");
	let address = document.getElementById("address");
	let detailaddress = document.getElementById("detailaddress");

	if (userid.value == '') {
		alert("빈칸이 있어요");
		return;
	}
	
	if (pwd.value == '') {
		alert("빈칸이 있어요");
		return;
	}
	
	if (name1.value == '') {
		alert("빈칸이 있어요");
		return;
	}

	if (!man.checked && !women.checked) {
		alert("성별 체크");
		return;
	}
	
	if (num2.value == '') {
		alert("빈칸이 있어요");
		return;
	}
	
	if (num3.value == '') {
		alert("빈칸이 있어요");
		return;
	}
	
	if (birthday.value == '') {
		alert("달력");
		return;
	}
	
	if (email1.value == '') {
		alert("빈칸이 있어요");
		return;
	}
	
	if (email2.value == '') {
		alert("빈칸이 있어요");
		return;
	}
	
	if (postcode.value == '') {
		alert("빈칸이 있어요");
		return;
	}
	
	if (address.value == '') {
		alert("빈칸이 있어요");
		return;
	}
	
	if (detailaddress.value == '') {
		alert("빈칸이 있어요");
		return;
	}
}
</script>
</body>
</html>