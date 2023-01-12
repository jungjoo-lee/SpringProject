<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="totalcount" value="0" />
<c:set var="totalprice" value="0"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>장바구니</title>
<style type="text/css">
th, td {
	text-align: center;
	vertical-align: inherit !important;
}

.smallInput {
	width: 35px;
}

.count {
	display: inline;
}
</style>
</head>
<body>
<div class="page-breadcrumb">
	<h3 class="page-title text-truncate text-dark font-weight-medium">장바구니</h3>
</div>
<div class="container-fluid" style="justify-content: center; flex-direction: column;">
<table class="table table-hover" id="cartTable">
	<thead>
		<tr>
			<th>선택<input type="checkbox"></th>
			<th>번호</th>
			<th colspan="2">상품 정보</th>
			<th>수량</th>
			<th>가격</th>
			<th>담은 시간</th>
			<th>비고</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${list}">
		<tr id="${vo.cart_no}">
			<td><input type="checkbox" value="${vo.goods_id}"></td>
			<td>${vo.cart_no}</td>
			<td><a href="#"><img alt="썸네일" src="<c:url value='/goods/goodsImage.do/${vo.real_thumbnail}.png/1'/>"></a></td>
			<td><a href="#">${vo.book_title}</a></td>
			<td><div class="count">${vo.count}</div>개<input type='button' name="plus" value='+'/><input type='button' name="minus" value='-'/></td>
			<td><fmt:formatNumber value="${vo.price}" type="number"/>*<fmt:formatNumber value="${vo.count}" type="number"/><br/>
				<fmt:formatNumber value="${vo.price * vo.count}" type="number"/>원</td>
			<td>${vo.regi_date}</td>
			<td>
				<!-- 체크 리스트 넘기기 -->
				<input type="button" id="orderButton" value="주문하기"><br/>
				<input type="button" class="btn_delete" id="deleteButton" value="삭제">
			</td>
		</tr>
		<c:set var="totalcount" value="${totalcount = totalcount + vo.count}"/>
		<c:set var="totalprice" value="${totalprice = totalprice + vo.price * vo.count}"/>
		</c:forEach>
	</tbody>
</table>
총 개수 : <fmt:formatNumber value="${totalcount}" type="number"/>개<br/>
총 가격 : <fmt:formatNumber value="${totalprice}" type="number"/>원
</div>
<script type="text/javascript">
var eventPlus = document.getElementsByName("plus");
for (var i = 0; i < eventPlus.length; i++){
	eventTarget[i].addEventListener('click', count('plus') => {
		
	}
}

var eventMinus = document.getElementsByName("minus");
for (var i = 0; i < eventMinus.length; i++){
	eventTarget[i].addEventListener('click', count('minus') {
		
	}
}

var eventTarget = document.getElementsByClassName('btn_delete')
for (var i = 0; i < eventTarget.length; i++) {
	eventTarget[i].addEventListener('click', function() {
		var parent = document.querySelector('#cartTable tbody');
		parent.removeChild(this.parentElement.parentElement);
		i--;
		
		let cart_no = this.parentElement.parentElement.id;
		
		if (confirm("삭제 하시겠습니까?")) {
			fetch("<c:url value='/cart/deleteCart.do'/>", {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json;charset=utf-8'
				},
				body: JSON.stringify({
					cart_no: cart_no
				})
			})
			.then(response => response.json())
			.then(jsonResult => {
				if (jsonResult.status == true) {
					alert(jsonResult.message);
				} else {
					alert(jsonResult.message);
				}
			});
		} else {
			return;
		}
	})
}

function count(type)  {
	let number = resultElement.innerText;

	if(type === 'plus') {
		number = parseInt(number) + 1;
	} else if(type === 'minus')  {
		number = parseInt(number) - 1;
	}
	
	resultElement.innerText = number;
}
</script>
</body>
</html>