<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
<div class="page-breadcrumb">
	<h3>회원 목록</h3>
</div>
<div class="container-fluid" style="display: flex; justify-content: center;">
	<table>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>연락처</th>
			<th>주소</th>
			<th>로그인 시간</th>
			<th>전체선택</th>
		</tr>
		<c:forEach var="userVO" items="${list}">
		<tr>
			<td>${userVO.userid}</td>
			<td>${userVO.name}</td>
			<td>${userVO.sex}</td>
			<td>${userVO.phone}</td>
			<td>${userVO.address}</td>
			<td>${userVO.loginDateTime}</td>
			<td>${userVO.loginCheck}</td>
		</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>