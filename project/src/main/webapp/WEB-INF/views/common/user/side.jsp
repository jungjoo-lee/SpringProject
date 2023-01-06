<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<aside class="left-sidebar" data-sidebarbg="skin6">
	<!-- Sidebar scroll-->
	<div class="scroll-sidebar" data-sidebarbg="skin6">
		<!-- Sidebar navigation-->
		<nav class="sidebar-nav">
			<ul id="sidebarnav">
				<li class="sidebar-item"><a class="sidebar-link sidebar-link" href="<c:url value='/main/userMain.do'/>" aria-expanded="false">
					<i data-feather="home"	class="feather-icon"></i>
					<span class="hide-menu"><strong>Home</strong></span></a>
				</li>
				
				<li class="list-divider"></li>
				
				<c:if test="${!empty userVO}">
				<li class="nav-small-cap"><span class="hide-menu"><strong>내 정보</strong></span></li>
				<li class="sidebar-item"><a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
					<i data-feather="file-text" class="feather-icon"></i>
					<span class="hide-menu">내 정보 보기</span></a>
					
					<ul aria-expanded="false" class="collapse  first-level base-level-line">
						<li class="sidebar-item"><a href="<c:url value='/user/userView.do'/>" class="sidebar-link"><span class="hide-menu">회원 정보</span></a></li>
						<%-- <li class="sidebar-item"><a href="<c:url value='/user/updateForm.do'/>" class="sidebar-link"><span class="hide-menu">회원 수정</span></a></li> --%>
						<%-- <li class="sidebar-item"><a href="<c:url value='/user/userView.do'/>" class="sidebar-link"><span class="hide-menu">회원 탈퇴</span></a></li> --%>
					</ul>
				</li>
				
				<li class="list-divider"></li>
				</c:if>
				
				<li class="nav-small-cap"><span class="hide-menu"><strong>도서 정보</strong></span></li>
				<li class="sidebar-item"><a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
					<i data-feather="file-text" class="feather-icon"></i>
					<span class="hide-menu">도서 목록</span></a>
					
					<ul aria-expanded="false" class="collapse  first-level base-level-line">
						<li class="sidebar-item"><a href="<c:url value='/admin/sdfList.do'/>" class="sidebar-link"><span class="hide-menu">전제 보기</span></a></li>
						<li class="sidebar-item"><a href="<c:url value='ㅁㄴㅇㄹ.do'/>" class="sidebar-link"><span class="hide-menu">베스트 셀러</span></a></li>
						<li class="sidebar-item"><a href="<c:url value='d'/>" class="sidebar-link"><span class="hide-menu">신상 도서</span></a></li>
						<li class="sidebar-item"><a href="<c:url value='s'/>" class="sidebar-link"><span class="hide-menu">도서</span></a></li>
						<li class="sidebar-item"><a href="<c:url value='ㄴㅁㅇㄹ.do'/>" class="sidebar-link"><span class="hide-menu">도서</span></a></li>
					</ul>
				</li>
				
				<li class="list-divider"></li>

				<li class="nav-small-cap"><span class="hide-menu"><strong>주문 정보</strong></span></li>
				<li class="sidebar-item"><a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
					<i data-feather="crosshair" class="feather-icon"></i><span class="hide-menu">주문</span></a>
					
					<ul aria-expanded="false" class="collapse first-level base-level-line">
						<li class="sidebar-item"><a href="javascript:void(0)" class="sidebar-link"><span class="hide-menu">주문 목록</span></a></li>
						<li class="sidebar-item"><a href="javascript:void(0)" class="sidebar-link"><span class="hide-menu">장바구니</span></a></li>
					</ul>
				</li>
				
				<li class="list-divider"></li>

				<!-- <li class="nav-small-cap"><span class="hide-menu"><strong>배송 정보</strong></span></li>
				<li class="sidebar-item"><a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
					<i data-feather="crosshair" class="feather-icon"></i><span class="hide-menu">배송</span></a>
					
					<ul aria-expanded="false" class="collapse first-level base-level-line">
						<li class="sidebar-item"><a href="javascript:void(0)" class="sidebar-link"><span class="hide-menu">item 1.1</span></a></li>
						<li class="sidebar-item"><a href="javascript:void(0)" class="sidebar-link"><span class="hide-menu">item 1.2</span></a></li>
						<li class="sidebar-item"><a href="javascript:void(0)" class="sidebar-link"><span class="hide-menu">item 1.4</span></a></li>
					</ul>
				</li>
				
				<li class="list-divider"></li> -->
				
				<li class="nav-small-cap"><span class="hide-menu">게시판</span></li>
				<li class="sidebar-item"><a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
					<i data-feather="file-text" class="feather-icon"></i>
					<span class="hide-menu">게시판 목록</span></a>
					
					<ul aria-expanded="false" class="collapse  first-level base-level-line">
						<li class="sidebar-item"><a href="<c:url value='d'/>" class="sidebar-link"><span class="hide-menu">전체 보기</span></a></li>
						<li class="sidebar-item"><a href="<c:url value='d'/>" class="sidebar-link"><span class="hide-menu">공지사항</span></a></li>
						<li class="sidebar-item"><a href="<c:url value='d'/>" class="sidebar-link"><span class="hide-menu">일반게시판</span></a></li>
						<li class="sidebar-item"><a href="<c:url value='d'/>" class="sidebar-link"><span class="hide-menu">Q&A</span></a></li>
					</ul>
				</li>
				
				<li class="list-divider"></li>
				
				<li class="nav-small-cap"><span class="hide-menu">로그아웃</span></li>
				<li class="sidebar-item"><a class="sidebar-link sidebar-link" href="<c:url value="/user/logout.do"/>" aria-expanded="false">
					<i data-feather="log-out" class="feather-icon"></i><span class="hide-menu">Logout</span></a></li>
			</ul>
		</nav>
	</div>
</aside>
<script src="<c:url value='/resources/js/side/sidebarmenu.js'/>"></script>