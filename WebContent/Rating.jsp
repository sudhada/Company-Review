<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		
		String star = request.getParameter("star");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sudha", "root", "tiger");
		Class.forName("com.mysql.jdbc.Driver");
		PreparedStatement ps = con.prepareStatement("insert into rating(ratings) values(?)");
		ps.setString(1,star);
		ps.executeUpdate();	
		response.sendRedirect("Rating.html");
	%>
	
</body>
</html>