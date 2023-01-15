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
<div class="page-breadcrumb">
	<h1>주문 정보</h1>
</div>
<div class="container-fluid">
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
		<td>${vo.count}개</td>
		<td><fmt:formatNumber value="${(vo.price - vo.price * (userVO.discount / 100)) * vo.count + vo.delivery_price}" type="number"/>원</td>
	</tr>
	</c:forEach>
	</tbody>
</table>
<div style="margin: 50px;"></div>

주문자 정보
<table>
	<tr>
		<td>주문자 이름</td>
		<td colspan="2">${userVO.name}</td>
	</tr>
	<tr>
		<td>주문자 연락처</td>
		<td colspan="2" style="display: flex; align-items: center;"><input type="text" class="form-control" style="width: 80px" value="${num1}" readonly>-
					<input type="text" class="form-control" style="width: 80px" value="${num2}" readonly>-
					<input type="text" class="form-control" style="width: 80px" value="${num3}" readonly></td>
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
</table>
<div style="margin: 50px;"></div>

배송지 정보
<form>
<table>
	<tr>
		<td colspan="3">
			<div class="custom-control custom-radio" style="display: inline-block;"><input type="radio" class="custom-control-input" id="sameAddress" name="Address" value="1" checked><label class="custom-control-label" for="sameAddress">주문자와 동일</label></div>
			<div class="custom-control custom-radio" style="display: inline-block;"><input type="radio" class="custom-control-input" id="newAddress" name="Address" value="2"><label class="custom-control-label" for="newAddress">새로운 주소</label></div>
			<div class="custom-control custom-radio" style="display: inline-block;"><input type="radio" class="custom-control-input" id="otherAddress" name="Address" value="3"><label class="custom-control-label" for="otherAddress">주소록</label>
				<select id="selectAddress" disabled>
					<option>선택</option>
					<option value="1">교육장</option>
					<option value="2">여친집</option>
				</select>
			</div>
		</td>
	</tr>
	<tr>
		<td>수령인 이름</td>
		<td colspan="2"><input type="text" id="name1"></td>
	</tr>
	<tr>
		<td>수령인 연락처</td>
		<td><select id="num1" class="custom-select form-control bg-white custom-radius custom-shadow border-0">
			<option selected>선택</option>
			<option value="010">010</option>
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
		<td>수령인 주소</td>
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
</table>
<div style="margin: 50px;"></div>

결제 정보
<table style="margin-bottom: 50px;">
	<tr>
		<td><div class="custom-control custom-radio" style="display: inline-block;"><input type="radio" class="custom-control-input" id="cardPayment" name="payment" value="카드" checked><label class="custom-control-label" for="cardPayment">카드</label></div></td>
		<td><div class="custom-control custom-radio" style="display: inline-block;"><input type="radio" class="custom-control-input" id="nobankPayment" name="payment" value="무통장"><label class="custom-control-label" for="nobankPayment">무통장</label></div></td>
	</tr>
	<tr id="paymentInfo">
		<td>카드사</td>
		<td><input type="text" id=cardName></td>
		<td>카드 번호</td>
		<td><input type="text" id="cardNum"></td>
	</tr>
</table>
<input type="button" id="orderButton" value="주문하기">
<input type="reset" value="초기화">
</form>
</div>
<script type="text/javascript">
let paymentInfo = document.getElementById("paymentInfo");
let cardPayment = document.getElementById("cardPayment");
cardPayment.addEventListener("click", () => {
	var content = '';
	content += '<tr>';
	content += '<td>카드사</td>';
	content += '<td><input type="text" id="cardName"></td>';
	content += '</tr>';
	content += '<tr>';
	content += '<td>카드 번호</td>';
	content += '<td><input type="text" id="cardNum"></td>';
	content += '</tr>';
	document.querySelector("#paymentInfo").innerHTML = content;
});

let nobankPayment = document.getElementById("nobankPayment");
nobankPayment.addEventListener("click", () => {
	var content = '';
	content += '<tr>';
	content += '<td>입금자명</td>';
	content += '<td><input type="text" id="cardName"></td>';
	content += '</tr>';
	content += '<tr>';
	content += '<td>입금 은행</td>';
	content += '<td><input type="text" id="cardNum"></td>';
	content += '</tr>';
	document.querySelector("#paymentInfo").innerHTML = content;
});

window.onload = () => {
	selectAddress.disabled = true;
	name1.value = '${userVO.name}';
	num1.value = '${num1}';
	num2.value = '${num2}';
	num3.value = '${num3}';
	postcode.value = '${userVO.postcode}';
	address.value = '${userVO.address}';
	detailaddress.value = '${userVO.detailaddress}';
}

let selectAddress = document.getElementById("selectAddress");
let sameAddress = document.getElementById("sameAddress");
sameAddress.addEventListener("click", () => {
	selectAddress.disabled = true;
	name1.value = '${userVO.name}';
	num1.value = '${num1}';
	num2.value = '${num2}';
	num3.value = '${num3}';
	postcode.value = '${userVO.postcode}';
	address.value = '${userVO.address}';
	detailaddress.value = '${userVO.detailaddress}';	
});

let newAddress = document.getElementById("newAddress");
newAddress.addEventListener("click", () => {
	selectAddress.disabled = true;
});

let otherAddress = document.getElementById("otherAddress");
otherAddress.addEventListener("click", () => {
	selectAddress.disabled = false;
});

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

function order() {
	let payment = document.querySelector('input[name="payment"]:checked').value;
	
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
			orderList: arrOrder,
			payment: payment,
			cardName: cardName.value,
			cardNum: cardNum.value
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