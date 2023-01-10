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
							<img class="card-img-top img-fluid" src="<c:url value='/goods/goodsImage.do/${list.real_thumbnail}.png'/>"alt="Card image cap">
							<div class="card-body">
								<h4 class="card-title">${list.book_title}</h4>
								<p class="card-text">${list.price}</p>
								<a href="javascript:void(0)" class="btn btn-primary">Go	somewhere</a>
							</div>
						</div>
					</div>
				</c:forEach>
					<div class="col-lg-2 col-md-6">
						<!-- Card -->
						<div class="card">
							<img class="card-img-top img-fluid"	src="<c:url value='/resources/images/img2.jpg'/>" alt="Card image cap">
							<div class="card-body">
								<h4 class="card-title">Card title</h4>
								<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
								<a href="javascript:void(0)" class="btn btn-primary">Go	somewhere</a>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-md-6">
						<!-- Card -->
						<div class="card">
							<img class="card-img-top img-fluid"	src="<c:url value='/resources/images/img3.jpg'/>" alt="Card image cap">
							<div class="card-body">
								<h4 class="card-title">Card title</h4>
								<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
								<a href="javascript:void(0)" class="btn btn-primary">Go	somewhere</a>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-md-6 img-fluid">
						<!-- Card -->
						<div class="card">
							<img class="card-img-top img-fluid"	src="<c:url value='/resources/images/img4.jpg'/>" alt="Card image cap">
							<div class="card-body">
								<h4 class="card-title">Card title</h4>
								<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
								<a href="javascript:void(0)" class="btn btn-primary">Go	somewhere</a>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-md-6 img-fluid">
						<!-- Card -->
						<div class="card">
							<img class="card-img-top img-fluid"	src="<c:url value='/resources/images/img5.jpg'/>" alt="Card image cap">
							<div class="card-body">
								<h4 class="card-title">Card title</h4>
								<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
								<a href="javascript:void(0)" class="btn btn-primary">Go	somewhere</a>
							</div>
						</div>
					</div>
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