<%@page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">

<style>
.col-sm-9 {
	margin: 0;
}

.col-sm-3 {
	margin: 0;
	border: 1px solid;
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
		<ul class="nav navbar-nav navbar-right">
			<li><a href="AddCompany.jsp"
				style="text-decoration: none; color: white;">Add Company</a></li>
			<li><form action="Logout" class="logout" method="post">
					<span class="glyphicon glyphicon-log-out" style="color: white;"></span>
					<button type="submit" value="logout"
						style="background: none; border: none; color: white; font-weight: bolder; margin-right: 30px; margin-top: 14px;">logout</button>
				</form></li>
		</ul>
	</nav>
	<div class="col-sm-12">
		<h1>Company Details</h1>
		<hr>
		<table id="admin" class="table table-responsive table-bordered"
			cell-padding="0">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Address</th>
					<th>Email</th>
					<th>Description</th>
					<th>Review</th>
					<th>Rating</th>
					<th>Image</th>

					<th>Edit</th>
					<th>Delete</th>
				</tr>

				<%
							Connection con;
							PreparedStatement ps;
							ResultSet rs;

							Class.forName("com.mysql.jdbc.Driver");
							con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sudha", "root", "tiger");
							String sql = "select *from company";
							Statement st = con.createStatement();
							rs = st.executeQuery(sql);

							while (rs.next()) {
								String cid = rs.getString("cid");
						%>
				<tr>
					<td><%=rs.getString("cid")%></td>
					<td><%=rs.getString("name")%></td>
					<td><%=rs.getString("address")%></td>
					<td><%=rs.getString("email")%></td>
					<td><%=rs.getString("description")%></td>
					<td><%=rs.getString("review")%></td>
					<td><%=rs.getString("ratings")%></td>
					<td><%=rs.getString("image")%></td>
					<td><a href="Update.jsp?cid=<%=rs.getString("cid")%>"><input
							type="submit" class="btn btn-warning" value="Edit"></a></td>
					<td><a href="Delete.jsp?cid=<%=rs.getString("cid")%>"><input
							type="submit" class="btn btn-danger" value="Delete"></a></td>
				</tr>

				<%
							}
						%>
			
		</table>
	</div>
	<div class="footer"
		style="padding: 8px; background-color: #cfe2d9	; margin-top: 10px;">
		<P style="color: BLACK; text-align: center; font-size: 34px; font-style:oblique;">
			<b>Created by Sudhakar 2020</b>
		</P>
	</div>
</body>
</html>
