<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>User Management Application</title>
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
				<a href="/UserManagement" class="navbar-brand"> User Management Application </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Users</a></li>
			</ul>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${flight != null}">
					<form action="update" method="post">
				</c:if>
				<c:if test="${flight == null}">
					<form action="insert" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${flight != null}">
            			Edit Flight
            		</c:if>
						<c:if test="${flight == null}">
            			Add New Flight
            		</c:if>
					</h2>
				</caption>

				<c:if test="${flight != null}">
					<input type="hidden" name="id" value="<c:out value='${flight.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Departure City</label> <input type="text"
						value="<c:out value='${flight.departure_city}' />" class="form-control"
						name="departure_city" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Arrival City</label> <input type="text"
						value="<c:out value='${flight.arrival_city}' />" class="form-control"
						name="arrival_city">
				</fieldset>

				<fieldset class="form-group">
					<label>Cost</label> <input type="text"
						value="<c:out value='${flight.cost}' />" class="form-control"
						name="cost">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Start time</label> <input type="time"
						value="<c:out value='${flight.start_time}' />" class="form-control"
						name="start_time">
				</fieldset>
				
				<fieldset class="form-group">
					<label>End Time</label> <input type="time"
						value="<c:out value='${flight.end_time}' />" class="form-control"
						name="end_time">
				</fieldset>

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>