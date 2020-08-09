<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	if (request.getParameter("submit") != null) {
		String review = request.getParameter("review");
		String star = request.getParameter("star");
		String id = request.getParameter("cid");
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sudha", "root", "tiger");
		PreparedStatement	ps = con.prepareStatement( "update company set review=?, ratings=? where cid=" + id);
		ps.setString(1, review);
		ps.setString(2, star);
		ps.executeUpdate();
	}
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
</style>

</head>
<style>
.logout {
	float: right;
	margin-top: 15px;
	margin-right: 30px;
}

.col-sm-8 {
	padding: 10px;
	margin-left: 160px;
}
img {
	width: 50%;
	height: 10%;
}
.checked {
	color: orange;
}
div.stars {
	display: inline-block;
}
input.star {
	display: none;
}
label.star {
	float: right;
	padding: 2px;
	font-size: 16px;
	color: #444;
}
input.star:checked ~ label.star:before {
	content: '\f005';
	color: #FD4;
}
input.star-5:checked ~ label.star:before {
	color: #FD4;
}
input.star-1:checked ~ label.star:before {
	color: #F62;
}
label.star:before {
	content: '\f006';
	font-family: FontAwesome;
}
.col-sm-8 {
	border:1px solid grey;
	box-shadow:2px 2px 2px 2px grey;
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
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="Home.jsp">Company Reviews</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><h4
						style="font-size: 14px; color: white; float: right; margin-top: 20px; margin-right: 20px; font-weight: bolder;">${uname }</h4>
				<li><form action="Logout" class="logout" method="post">
						<span class="glyphicon glyphicon-log-out"
							style="color: white; font-size: 14px;"></span>
						<button type="submit" value="logout"
							style="background: none; border: none; font-size: 14px; color: white; font-weight: bolder;">logout</button>
					</form></li>
			</ul>
		</div>
	</nav>
	<div class="container">
	<%
		String driver = "com.mysql.jdbc.Driver";
		Class.forName(driver);
		String url = "jdbc:mysql://localhost:3306/sudha";
		String username = "root";
		String password = "tiger";
		String id = request.getParameter("cid");

		Connection con = DriverManager.getConnection(url, username, password);
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select *from company where cid=" + id);
		while (rs.next()) {
	%>
				<div class="col-sm-8">
				<div class="row">
				<div class="col-sm-4">
				<img src="<%=rs.getString("image")%>">
				<%=rs.getString("ratings") %>
				</div> 
				</div>
				</div>
				<div class="col-sm-8">
				<div align="justify">
				<br>
				<%=rs.getString("description")%>
				</div>
				<br> <br>

				<h4>Write a review</h4>
				<form method="post">
					<div class="stars">
						<input class="star star-5" id="star-5-2" type="radio" name="star" value="5.0" />
						<label class="star star-5" for="star-5-2"></label>
						<input class="star star-4" id="star-4-2" type="radio" name="star" value="4.0"/>
						<label class="star star-4" for="star-4-2"></label>
						<input class="star star-3" id="star-3-2" type="radio" name="star" value="3.0" />
						<label class="star star-3" for="star-3-2"></label>
						<input class="star star-2" id="star-2-2" type="radio" name="star" value="2.0" />
						<label class="star star-2" for="star-2-2"></label>
						<input class="star star-1" id="star-1-2" type="radio" name="star" value="1.0"/>
						<label class="star star-1" for="star-1-2"></label>
					</div>
					<textarea class="form-control" rows="5" id="review" required
						name="review"></textarea>
					<br> <input type="submit" class="btn btn-primary"
						name="submit">
					<hr>
				</form>
				<div class="media">
					<div class="media-left">
						<img src="img_avatar1.png" class="media-object img-circle"
							style="width: 60px;">

					</div>
					<div class="media-body">
						<div class="media-heading">

							<b>${uname }</b> <br> <br />
							<div align="justify">
							<%=rs.getString("review")%><br>
						</div>
						</div>
						</div>
					</div>
					</div>
					
					<%
						}
					%>
					</div>
	<div class="footer"
		style="padding: 8px; background-color: #cfe2d9	; margin-top:30px;">
		<P style="color: BLACK; text-align: center; font-size: 34px; font-style:oblique;">
			<b>Created by Sudhakar 2020</b>
		</P>
	</div>
</body>
</html>