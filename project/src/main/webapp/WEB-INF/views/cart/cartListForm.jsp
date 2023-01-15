<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="totalcount" value="0" />
<c:set var="totalprice" value="0"/>
<c:set var="cartlist" value="${list}"/>

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
			<th>선택<input type="checkbox" id="allCheck"></th>
			<th>번호</th>
			<th colspan="2">상품 정보</th>
			<th>수량</th>
			<th>가격</th>
			<th>배송비</th>
			<th>상품 총 가격</th>
			<th>담은 시간</th>
			<th>비고</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${list}">
		<tr id="${vo.cart_no}">
			<td><input type="checkbox" id="${vo.cart_no}" name="goods_id" value="${vo.goods_id}" <c:if test="${vo.select_check eq 'T'}">checked</c:if>></td>
			<td>${vo.cart_no}</td>
			<td><a href="<c:url value='/goods/goodsView.do/${vo.goods_id}'/>"><img alt="썸네일" src="<c:url value='/goods/goodsImage.do/${vo.real_thumbnail}.png/1'/>"></a></td>
			<td><a href="<c:url value='/goods/goodsView.do/${vo.goods_id}'/>">${vo.book_title}</a></td>
			<td><div class="count"><input style="width: 50px" type="text" name="listCount" value="${vo.count}" readonly></div>개<input type='button' id="plus" name="plus" value='+'/><input type='button' id="minus" name="minus" value='-'/></td>
			<td><input type="text" name="listprice" style="display: inline-block; width: 100px;" class="form-control" value="${vo.price - vo.price * (userVO.discount / 100)}" readonly>원</td>
			<td><input type="text" style="display: inline-block; width: 100px;" class="form-control" value="${vo.delivery_price}" readonly>원</td>
			<td><input type="text" style="display: inline-block; width: 100px;" class="form-control" value="${(vo.price - vo.price * (userVO.discount / 100)) * vo.count + vo.delivery_price}" readonly>원</td>
			<td>${vo.regi_date}</td>
			<td>
				<input type="button" id="btn_order" value="주문하기"><br/>
				<input type="button" class="btn_delete" id="deleteButton" value="삭제">
			</td>
		</tr>
		<c:set var="totalcount" value="${totalcount = totalcount + vo.count}"/>
		<c:set var="totalprice" value="${totalprice = totalprice + (vo.price - vo.price * (userVO.discount / 100)) * vo.count + vo.delivery_price}"/>
		</c:forEach>
	</tbody>
</table>
<div>
<table class="table" style="display: flex; justify-content: center;">
	<tr style="display: flex; align-items: center;">
		<td style="border-top: none;">총 개수 : </td>
		<td style="display: flex; align-items: center; border-top: none;"><input type="text" id="totalCount" class="form-control" value="${totalcount}" readonly>개</td>
		<td style="border-top: none;">총 가격 : </td>
		<td style="display: flex; align-items: center; border-top: none;"><input type="text" id="totalPrice" class="form-control" value="${totalprice}" readonly>원</td>
	</tr>
</table>
</div>
<a href="<c:url value='/order/orderForm.do'/>">주문하기</a>
<input type="button" id="deleteButton" value="삭제">
</div>
<script type="text/javascript">
let plus = document.getElementsByName('plus');
let minus = document.getElementsByName('minus');
let listCount = document.getElementsByName('listCount');
let listprice = document.getElementsByName('listprice');
let totalCount = document.getElementById('totalCount');
let totalPrice = document.getElementById('totalPrice');
let voTotal = document.getElementById('voTotal');

var i = 0;
plus.forEach(() => {
	plus[i++].addEventListener('click', function() {
		this.parentElement.firstChild.children[0].value++;
		
		fetch("<c:url value='/cart/updateCountCart.do'/>", {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json;charset=utf-8'
			},
			body: JSON.stringify({
				cart_no: this.parentElement.parentElement.id,
				count: this.parentElement.firstChild.children[0].value
			})
		})
		.then(response => response.json())
		.then(jsonResult => {
			if (jsonResult.status == false) {
				alert(jsonResult.message);
			} else {
				this.parentElement.parentElement.children[7].children[0].value = (parseInt(this.parentElement.parentElement.children[5].children[0].value) * parseInt(this.parentElement.firstChild.children[0].value)) + parseInt(this.parentElement.parentElement.children[6].children[0].value);
				totalCount.value++;
				totalPrice.value = parseInt(totalPrice.value) + parseInt(this.parentElement.parentElement.children[5].children[0].value);
			}
		});
	});
});

var i = 0;
minus.forEach(() => {
	minus[i++].addEventListener('click', function() {
		this.parentElement.firstChild.children[0].value--;
		
		fetch("<c:url value='/cart/updateCountCart.do'/>", {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json;charset=utf-8'
			},
			body: JSON.stringify({
				cart_no: this.parentElement.parentElement.id,
				count: this.parentElement.firstChild.children[0].value
			})
		})
		.then(response => response.json())
		.then(jsonResult => {
			if (jsonResult.status == false) {
				alert(jsonResult.message);
			} else {
				this.parentElement.parentElement.children[7].children[0].value = (parseInt(this.parentElement.parentElement.children[5].children[0].value) * parseInt(this.parentElement.firstChild.children[0].value)) + parseInt(this.parentElement.parentElement.children[6].children[0].value);
				totalCount.value--;
				totalPrice.value = parseInt(totalPrice.value) - parseInt(this.parentElement.parentElement.children[5].children[0].value);
			}
		});
	});
});

let allCheck = document.getElementById('allCheck');
let ck = document.getElementsByName('goods_id');

window.onload = () => {
	var check = 0;
	var j = 0;
	ck.forEach(() => {
		if (ck[j++].checked == true)
			check++;
	})
	if (ck.length == check) {
		allCheck.checked = true;
	}
	allCheck.addEventListener('click', function() {
        var i = 0;
        
        if (this.checked == true){
        	ck.forEach(() => {
        		ck[i++].checked = true;
        		fetch("<c:url value='/cart/updateCart.do'/>", {
    				method: 'POST',
    				headers: {
    					'Content-Type': 'application/json;charset=utf-8'
    				},
    				body: JSON.stringify({
    					cart_no: ck[i-1].id,
    					select_check: 'T'
    				})
    			})
    			.then(response => response.json())
    			.then(jsonResult => {
    				if (jsonResult.status == false) {
    					alert(jsonResult.message);
    				}
    			});
        	});
        } else {
        	ck.forEach(() => {
        		ck[i++].checked = false;
        		fetch("<c:url value='/cart/updateCart.do'/>", {
    				method: 'POST',
    				headers: {
    					'Content-Type': 'application/json;charset=utf-8'
    				},
    				body: JSON.stringify({
    					cart_no: ck[i-1].id,
    					select_check: 'F'
    				})
    			})
    			.then(response => response.json())
    			.then(jsonResult => {
    				if (jsonResult.status == false) {
    					alert(jsonResult.message);
    				}
    			});
        	});
        }
    });
};

var i = 0;
ck.forEach(() => {
	ck[i++].addEventListener('change', function() {
		if (this.checked == true) {
			fetch("<c:url value='/cart/updateCart.do'/>", {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json;charset=utf-8'
				},
				body: JSON.stringify({
					cart_no: this.id,
					select_check: 'T'
				})
			})
			.then(response => response.json())
			.then(jsonResult => {
				if (jsonResult.status == false) {
					alert(jsonResult.message);
				}
			});
		} else {
			fetch("<c:url value='/cart/updateCart.do'/>", {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json;charset=utf-8'
				},
				body: JSON.stringify({
					cart_no: this.id,
					select_check: 'F'
				})
			})
			.then(response => response.json())
			.then(jsonResult => {
				if (jsonResult.status == false) {
					alert(jsonResult.message);
				}
			});
		}
	})
});

var i = 0;
ck.forEach(() => {
	ck[i++].addEventListener('click', function() {
		if (this.checked == false) {
			allCheck.checked = false;
		} else {
			var j = 0;
			var check = 0;
			
			ck.forEach(() => {
				if (ck[j++].checked == true) {
					check++;
				}
			})
			if (ck.length == check) {
				allCheck.checked = true;
			}
		}
	})
});

let eventTarget = document.getElementsByClassName('btn_delete');
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
</script>
</body>
</html>