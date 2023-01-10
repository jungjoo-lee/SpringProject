<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 등록</title>
<style type="text/css">
.ck-content {
	height: 100vh;
}
</style>
<script src="https://cdn.ckeditor.com/ckeditor5/35.3.2/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/35.3.2/classic/translations/ko.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
</head>
<body>
<div class="page-breadcrumb">
	<h4 class="card-title mb-3">상품 등록</h4>
</div>
<div class="card-body">
	<form action="<c:url value='/admin/goodsRegister.do'/>" name="uploadForm" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
		<table class="table table-bordered">
			<tr><td>책 제목</td><td><input type="text" id="title" name="title" placeholder="책 제목"></td>
			<td>출판사</td><td><input type="text" id="publisher" name="publisher" placeholder="출판사"></td></tr>
			<tr><td>저자</td><td><input type="text" id="author" name="author" placeholder="저자"></td><td>가격</td>
			<td><input type="text" id="price" name="price" placeholder="가격"></td></tr>
			<tr><td>분류</td><td><select name="status_id">
				<option value="1">베스트셀러</option>
				<option value="2">스테디셀러</option>
				<option value="3">신간도서</option>
				<option value="4" selected>판매중</option>
			</select></td><td>포인트</td><td><input type="text" id="point" name="point" readonly placeholder="포인트"></td></tr>
			<tr><td>출간일자</td><td><input type="text" id="release_date" name="release_date" placeholder="출간일자"></td>
			<td>페이지</td><td><input type="text" id="page_number" name="page_number" placeholder="페이지"></td></tr>
			<tr><td>책 사이즈</td><td><input type="text" id="book_size" name="book_size" placeholder="책 사이즈"></td>
			<td>책사진</td><td><input type="file" id="mage" name="image"></td></tr>
			<tr><td>내용사진</td><td><input type="file" id="content_image" name="content_image"></td>
			<td>첨부파일</td><td><input type="file" id="files" name="files" multiple></td></tr>
		</table>
		
		<ul class="nav nav-tabs mb-3">
			<li class="nav-item">
				<a href="#b_i" data-toggle="tab" aria-expanded="false" class="nav-link active">
				<i class="mdi mdi-home-variant d-lg-none d-block mr-1"></i>
				<span class="d-none d-lg-block">목차</span></a>
			</li>
			<li class="nav-item">
				<a href="#intro" data-toggle="tab" aria-expanded="true" class="nav-link">
				<i class="mdi mdi-account-circle d-lg-none d-block mr-1"></i>
				<span class="d-none d-lg-block">책 소개</span></a>
			</li>
			<li class="nav-item">
				<a href="#p_c" data-toggle="tab" aria-expanded="false" class="nav-link">
				<i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
				<span class="d-none d-lg-block">출판사 서평</span></a>
			</li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="b_i">
            	<div class="form-group">
                	<textarea id="book_index" name="book_index"></textarea>
            	</div>
			</div>
			<div class="tab-pane" id="intro">
            	<div class="form-group">
                	<textarea id="introduce" name="introduce"></textarea>
            	</div>
			</div>
            <div class="tab-pane" id="p_c">
				<div class="form-group">
                	<textarea id="publisher_content" name="publisher_content"></textarea>
                </div>
			</div>
		</div>
		<div>
			<input type="submit" id="regiButton" value="등록하기">
			<input type="reset" value="초기화">
			<input type="button" id="backButton" value="뒤로가기">
		</div>
	</form>
</div>

<script type="text/javascript">
ClassicEditor
.create(document.querySelector('#book_index'), {language : "ko"})
.catch(error => {
	console.error(error);
});

ClassicEditor
.create(document.querySelector('#introduce'), {language : "ko"})
.catch(error => {
	console.error(error) ;
});

ClassicEditor
.create(document.querySelector("#publisher_content"), {language : "ko"})
.catch(error => {
	console.error(error);
});

let inputPrice = document.querySelector("#price");
let resultPoint = document.querySelector("#point");

inputPrice.addEventListener("keyup", () => {
	if (inputPrice.value == '') {
		resultPoint.value = '';
	} else {
		resultPoint.value = Math.floor(inputPrice.value * 0.05);
	}
});

let regiButton = document.getElementById("regiButton");
regiButton.addEventListener("submit", (e) => {
  	e.preventDefault();
  	register();
});

function register() {
	fetch("<c:url value='/admin/goodsRegister.do'/>", {
		method: 'POST',
		cache: 'no-cache',
		body: new FormData(uploadForm)
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