<%@ page import="java.sql.*"%>
<%
	if (request.getParameter("submit") != null) {
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sudha", "root", "tiger");
		PreparedStatement ps = con.prepareStatement("update users set pass=? where email=?");
		ps.setString(1, pass);
		ps.setString(2, email);
		int i = ps.executeUpdate();
		if (i > 0) {
			response.sendRedirect("login.jsp");
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
body {
	margin: 0;
	padding: 0;
}

.change {
	margin: auto;
	margin-top: 20px;
	border: 2px solid lightgray;
	border-radius: 14px;
	width: 28%;
}

.change h2 {
	text-align: center;
	font-size: 20px;
	padding: 3px;
	font-weight: bold;
}

.form-group {
	width: 90%;
	height: 40%;
	margin-left: 20px;
	border: 2px solid groove;
	border-radius: 4px;
}
input:required:valid {
	border-color: green;
}
</style>
<script>

</script>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<h4>
			<a href="Home.jsp" style="color: white; margin-left: 30px;">Company Review</a>
		</h4>
	</nav>
	<div class="change">
		<h2>Change Password</h2>

		<div class="form-group">
			<form method="post">
				<input type="email" placeholder="email" class="form-control" name="email" required><br>
					 <input type="password" placeholder="New password" class="form-control" name="pass" required><br>
				<input type="submit" name="submit" class="btn btn-primary">
			</form>
		</div>
	</div>
<div class="footer"
		style="padding: 8px; background-color: #cfe2d9	; margin-top: 10px;">
		<P style="color: BLACK; text-align: center; font-size: 34px; font-style:oblique;">
			<b>Created by Sudhakar 2020</b>
		</P>
	</div>
</body>
</html>