<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 정보</title>
</head>
<body>
<img alt="책 표지" src="<c:url value='/goods/goodsImage.do/${vo.real_cover}/2'/>"><br/>
책 번호 : ${vo.goods_id}<br/>
분류 : ${vo.status_name}<br/>
<h1>책 제목 : ${vo.book_title}</h1><br/>
가격 : ${vo.price}<br/>
포인트 : ${vo.point}<br/>
저자 : ${vo.author}<br/>
출판사 : ${vo.publisher}<br/>
출판일자 : ${vo.release_date}<br/>
<img alt="책 내용" src="<c:url value='/goods/goodsImage.do/${vo.real_content_image}/3'/>"><br/>
목차 : ${vo.book_index}<br/>
책소개 : ${vo.introduce}<br/>
출판사 서평 : ${vo.publisher_content}<br/>
쪽수 : ${vo.page_number}<br/>
책 사이즈 : ${vo.book_size}<br/>
</body>
</html>