<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문 목록</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div class="page-breadcrumb">
	<h1>주문 정보</h1>
</div>
<div class="container-fluid">
<table class="table table-hover">
	<thead>
		<tr>
			<th colspan="2">상품 정보</th>
			<th>배송 상황</th>
			<th>수량</th>
			<th>가격</th>
			<th>결제 방식</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="vo" items="${list}">
	<tr>
		<td><a href="#"><img alt="썸네일" src="<c:url value='/goods/goodsImage.do/${vo.real_thumbnail}.png/1'/>"></a></td>
		<td><a href="#">${vo.book_title}</a></td>
		<td>${vo.status_name}</td>
		<td>${vo.count}개</td>
		<td><fmt:formatNumber value="${(vo.price - vo.price * (userVO.discount / 100)) * vo.count + vo.delivery_price}" type="number"/>원</td>
		<td>${vo.payment}</td>
	</tr>
	</c:forEach>
	</tbody>
</table>
</div>
</body>
</html>