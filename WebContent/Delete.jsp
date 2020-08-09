<%@ page import="java.sql.*"%>
<%if(session.getAttribute("uname")==null)
		{

			response.sendRedirect("login.jsp");
		}
	%>
<%
	String cid = request.getParameter("cid");

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sudha","root","tiger");
	
	PreparedStatement ps = con.prepareStatement("delete from company where cid=?");
	ps.setString(1,cid);
	int i = ps.executeUpdate();

	if(i>0)
	{
		response.sendRedirect("Admin.jsp");
	}
%>