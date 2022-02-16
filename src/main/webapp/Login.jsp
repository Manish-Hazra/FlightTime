<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Travel Thru Air</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		if(session.getAttribute("username")!=null){
			response.sendRedirect("listadmin");
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
				<li><a href="<%=request.getContextPath()%>/login"
					class="nav-link">Admin</a></li>
			</ul>
		</nav>
	</header>

	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
					<form action="login" method="post">
						<caption>
					<h2>
            			Admin Login
					</h2>
				</caption>

				<fieldset class="form-group">
					<label>Username:</label> <input type="text" class="form-control" name="username">
				</fieldset>
					<fieldset class="form-group">
					<label>Password:</label> <input type="password" class="form-control" name="password">
				</fieldset>
				<button type="submit" class="btn btn-success">Login</button>
				</form>
			</div>
		</div>
	</div>



</div>
</body>
</html>