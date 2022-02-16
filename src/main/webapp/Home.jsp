<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Travel Thru Air</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>

<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: blue">
			<div>
				<a href="/UserManagement" class="navbar-brand"> Travel Thru Air </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Flights</a></li>
				<li><a href="<%=request.getContextPath()%>/login"
					class="nav-link">Admin</a></li>
			</ul>
		</nav>
	</header>
	<br>

	 <div class="landing-page" style="background: white url('https://images.pexels.com/photos/62623/wing-plane-flying-airplane-62623.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940') no-repeat scroll center; background-size: cover; height: 100vh; color: #c8cfcf;">
                <div class="wrapper" style="background-color: rgba(0,0,0,0.7); height: 100%">
		<div class="d-flex flex-column justify-content-center align-items-center text-center h-100" >
                        <h5 class="display-4 animated zoomIn">WELCOME TO <strong>Travel Thru Air</strong></h5>
                        <p class="animated zoomIn">Be ready! We are gonna fly higher this time!</p>
                    </div>
		</div>
		</div>
		</div>
	</div>
</body>
</html>