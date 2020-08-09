<%@ page import="java.sql.*" %>
<% 
	if(request.getParameter("submit")!=null)
	{
	String reviews = request.getParameter("reviews");
	try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sudha","root","tiger");
	PreparedStatement ps = con.prepareStatement("insert into review(reviews) values(?)");
	ps.setString(1, reviews);
	int i = ps.executeUpdate();
	if(i>0)
	{
		System.out.println("hai this is sudhakar");
	}
	
	}
	catch(Exception e)
	{
		
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
</head>
<body>
<form method="post">

<div class="Header">

<textarea rows="5" cols="100" name="reviews"></textarea>
<input type="submit" name="submit" value="submit">

</div>



</form>

</body>
</html>