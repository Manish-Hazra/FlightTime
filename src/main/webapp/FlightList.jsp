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
	<% 
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	
		if(session.getAttribute("username")==null){
			response.sendRedirect("Login.jsp");
		}
	%>

		<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: blue">
			<div>
				<a href="/UserManagement" class="navbar-brand"> Travel Thru Air </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Flights</a></li>
				<li><a href="<%=request.getContextPath()%>/logout"
					class="nav-link">Logout</a></li>
			</ul>
		</nav>
	</header>
	<br>

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">List of Flights</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add
					New Flight</a>
			</div>
			<br>
			<table class="table">
				<tbody>
				<tr>
				
					<c:forEach var="listFlight" items="${listFlight}">
						<td>
						<div class="card" style="width: 16rem; display: flex;">
						  <div class="card-body">
						    <h5 class="card-title"><c:out value="${listFlight.departure_city}" /> - <c:out value="${listFlight.arrival_city}" /></h5>
						    <h6 class="card-subtitle mb-2 text-muted">Rs. <c:out value="${listFlight.cost}" /></h6>
						    <p class="card-text">Departure : <c:out value="${listFlight.departure_time}" /> . . .  Arrival : <c:out value="${listFlight.arrival_time}" /></p>
						    <h6 class="card-subtitle mb-2 text-muted"><c:out value="${listFlight.stops}" /></h6>
						  </div>
						</div>
						
						</td>
						
					</c:forEach>
					</tr>
		
				</tbody>

			</table>
		</div>
	</div>
</body>
</html>