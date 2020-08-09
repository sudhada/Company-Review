<%@ page import="java.sql.*"%>
<%
	if (request.getParameter("submit") != null) {
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String description = request.getParameter("description");
		String review = request.getParameter("review");
		String image = request.getParameter("image");

		Connection con;
		PreparedStatement ps;
		ResultSet rs;

		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sudha", "root", "tiger");
		ps = con.prepareStatement(
				"insert into company(name,address,email,description,review,image) values(?,?,?,?,?,?)");
		ps.setString(1, name);
		ps.setString(2, address);
		ps.setString(3, email);
		ps.setString(4, description);
		ps.setString(5, review);
		ps.setString(6, image);
		int i = ps.executeUpdate();
		if (i > 0) {
			response.sendRedirect("Admin.jsp");
		}
	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<style>
.col-sm-5 {
	box-shadow: 2px 2px 3px 1px grey;
	margin-left: 300px;
}
</style>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

		if (session.getAttribute("uname") == null) {
			response.sendRedirect("login.jsp");
		}
	%>
	<nav class="navbar navbar-inverse">
		<form action="Logout" class="logout" method="post">
			<button type="submit" value="logout"
				style="background: none; border: none; float: right; margin-right: 20px; margin-top: 12px; color: white; font-weight: bolder;">
				<span class="glyphicon glyphicon-log-out" style="color: white;"></span>logout
			</button>
		</form>

	</nav>

	<div class="container">
		<div class="col-sm-5">
			<h1>Add company</h1>
			<hr>
			<form method="post">
				<div class="form-group">
					<input type="text" class="form-control" name="name"
						placeholder="Company Name" required><br> <input
						type="text" class="form-control" name="address"
						placeholder="Address" required><br> <input
						type="email" class="form-control" name="email" placeholder="Email"
						required><br>
					<textarea rows="4" class="form-control" name="description"
						placeholder="Description" required></textarea>
					<br>
					<textarea rows="2" class="form-control" name="review"
						placeholder="Review" required></textarea>
				</div>
				<input type="file" name="image" placeholder="image" required><br>
				<div class="form-group">
					<input type="submit" value="submit" name="submit" id="submit"
						class="btn btn-primary">
				</div>
			</form>
		</div>
	</div>
</body>
</html>