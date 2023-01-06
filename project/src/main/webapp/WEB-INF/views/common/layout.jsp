<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" type="image/png" sizes="16x16" href="<c:url value='/resources/images/favicon.png'/>">
	<link href="<c:url value='/resources/css/style.min.css'/>" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
	<div id="header">
		<tiles:insertAttribute name="header" />
	</div>
	<div id="sidebar-left">
		<tiles:insertAttribute name="side" />
	</div>
	<div id="content" class="page-wrapper">
		<tiles:insertAttribute name="body" />
	</div>
	<div id="footer">
		<tiles:insertAttribute name="footer" />
	</div>
</div>
<script src="<c:url value='/resources/js/header/jquery.min.js'/>"></script>
    <!-- Bootstrap tether Core JavaScript -->
<script src="<c:url value='/resources/js/header/popper.min.js'/>"></script>
<script src="<c:url value='/resources/js/header/bootstrap.min.js'/>"></script>
    <!-- apps -->
    <!-- apps -->
<script src="<c:url value='/resources/js/header/app-style-switcher.js'/>"></script>
<script src="<c:url value='/resources/js/header/feather.min.js'/>"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
<script src="<c:url value='/resources/js/header/perfect-scrollbar.jquery.min.js'/>"></script>
<script src="<c:url value='/resources/js/header/sparkline.js'/>"></script>
    <!--Wave Effects -->
    <!-- themejs -->
<!--Custom JavaScript -->
<script src="<c:url value='/resources/js/header/custom.min.js'/>"></script>
</body>
</html>