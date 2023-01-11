<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 목록</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="row">
				<c:forEach var="list" items="${list}">
					<div class="col-lg-2 col-md-6">
						<!-- Card "data:image/png;base64,${images}" data:image/png;base64,${images}-->
						<div class="card">
							<img class="card-img-top img-fluid" src="<c:url value='/goods/goodsImage.do/${list.real_thumbnail}.png/1'/>"alt="Card image cap">
							<div class="card-body">
								<h4 class="card-title">${list.book_title}</h4>
								<p class="card-text">${list.price}</p>
								<a href="<c:url value='/goods/goodsView.do/${list.goods_id}'/>" class="btn btn-primary">보러가기</a>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
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
</body>
<script type="text/javascript">

</script>
</html>