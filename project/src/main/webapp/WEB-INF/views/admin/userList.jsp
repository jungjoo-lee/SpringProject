<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 페이지</title>
<style type="text/css">
th, td {
	text-align: center;
}
</style>
</head>
<body>
<div class="page-breadcrumb">
	<h3 class="page-title text-truncate text-dark font-weight-medium">회원 목록</h3>
</div>
<div>
	<div style="display: flex; justify-content: center; margin: 10px; padding: 15px;">
		<form>
			<select class="form-select" name="searchType" id="searchType" aria-label="Default select example" onchange="search_change()">
				<option <c:if test="${searchType eq 'titleContents'}">selected</c:if> value="titleContents">제목 + 내용</option>
				<option <c:if test="${searchType eq 'title'}">selected</c:if> value="title">제목</option>
				<option <c:if test="${searchType eq 'content'}">selected</c:if> value="content">내용</option>
				<option <c:if test="${searchType eq 'writer'}">selected</c:if> value="writer">글쓴이</option>
			</select>
            <div class="customize-input">
            	<input class="form-control custom-shadow custom-radius border-0 bg-white" type="search" placeholder="Search" aria-label="Search">
            	<i class="form-control-icon" data-feather="search"></i>
			</div>
			<button class="btn btn-outline-success" type="submit" style="display: flex; flex-direction: row; margin-left: 1rem"><i class="bi bi-search"></i>Search</button>
		</form>
	</div>
	<div style="float: right;">
		<select class="form-select" name="amountCount" id="amountCount" aria-label="Default select example" onchange="amount_change()">
			<option <c:if test="${amount eq 10}">selected </c:if> value="10">10개씩보기</option>
			<option <c:if test="${amount eq 30}">selected </c:if> value="30">30개씩보기</option>
			<option <c:if test="${amount eq 50}">selected </c:if> value="50">50개씩보기</option>
		</select>
	</div>
</div>
<div class="container-fluid" style="justify-content: center; flex-direction: column;">
	<div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">아이디</th>
					<th scope="col">이름</th>
					<th scope="col">성별</th>
					<th scope="col">연락처</th>
					<th scope="col">주소</th>
					<th scope="col">로그인 시간</th>
					<th scope="col">로그인 가능 여부</th>
					<th scope="col">전체선택(<input type="checkbox">)</th>
				</tr>
			</thead>
			<tbody id="list">
				<c:forEach var="userVO" items="${list}">
				<tr>
					<td>${userVO.userid}</td>
					<td>${userVO.name}</td>
					<td>${userVO.sex}</td>
					<td>${userVO.phone}</td>
					<td>${userVO.address}</td>
					<td>${userVO.loginDateTime}</td>
					<td>${userVO.loginCheck}</td>
					<td><input type="checkbox"></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div style="display: flex; justify-content: center; margin: 10px; padding: 15px;">
		<nav aria-label="Page navigation example">
			<ul class="pagination" id="pagination">
				<c:if test="${ pageVO.prev }">
					<li class="page-item"><a class="page-link" id="Prev" href="javascript:list(${num-1})">Prev</a></li>
				</c:if>
				<c:forEach var="num" begin="${ pageVO.startPage }" end="${ pageVO.endPage }">
					<li class="page-item">
						<a class="page-link" id="${num}" href="javascript:list(${num})">${ num }</a>
					</li>
				</c:forEach>
				<c:if test="${ pageVO.next }">
					<li class="page-item"><a class="page-link" id="Next" href="javascript:list(${num+1})">Next</a></li>
				</c:if>
			</ul>
		</nav>
	</div>
</div>

<%-- <script type="text/javascript" src="<c:url value='/resources/js/admin/memberList.js'/>"></script> --%>
<script type="text/javascript">
function list(num) {
	fetch("<c:url value='/admin/userPage.do' />", {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json;charset=utf-8'
		},
		body: JSON.stringify({
			num: num
		})
	})
	.then(response => response.json())
	.then(jsonResult => {
		if (jsonResult.status == true) {
			console.log(jsonResult.listUsers);
			let listUsers = jsonResult.listUsers;
			let content = '';
			let i = 0;

			listUsers.forEach(() => {
				content += '<tr>';
				content += '<td>' + listUsers[i].userid + '</td>';
				content += '<td>' + listUsers[i].name + '</td>';
				content += '<td>' + listUsers[i].sex + '</td>';
				content += '<td>' + listUsers[i].phone + '</td>';
				content += '<td>' + listUsers[i].address + '</td>';
				if (listUsers[i].loginDateTime != null) {
					content += '<td>' + listUsers[i].loginDateTime + '</td>';
				} else {
					content += '<td></td>';
				}
				content += '<td>' + listUsers[i++].loginCheck + '</td>';
				content += '<td><input type="checkbox"></td>';
				content += '</tr>';
			});
			document.querySelector("#list").innerHTML = content;

			let pageVO = jsonResult.pageVO;
			let pagecontent = '';

			if (pageVO.prev) {
				pagecontent += '<li class="page-item"><a class="page-link" id="Prev" href="javascript:list(' + ((jsonResult.pageVO.startPage) - 1) + ')">Prev</a></li>';
			}

			if ((jsonResult.pageVO.endPage % 10) == 0) {
				for (let j = 0; j < 10; j++) {
					pagecontent += '<li class="page-item">';
					pagecontent += '<a class="page-link" id="' + (jsonResult.startPage + j) + '" href="javascript:list(' + (jsonResult.pageVO.startPage + j) + ')">' + (jsonResult.pageVO.startPage + j) + '</a>';
					pagecontent += '</li>';
				}
			} else {
				for (let j = 0; j < (jsonResult.pageVO.endPage % 10); j++) {
					pagecontent += '<li class="page-item">';
					pagecontent += '<a class="page-link" id="' + (jsonResult.startPage + j) + '" href="javascript:list(' + (jsonResult.pageVO.startPage + j) + ')">' + (jsonResult.pageVO.startPage + j) + '</a>';
					pagecontent += '</li>';
				}
			}

			if (pageVO.next) {
				pagecontent += '<li class="page-item"><a class="page-link" id="Next" href="javascript:list(' + (jsonResult.pageVO.endPage / 10) + 1 + ')">Next</a></li>';
			}
			document.querySelector("#pagination").innerHTML = pagecontent;

		} else {
			alert(jsonResult.message);
		}
	});
}
</script>
</body>
</html>