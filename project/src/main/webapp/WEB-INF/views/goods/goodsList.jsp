<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<div class="col-lg-3 col-md-6">
						<!-- Card -->
						<div class="card">
							<img class="card-img-top img-fluid" src="<c:url value='/resources/images/img1.jpg'/>" alt="Card image cap">
							<div class="card-body">
								<h4 class="card-title">Card title</h4>
								<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
								<a href="javascript:void(0)" class="btn btn-primary">Go	somewhere</a>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
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
					<div class="col-lg-3 col-md-6">
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
					<div class="col-lg-3 col-md-6 img-fluid">
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
					<div class="col-lg-3 col-md-6 img-fluid">
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
					<li class="page-item"><a class="page-link" id="Prev">Prev</a></li>
					<li class="page-item">
						<a class="page-link">1</a>
					</li>
					<li class="page-item">
						<a class="page-link">2</a>
					</li>
					<li class="page-item">
						<a class="page-link">3</a>
					</li>
					<li class="page-item">
						<a class="page-link">4</a>
					</li>
					<li class="page-item">
						<a class="page-link">5</a>
					</li>
					<li class="page-item">
						<a class="page-link">6</a>
					</li>
					<li class="page-item">
						<a class="page-link">7</a>
					</li>
					<li class="page-item">
						<a class="page-link">8</a>
					</li>
					<li class="page-item">
						<a class="page-link">9</a>
					</li>
					<li class="page-item">
						<a class="page-link">10</a>
					</li>
				<li class="page-item"><a class="page-link" id="Next">Next</a></li>
			</ul>
			</nav>
		</div>
	</div>
</body>
</html>