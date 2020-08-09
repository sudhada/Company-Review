package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

import java.sql.*;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
			String uname = request.getParameter("uname");
			String pass = request.getParameter("pass");
			
			Login login = new Login();
			
					try {
						
					if(uname.equals("admin") && pass.equals("admin"))
					{
						HttpSession session = request.getSession();
						session.setAttribute("uname", uname);
						response.sendRedirect("Admin.jsp");
					}
					else if(login.check(uname, pass)) {
						HttpSession session = request.getSession();
						session.setAttribute("uname", uname);
												
						response.sendRedirect("Companies.jsp");
						
					}
					else
					{
						response.sendRedirect("login.jsp");
					} 
					}catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
	}
	String sql = "select *from users where name= ? and pass = ?";
	String url = "jdbc:mysql://localhost:3306/sudha";
	String username = "root";
	String password = "tiger";

	public boolean check(String uname, String pass) throws SQLException {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, uname);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
			ps.close();
			con.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;

	}


	

}
