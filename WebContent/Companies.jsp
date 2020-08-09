<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
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
.logout {
	float: right;
	margin-top: 15px;
	margin-right: 30px;
}

body {
	font-size: 100%;
}
p {
	color: black;
	font-size:14px;
}
.thumbnail {
	border:2px solid #d9b3ff;
	border-radius:6px;
}
.paragraph, .button {
	padding:6px;
}
</style>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		if(session.getAttribute("uname")==null)
		{
			response.sendRedirect("login.jsp");
		}
%>
	<%@ page import="java.sql.*"%>
	<%
		String driver="com.mysql.jdbc.Driver";
		String username = "root";
		String password = "tiger";
		String url = "jdbc:mysql://localhost:3306/sudha";
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
		<%@ page import="java.sql.*"%>
		<%
  	Class.forName("com.mysql.jdbc.Driver");
  	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sudha","root","tiger");
  	PreparedStatement ps = con.prepareStatement("select *from company");
  	ResultSet rs = ps.executeQuery();
  	while(rs.next())
  	{
  	%>
  	<div class="col-sm-4">
	<div class="thumbnail" style="height:330px;">
	 <div class="img text-center">
	 <img
		src="<%=rs.getString("image")%>" width="100" height="60">
	</div>
	<br>
	<br/>
	<div align="justify" class="paragraph">
	<p><%=rs.getString("description") %></p>
	</div>
	<div class="button">
		<a href="Content.jsp?cid=<%=rs.getString("cid") %>">
		<button type="button" class="btn btn-info">Write Review</button>
		
		</a>
	</div>
	</div>
	</div>
<%
}
%>
	</div>
	<div class="footer"
		style="padding: 8px; background-color: #cfe2d9	; margin-top: 10px;">
		<P style="color: BLACK; text-align: center; font-size: 34px; font-style:oblique;">
			<b>Created by Sudhakar 2020</b>
		</P>
	</div>
 </body>
</html>