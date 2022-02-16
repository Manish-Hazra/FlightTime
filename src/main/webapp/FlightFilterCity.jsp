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

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">List of Filtered Flights</h3>
			<hr>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Departure City</th>
						<th>Arrival City</th>
						<th>Cost</th>
						<th>Departure Time</th>
						<th>Arrival Time</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach var="filterCityFlight" items="${filterCityFlight}">

						<tr>
							<td><c:out value="${filterCityFlight.id}" /></td>
							<td><c:out value="${filterCityFlight.departure_city}" /></td>
							<td><c:out value="${filterCityFlight.arrival_city}" /></td>
							<td><c:out value="${filterCityFlight.cost}" /></td>
							<td><c:out value="${filterCityFlight.departure_time}" /></td>
							<td><c:out value="${filterCityFlight.arrival_time}" /></td>
						</tr>
					</c:forEach>
		
				</tbody>

			</table>
		</div>
	</div>
</body>
</html>