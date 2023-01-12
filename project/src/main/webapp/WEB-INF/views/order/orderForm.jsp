<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문 페이지</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<form action="">

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
<input id="postcode"  type="text" placeholder="우편 번호" readonly"><input type="button" id="findAddress" value="검색"> <br/>
주소 <input id="address" type="text" class="form-control" placeholder="주소" readonly><br/>
나머지 <input type="text" id="detailaddress" class="form-control" placeholder="상세주소"><br/>

<input type="button" id="orderButton" value="주문하기">
<input type="reset" value="초기화">
</form>
</body>
</html>