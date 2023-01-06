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
					<a class="nav-link dropdown-toggle pl-md-3 position-relative" href="javascript:void(0)" id="bell" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<span><i data-feather="bell" class="svg-icon"></i></span>
						<span class="badge badge-primary notify-no rounded-circle">5</span>
					</a>
					<div class="dropdown-menu dropdown-menu-left mailbox animated bounceInDown">
						<ul class="list-style-none">
							<li>
								<div class="message-center notifications position-relative">
									<!-- Message -->
									<a href="javascript:void(0)" class="message-item d-flex align-items-center border-bottom px-3 py-2">
										<div class="btn btn-danger rounded-circle btn-circle">
											<i data-feather="airplay" class="text-white"></i>
										</div>
										<div class="w-75 d-inline-block v-middle pl-2">
											<h6 class="message-title mb-0 mt-1">Luanch Admin</h6>
											<span class="font-12 text-nowrap d-block text-muted">Just see the my new admin!</span>
											<span class="font-12 text-nowrap d-block text-muted">9:30 AM</span>
										</div>
									</a>
									<!-- Message -->
									<a href="javascript:void(0)" class="message-item d-flex align-items-center border-bottom px-3 py-2">
										<span class="btn btn-success text-white rounded-circle btn-circle"><i data-feather="calendar" class="text-white"></i></span>
										<div class="w-75 d-inline-block v-middle pl-2">
											<h6 class="message-title mb-0 mt-1">Event today</h6>
											<span class="font-12 text-nowrap d-block text-muted text-truncate">Just a reminder that you have event</span>
											<span class="font-12 text-nowrap d-block text-muted">9:10 AM</span>
										</div>
									</a>
									<!-- Message -->
									<a href="javascript:void(0)" class="message-item d-flex align-items-center border-bottom px-3 py-2">
										<span class="btn btn-info rounded-circle btn-circle"><i data-feather="settings" class="text-white"></i></span>
										<div class="w-75 d-inline-block v-middle pl-2">
											<h6 class="message-title mb-0 mt-1">Settings</h6>
											<span class="font-12 text-nowrap d-block text-muted text-truncate">You can customize this template as you want</span>
											<span class="font-12 text-nowrap d-block text-muted">9:08 AM</span>
										</div>
									</a>
									<!-- Message -->
									<a href="javascript:void(0)" class="message-item d-flex align-items-center border-bottom px-3 py-2">
										<span class="btn btn-primary rounded-circle btn-circle"><i data-feather="box" class="text-white"></i></span>
										<div class="w-75 d-inline-block v-middle pl-2">
											<h6 class="message-title mb-0 mt-1">Pavan kumar</h6>
											<span class="font-12 text-nowrap d-block text-muted">Just see the my admin!</span>
											<span class="font-12 text-nowrap d-block text-muted">9:02 AM</span>
										</div>
									</a>
								</div>
							</li>
							<li><a class="nav-link pt-3 text-center text-dark" href="javascript:void(0);">
								<strong>Check all notifications</strong><i class="fa fa-angle-right"></i></a>
							</li>
						</ul>
					</div>
				</li>
			</ul>

			<ul class="navbar-nav float-right">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="javascript:void(0)" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<img src="<c:url value='/resources/images/profile-pic.jpg'/>" alt="user" class="rounded-circle" width="40">
						<span class="ml-2 d-none d-lg-inline-block"><span>Hello,</span>
						<span class="text-dark">Jason Doe</span><i data-feather="chevron-down" class="svg-icon"></i></span>
					</a>
					<div class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
						<c:if test="${!empty userVO}">
						<a class="dropdown-item" href="<c:url value='/user/userView.do'/>"><i data-feather="user" class="svg-icon mr-2 ml-1"></i>회원 정보</a>
						<a class="dropdown-item" href="javascript:void(0)"><i data-feather="credit-card" class="svg-icon mr-2 ml-1"></i>My Balance</a>
						<a class="dropdown-item" href="javascript:void(0)"><i data-feather="mail" class="svg-icon mr-2 ml-1"></i>Inbox</a>
						
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="javascript:void(0)"><i data-feather="settings" class="svg-icon mr-2 ml-1"></i>Account Setting</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="<c:url value='/user/logout.do'/>"><i data-feather="power" class="svg-icon mr-2 ml-1"></i>Logout</a>
						<div class="dropdown-divider"></div>
						<div class="pl-4 p-3">
							<a href="javascript:void(0)" class="btn btn-sm btn-info">View Profile</a>
						</div>
						</c:if>
						<!--  -->
						<c:if test="${empty userVO}">
							<a class="dropdown-item" href="<c:url value='/user/loginForm.do'/>"><i data-feather="user" class="svg-icon mr-2 ml-1"></i>로그인</a>
							<a class="dropdown-item" href="<c:url value='/user/registerForm.do'/>"><i data-feather="credit-card" class="svg-icon mr-2 ml-1"></i>회원가입</a>
						</c:if>
					</div>
				</li>
			</ul>
		</div>
	</nav>
</header>