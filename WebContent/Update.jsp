<%@ page import="java.sql.*"%>
<%
	if (request.getParameter("submit") != null) {
		String id = request.getParameter("cid");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String description = request.getParameter("description");
		String image = request.getParameter("image");

		Connection con;
		PreparedStatement ps;
		ResultSet rs;

		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sudha", "root", "tiger");
		ps = con.prepareStatement(
				"update company set name=?,address=?,email=?,description=?,image=? where cid=?");
		ps.setString(1, name);
		ps.setString(2, address);
		ps.setString(3, email);
		ps.setString(4, description);
		ps.setString(5, image);
		ps.setString(6, id);
		int i = ps.executeUpdate();
		if (i > 0) {
			response.sendRedirect("Admin.jsp");
		}
	}
%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<style>
.col-sm-4 {
	border: 2px solid lightgray;
	border-radius: 4px;
	height: 55%;
	width: 35%;
}

.container {
	margin: auto;
	margin-left: 500px;
}

.col-sm-4 h1 {
	font-size: 20px;
	text-align: center;
	margin-bottom: 20px;
}

.center {
	margin: auto;
}
</style>
</head>
<body>
	<%
		if (session.getAttribute("uname") == null) {

			response.sendRedirect("login.jsp");
		}
	%>
	<nav class="navbar navbar-inverse">
		<input type="submit" value="logout"
			style="float: right; margin-top: 10px; margin-right: 30px;">
	</nav>
	<div class="container">
		<div class="col-sm-4">
			<%
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sudha", "root", "tiger");
				String id = request.getParameter("cid");
				PreparedStatement ps = con.prepareStatement("select *from company where cid=?");
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
			%>
			<h1>Update company</h1>
			<div class="center">
				<form method="post">
					<input type="text" class="form-control" name="name"
						value="<%=rs.getString("name")%>" placeholder="Company Name"
						required><br> <input type="text" class="form-control"
						name="address" value="<%=rs.getString("address")%>"
						placeholder="Address" required><br> <input
						type="email" class="form-control" name="email"
						value="<%=rs.getString("email")%>" placeholder="Email" required><br>
					<input type="text" class="form-control" name="description"
						value="<%=rs.getString("description")%>"
						placeholder="Description" required><br> <input
						type="file" class="form-control" name="image"
						value="<%=rs.getString("image")%>" placeholder="image" required><br>
					<%
						}
					%>
					<div class="form-group" align="right">
						<input type="submit" value="Add" name="submit" id="submit"
							class="btn btn-primary">
					</div>
				</form>
			</div>
		</div>