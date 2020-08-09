<%@page import="java.sql.*" %>
<% 
	if(request.getParameter("search")!=null)
	{
	String search = request.getParameter("search");
		
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sudha","root","tiger");
	PreparedStatement ps = con.prepareStatement("select * from company");
	ResultSet rs = ps.executeQuery();
	rs.next();
	rs.getString("name");
	}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Company Reviews</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
body {
	font-size: 100%;
}
.col-sm-4 {
	height: 370px;
	margin-top: 20px;
}
.paragraph {
	padding:5px;
	line-height:25px;
}
</style>
</head>
<body>
	<%@ include file="Header.jsp"%>
	<div class="container">
	 <div class="jumbotron text-center" style="padding:120px; margin:0;background-color:#ccffcc;">
         <h3><b>Company Reviews</b></h3>
            <form class="form-inline" method="post" action="#"> 
            <div class="input-group">
            <input type="text" placeholder="Search for a company" class="form-control" size="50" required>
            <div class="input-group-btn">
            <input type="submit" class="btn btn-primary" name="search" value="Search">               
     </div>
    </div>
    </form>
        </div>
		</div>
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
			<div class="thumbnail" style="height:370px;">
			 <div class="img text-center">
			 <img
				src="<%=rs.getString("image")%>" width="100" height="60" style="margin-top:10px;">
			</div>
			<br/>
			<div align="justify" class="paragraph">
			<%=rs.getString("description") %>
			</div><br>
			<div class="button text-center">
			<a href="login.jsp">
				<button type="button" class="btn btn-danger">Read More</button></a>
			</div>
			</div>
		</div>
		<% 
  }
  %>
  </div>
	
	<div class="footer"
		style="padding: 8px; background-color: #cfe2d9; margin-top: 10px;">
		<P style="color: BLACK; text-align: center; font-size: 34px; font-style:oblique;">
			<b>Created by Sudhakar 2020</b>
		</P>
	</div>
</body>
</html>