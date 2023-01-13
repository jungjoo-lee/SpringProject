<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문 페이지</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
주문 정보
<table class="table table-hover">
	<thead>
		<tr>
			<th colspan="2">상품 정보</th>
			<th>수량</th>
			<th>가격</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="vo" items="${list}">
	<tr>
		<td><a href="#"><img alt="썸네일" src="<c:url value='/goods/goodsImage.do/${vo.real_thumbnail}.png/1'/>"></a></td>
		<td><input type="hidden" value="${vo.cart_no}"><a href="#">${vo.book_title}</a></td>
		<td><div class="count">${vo.count}</div>개<input type='button' name="plus" value='+'/><input type='button' name="minus" value='-'/></td>
		<td><fmt:formatNumber value="${vo.price}" type="number"/>*<fmt:formatNumber value="${vo.count}" type="number"/><br/>
		<fmt:formatNumber value="${vo.price * vo.count}" type="number"/>원</td>
	</tr>
	</c:forEach>
	</tbody>
</table>

주문자 정보
<table>
	<tr>
		<td>주문자 이름</td>
		<td colspan="2">${userVO.name}</td>
	</tr>
	<tr>
		<td>주문자 연락처</td>
		<td colspan="2"><input type="text" class="form-control" value="${num1}" readonly>
					-<input type="text" class="form-control" value="${num2}" readonly>
					-<input type="text" class="form-control" value="${num3}" readonly></td>
	</tr>
	<tr>
		<td>주문자 주소</td>
	</tr>
	<tr>
		<td>우편번호</td>
		<td colspan="2"><input type="text" class="form-control" value="${userVO.postcode}" readonly></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><input type="text" class="form-control" value="${userVO.address}" readonly></td>
		<td><input type="text" class="form-control" value="${userVO.detailaddress}" readonly></td>
	</tr>
</table><br/><br/><br/><br/>

배송지 정보
<form>
<table>
	<tr>
		<td colspan="3">
			<div class="custom-control custom-radio"><input type="radio" class="custom-control-input" value="1"><label class="custom-control-label">주문자와 동일</label></div>
			<div class="custom-control custom-radio"><input type="radio" class="custom-control-input" value="2"><label class="custom-control-label">새로운 주소</label></div>
			<div class="custom-control custom-radio"><input type="radio" class="custom-control-input" value="3"></div>
			<div class="custom-control custom-radio"><label class="custom-control-label">
			<select>
				<option>본가</option>
				<option>여친집</option>
			</select></label></div>
		</td>
	</tr>
	<tr>
		<td>수령인 이름</td>
		<td colspan="2"><input type="text" id="name1"></td>
	</tr>
	<tr>
		<td>수령인 연락처</td>
		<td colspan="2">
				<select id="num1">
					<option selected value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>
					-<input type="text" id="num2" class="form-control">
					-<input type="text" id="num3" class="form-control"></td>
	</tr>
	<tr>
		<td>수령인 주소</td>
	</tr>
	<tr>
		<td>우편번호</td>
		<td colspan="2"><input type="text" id="postcode" class="form-control"><input type="button" id="findAddress" value="검색"></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><input type="text" id="address" class="form-control"></td>
		<td><input type="text" id="detailaddress" class="form-control"></td>
	</tr>
</table><br/><br/><br/><br/>

결제 정보

<br/><br/><br/><br/>
<input type="button" id="orderButton" value="주문하기">
<input type="reset" value="초기화">
</form>

<script type="text/javascript">
let orderList = document.querySelectorAll("input[type='hidden']");
let arrOrder = [];
var i = 0;
orderList.forEach(() => {
	arrOrder.push(orderList[i++].value);
});

let orderButton = document.getElementById("orderButton");

orderButton.addEventListener("click", (e) => {
  	e.preventDefault();
  	order(arrOrder);
});
/* '/order/orderRegister.do' */

function order() {
	console.log(arrOrder);
	
	fetch("<c:url value='/order/orderRegister.do'/>", {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json;charset=utf-8'
		},
		body: JSON.stringify({
			name: name1.value,
			phone: num1.value + "-" + num2.value + "-" + num3.value,
			postcode: postcode.value,
			address: address.value,
			detailaddress: detailaddress.value,
			orderList: arrOrder
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
            
            if (roadAddr !== '') {
                document.getElementById("address").value = roadAddr;
            } 
            else if (jibunAddr !== '') {
                document.getElementById("detailaddress").value = jibunAddr;
            }
        }
    }).open();
}
</script>
</body>
</html>