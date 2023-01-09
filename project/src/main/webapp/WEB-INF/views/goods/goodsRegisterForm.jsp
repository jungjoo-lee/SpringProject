<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 등록</title>
</head>
<body>
	<div class="card-body">
		<h4 class="card-title mb-3">Default Tabs</h4>

		<ul class="nav nav-tabs mb-3">
			<li class="nav-item">
				<a href="#home" data-toggle="tab" aria-expanded="false" class="nav-link">
				<i class="mdi mdi-home-variant d-lg-none d-block mr-1"></i>
				<span class="d-none d-lg-block">Home</span></a>
			</li>
			<li class="nav-item">
				<a href="#profile" data-toggle="tab" aria-expanded="true" class="nav-link active">
				<i class="mdi mdi-account-circle d-lg-none d-block mr-1"></i>
				<span class="d-none d-lg-block">Profile</span></a>
			</li>
			<li class="nav-item">
				<a href="#settings" data-toggle="tab" aria-expanded="false" class="nav-link">
				<i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
				<span class="d-none d-lg-block">Settings</span></a>
			</li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane" id="home">
				<form class="mt1">
                    <div class="form-group">
                    	<textarea class="form-control" rows="3"></textarea>
                	</div>
                </form>
			</div>
			<div class="tab-pane show active" id="profile">
           		<input type="text">
			</div>
            <div class="tab-pane" id="settings">
				<input type="text">
			</div>
		</div>
	</div>
</body>
</html>