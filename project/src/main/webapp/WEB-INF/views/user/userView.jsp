<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상세보기</title>
</head>
<body>
<div class="page-breadcrumb">
	<h1>상세보기</h1>
</div>
<div class="container-fluid">
아이디 : ${userVO.userid}<br/>
비밀번호 : ${userVO.pwd}<br/>
이름 : ${userVO.name}<br/>
성별 : ${userVO.sex}<br/>
생일 : ${userVO.birthday}<br/>
연락처 : ${userVO.phone}<br/>
이메일 : ${userVO.email}<br/>
우편번호 : ${userVO.postcode}<br/>
주소 : ${userVO.address}<br/>
상세주소 : ${userVO.detailaddress}<br/>
등급 : ${userVO.grade}<br/>
포인트 : ${userVO.point}<br/>
로그인 시간 : ${userVO.login_Date}<br/>
가입일자 : ${userVO.regi_Date}<br/>
로그인 가능 여부 : ${userVO.login_Check}<br/>
관리자 : ${userVO.admin_check}<br/>
<div id="deleteInfo" style="display: none;">
	<form>
		<input type="password" id="pwd"><input type="button" id="deleteButton" value="탈퇴하기">
	</form>
</div>
<a href="<c:url value='/user/updateForm.do'/>" class="btn btn-sm btn-info">정보 수정</a>
<a href="javascript:userDelete()" id="deleteInfoButton" class="btn btn-sm btn-info">회원 탈퇴</a>
</div>
<script type="text/javascript">
/* window.onload = () => {
	document.getElementById('deleteInfo').style.display = "none";
}
 */
function userDelete() {
	 document.getElementById('deleteInfo').style.display = "block";
	 document.getElementById('deleteInfoButton').removeAttribute('href');
}

let deleteButton = document.getElementById("deleteButton");

deleteButton.addEventListener("click", (e) => {
  	e.preventDefault();
  	deleteUser();
});

function deleteUser() {	
	fetch("<c:url value='/user/userDelete.do'/>", {
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