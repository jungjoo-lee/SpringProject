<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header class="topbar" data-navbarbg="skin6">
	<nav class="navbar top-navbar navbar-expand-md">
		<div class="navbar-header" data-logobg="skin6">
			<a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
			<div class="navbar-brand">
				<a href="<c:url value='/main/userMain.do'/>"> <b class="logo-icon">
					<img src="<c:url value='/resources/images/logo-icon.png'/>" alt="homepage" class="dark-logo" />
					<img src="<c:url value='/resources/images/logo-icon.png'/>" alt="homepage" class="light-logo" />
				</b><span class="logo-text">
					<img src="<c:url value='/resources/images/logo-text.png'/>"	alt="homepage" class="dark-logo" />
					<img src="<c:url value='/resources/images/logo-light-text.png'/>" class="light-logo" alt="homepage" />
				</span>
				</a>
			</div>
			<a class="topbartoggler d-block d-md-none waves-effect waves-light"	href="javascript:void(0)" data-toggle="collapse"
				data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i class="ti-more"></i></a>
		</div>

		<div class="navbar-collapse collapse" id="navbarSupportedContent">
			<ul class="navbar-nav float-left mr-auto ml-3 pl-1">
				<!-- Notification -->
				<li class="nav-item dropdown">
					
				</li>
			</ul>
			
			<ul class="navbar-nav float-right">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="javascript:void(0)" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="bi bi-person-circle"></i>
						<span class="ml-2 d-none d-lg-inline-block"><span>Hello,</span>
						<c:if test="${!empty userVO}">
							<span class="text-dark">${userVO.name}</span><i data-feather="chevron-down" class="svg-icon"></i></span>
						</c:if>
					</a>
					<div class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
						<c:if test="${!empty userVO}">
						<a class="dropdown-item" href="<c:url value='/user/userView.do'/>"><i data-feather="user" class="svg-icon mr-2 ml-1"></i>회원 정보</a>
						<a class="dropdown-item" href="<c:url value='/user/logout.do'/>"><i data-feather="power" class="svg-icon mr-2 ml-1"></i>로그아웃</a>
						</c:if>
						<!--  -->
						<c:if test="${empty userVO && empty adminLogin}">
							<a class="dropdown-item" href="<c:url value='/user/loginForm.do'/>"><i data-feather="user" class="svg-icon mr-2 ml-1"></i>로그인</a>
							<a class="dropdown-item" href="<c:url value='/user/registerForm.do'/>"><i data-feather="credit-card" class="svg-icon mr-2 ml-1"></i>회원가입</a>
						</c:if>
						<c:if test="${!empty adminLogin && empty userVO}">
							<a class="dropdown-item" href="<c:url value='/user/logout.do'/>"><i data-feather="power" class="svg-icon mr-2 ml-1"></i>로그아웃</a>
						</c:if>
					</div>
				</li>
			</ul>
		</div>
	</nav>
</header>