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
	<form action="">
		<table class="table table-bordered">
			<tr><td>책 제목</td><td><input type="text" placeholder="책 제목"></td><td>출판사</td><td><input type="text" placeholder="출판사"></td></tr>
			<tr><td>저자</td><td><input type="text" placeholder="저자"></td><td>가격</td><td><input type="text" placeholder="가격"></td></tr>
			<tr><td>분류</td><td><select>
			<option value="">베스트셀러</option>
			<option value="">스테디셀러</option>
			<option value="">신간도서</option>
			<option value="" selected>판매중</option>
			</select></td><td>포인트</td><td><input type="text" placeholder="포인트"></td></tr>
			<tr><td>출간일자</td><td><input type="text" placeholder="출간일자"></td><td>페이지</td><td><input type="text" placeholder="페이지"></td></tr>
			<tr><td>책 사이즈</td><td><input type="text" placeholder="책 사이즈"></td><td>책사진</td><td><input type="file"></td></tr>
			<tr><td>내용사진</td><td><input type="file"></td><td>첨부파일</td><td><input type="file" multiple></td></tr>
		</table>
		
		<ul class="nav nav-tabs mb-3">
			<li class="nav-item">
				<a href="#index" data-toggle="tab" aria-expanded="false" class="nav-link active">
				<i class="mdi mdi-home-variant d-lg-none d-block mr-1"></i>
				<span class="d-none d-lg-block">목차</span></a>
			</li>
			<li class="nav-item">
				<a href="#introduce" data-toggle="tab" aria-expanded="true" class="nav-link">
				<i class="mdi mdi-account-circle d-lg-none d-block mr-1"></i>
				<span class="d-none d-lg-block">책 소개</span></a>
			</li>
			<li class="nav-item">
				<a href="#publisher_content" data-toggle="tab" aria-expanded="false" class="nav-link">
				<i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
				<span class="d-none d-lg-block">출판사 서평</span></a>
			</li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="index">
            	<div class="form-group">
                	<textarea class="form-control" id="index_area"></textarea>
            	</div>
			</div>
			<div class="tab-pane" id="introduce">
            	<div class="form-group">
                	<textarea class="form-control" id="introduce_area"></textarea>
            	</div>
			</div>
            <div class="tab-pane" id="publisher_content">
				<div class="form-group">
                	<textarea class="form-control" id="publisher_content_area"></textarea>
                </div>
                
			</div>
		</div>
		<div>
			<input type="button" id="regiButton" value="등록하기">
			<input type="reset" value="초기화">
			<input type="button" id="backButton" value="뒤로가기">
		</div>
	</form>
	</div>

<%-- <script type="text/javascript" src="<c:url value='/resources/js/admin/memberList.js'/>"></script> --%>
<script type="text/javascript">
ClassicEditor
.create( document.querySelector("#index_area"), {language : "ko"} )
.catch( error => {
	console.error( error );
});

ClassicEditor
.create( document.querySelector("#introduce_area"), {language : "ko"} )
.catch( error => {
	console.error( error );
});

ClassicEditor
.create( document.querySelector("#publisher_content_area"), {language : "ko"} )
.catch( error => {
	console.error( error );
});

</script>
</body>
</html>