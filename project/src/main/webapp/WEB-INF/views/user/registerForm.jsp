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
<h1>회원가입</h1>
<form>
아이디 <input type="text" class="form-control" name="userid" id="userid"> <input type="button" value="중복확인"><br/>
비밀번호 <input type="password" class="form-control" name="pwd" id="pwd"><br/>
비밀번호 확인<input type="password" class="form-control" name="pwd1" id="pwd1"><br/>
이름 <input type="text" class="form-control" name="name1" id="name1"><br/>
성별 <div class="custom-control custom-radio"><input type="radio" class="custom-control-input" id="man" name="sex" value="남"><label class="custom-control-label" for="man">남</label></div>
<div class="custom-control custom-radio"><input type="radio" class="custom-control-input" id="women" name="sex" value="여"><label class="custom-control-label" for="women">여</label></div><br/>
연락처
<select id="num1">
	<option selected value="010">010</option>
	<option value="011">011</option>
	<option value="016">016</option>
	<option value="017">017</option>
	<option value="018">018</option>
	<option value="019">019</option>
</select>-
<input type="text" class="form-control" id="num2" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" maxlength='4'>-
<input type="text" class="form-control" id="num3" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" maxlength='4'><br/>
생년월일 <input type="date"><br/>
이메일 <input type="text" class="form-control" name="email1" placeholder="Email">
<input type="text" class="form-control" name="email2" id="email2" placeholder="직접입력">
<select name="email" id="email" title="직접입력">
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
</select><br/>
<!-- 고치기 -->
주소 <input type="text" name="address" id="address"><br/>
<input id="member_post"  type="text" placeholder="우편 번호" readonly"><input type="button" id="findAddress" value="검색"> <br/>
주소 <input id="member_addr" type="text" class="form-control" placeholder="주소" readonly><br/>
나머지 <input type="text" class="form-control" placeholder="상세주소"><br/>
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

let findAddress = document.getElementById("findAddress");

findAddress.addEventListener("click", (e) => {
  	e.preventDefault();
  	findAddr();
});

function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("member_addr").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("member_addr").value = jibunAddr;
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
</script>
</body>
</html>